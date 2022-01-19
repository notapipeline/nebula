#!/bin/bash
set -o errexit -o pipefail

# Configurable defaults
readonly owner='choclab'
readonly terraformCommand="sudo -E terraform"
varFiles=(
    "defaults.tfvars"
    "secrets.tfvars"
)

source scripts/common-functions.bash
source scripts/functions.bash

CWD=$(pwd)
TERRAFORM_SOURCE_DIR='pkg/terraform'

terraformPath=""
if [ -f "${HOME}/src/scripts/envloader.bash" ]; then
    source "${HOME}/src/scripts/envloader.bash"
fi

REPO_NAME=$([ "$(basename $(pwd))" == 'code' ] && ( cd .. ; basename $(pwd); ) || basename $(pwd))

[ -n "${__FUNCTION_DEF}" ] || { echo "Function definitions not found - cannot continue" >&2 ; exit 1; }

REQUIRED_VARIABLES=(
  AWS_DEFAULT_REGION
  AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY
  ENVIRONMENT
)

for var in ${REQUIRED_VARIABLES[@]}; do
    [ -n "${!var}" ] || { echo "${var} environment variable not defined" >&2; exit 1; }
done

readonly action=$([[ -n $1 ]] && echo $1 || echo '--auto-apply')
readonly lowerCaseEnvName="${ENVIRONMENT,,}"
readonly lockTimeout="60s"

[ ! -d ~/.kube ] && mkdir ~/.kube

echo "==============================================================================="
echo "Using Terraform version $(terraform version)"
echo "==============================================================================="

environmentAction='skip'
case "${ENVIRONMENT}" in
    "PROD")
        environmentAction='apply'
        ;;
esac

##
# Work out the push command
terraformAction='apply'
case "${action}" in
    'unlock')
        terraformAction="force-unlock $2"
        ;;
    'plan')
        terraformAction='plan'
        ;;
    'apply')
        terraformAction="${environmentAction}"
        ;;
    'destroy')
        terraformAction='destroy'
        ;;
    'console')
        terraformAction='console'
        ;;
    'push')
        terraformAction='state push -force ../../terraform.tfstate'
        ;;
    'pull')
        terraformAction='state pull > ../../terraform.tfstate'
        ;;
    *)
        echo "Invalid Terraform action: ${action}"
        exit 2
        ;;
esac

if [ "${terraformAction}" == "skip" ]; then
    exit 0;
fi

##
# Set up the terraform arguments
TERRAFORM_ARGS=(
    "-var \"region=${AWS_DEFAULT_REGION}\""
)

if [ "${terraformAction}" != "console" ] ; then
    TERRAFORM_ARGS+=("-lock-timeout=${lockTimeout}")
fi

if [ "${terraformAction}" == 'apply' ]; then
    TERRAFORM_ARGS+=("-auto-approve")
elif [ "${terraformAction}" == 'destroy' ]; then
    TERRAFORM_ARGS+=("-force")
fi

cd ${TERRAFORM_SOURCE_DIR}
for file in ${varFiles[@]}; do
    if [ -f "${file}" ] ; then
        TERRAFORM_ARGS+=("-var-file '${file}'")
    fi
done
readonly backendConfigFile="../config/backend/${lowerCaseEnvName}.config"
readonly stateident=$(awk '/bucket/{gsub("\"", ""); print $NF}' $backendConfigFile)

echo "$stateident"

readonly bucketName="${stateident}"
readonly tableName="${stateident}-lock"

# If .terraform directory exists, we need to clean it out first
[ -d .terraform ] && sudo rm -rf .terraform

# Run the backend creation
inform "Running checks"
create_s3_backend
create_dynamo_db

execute ${terraformCommand} init -backend-config="${backendConfigFile}" | tee ${terraformExecutionLog}
execute ${terraformCommand} workspace select "${lowerCaseEnvName}" || execute ${terraformCommand} workspace new "${lowerCaseEnvName}"
execute ${terraformCommand} init -backend-config="${backendConfigFile}" | tee -a ${terraformExecutionLog}
if [ "$action" == 'pull' ] || [ "$action" == 'push' ] ; then
    { execute ${terraformCommand} ${terraformAction} || echo ; }
else
    { execute ${terraformCommand} ${terraformAction} ${TERRAFORM_ARGS[@]} || echo ; }
fi

