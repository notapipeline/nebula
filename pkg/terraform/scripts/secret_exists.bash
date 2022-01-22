#!/bin/bash
source secrets_root.bash

namespace=$1
secret=$2

kubectl -n ${namespace} get secrets/${secret} &>/dev/null
echo '{"status": "'$?'"}'

