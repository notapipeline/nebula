#!/bin/bash
if [ ! -n "${__COMMON_DEF}" ] ; then
    [ -f 'scripts/common/common-functions.bash' ] && source 'scripts/common/common-functions.bash'
fi

##
# Check if an environment has been whitelisted for deployment
#
function whitelisted()
{
    return $(contains "$1" "${WHITELIST[@]}")
}

##
# Execute a command in the current shell
#
function execute()
{
    local command="${@}"
    if [ ! -z "${__DEBUG_FLAG}" ] ; then
       debug "Executing '${command}'"
       return
    fi
    inform "Executing '${@}'"
    eval "${command}"
}

##
# Check command
#
# @param command String
#
function check()
{
    local command="${@}"
    [ ${__TEST_RETURN_FLAG} -eq ${__TEST_RETURN_FLAG} ] 2>/dev/null || __TEST_RETURN_FLAG=0
    if [ ! -z "${__DEBUG_FLAG}" ]; then
       debug "__DEBUG_FLAG is set - will return with ${__TEST_RETURN_FLAG}"
       debug "Would run '${command}'"
       return ${__TEST_RETURN_FLAG}
    fi
    eval "${command}"
}

function from_args_or_readonly()
{
    local var="$1"
    shift
    local method="$1"
    shift

    local name=""

    if [ -n "${!var}" ]; then
        name="${!var}"
    elif [ -n "$1" ]; then
        name="$1"
    fi

    if [ ! -n "${name}" ]; then
        fatal "${var} is not set. call with ${method} <NAME> or set readonly property ${var}"
        return 1
    fi
    echo "${name}"
}

##
# Creates an S3 bucket.
# Normally used for creating state file buckets
function create_s3_backend()
{
    local bucket_name="$(from_args_or_readonly bucketName create_s3_backend $@)"
    inform "Checking for bucket ${bucket_name}"
    if check aws s3api head-bucket --bucket ${bucket_name}; then
        inform "Found S3 bucket: ${bucket_name}"
        return
    fi

    local arguments="--bucket ${bucket_name} --region ${AWS_DEFAULT_REGION}"
    if [ "${AWS_DEFAULT_REGION}" != "us-east-1" ]; then
        arguments="${arguments} --create-bucket-configuration LocationConstraint=${AWS_DEFAULT_REGION}"
    fi
    inform "Creating S3 bucket ${bucket_name} ..."
    execute aws s3api create-bucket ${arguments}
}

##
# Used to create the lock table for terraform if it does not exist
#
function check_for_lock_table()
{
    local table_name="$(from_args_or_readonly tableName check_for_lock_table $@)"
    check "aws dynamodb describe-table --table-name \"${table_name}\" --region \"${AWS_DEFAULT_REGION}\" | grep -q -i \"LockID\""
}

##
# Creates the terraform lock table if it does not exist
#
function create_dynamo_db()
{
    # Delete and recreate lock table
    # If terraform crashes and leaves a lock in place,
    # there seems to be no other way of clearing it.
    #if check "aws dynamodb describe-table --table-name \"${tableName}\" --region \"${AWS_DEFAULT_REGION}\" | grep -q -i \"LockID\""; then
    #    execute aws dynamodb delete-table --table-name \"${tableName}\"
    #fi

    local table_name="$(from_args_or_readonly tableName check_for_lock_table $@)"
    if check_for_lock_table $table_name; then
        inform "Found DynamoDB table: ${table_name}"
        return
    fi

    echo "Creating DynamoDB table: ${table_name} ..."
    execute aws dynamodb create-table \
        --table-name "${table_name}" \
        --key-schema "AttributeName=LockID,KeyType=HASH" \
        --attribute-definitions "AttributeName=LockID,AttributeType=S" \
        --provisioned-throughput "ReadCapacityUnits=5,WriteCapacityUnits=5" \
        --region "${AWS_DEFAULT_REGION}"

    # wait for table to become available
    local wait_count=20
    echo "Waiting for lock table to become available"
    while  [ $wait_count -gt 0 ]; do
        if check_for_lock_table; then
            break
        fi
        sleep .1
        let wait_count=$wait_count-1
    done
}

export __FUNCTION_DEF=1

