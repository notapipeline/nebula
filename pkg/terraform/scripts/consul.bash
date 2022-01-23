#!/bin/bash
source secrets_root.bash
namespace=$1

secret='consul'
cacert='consul-agent-ca.pem'
cakey='consul-agent-ca-key.pem'
gossip='gossip.key'

if kubectl -n ${namespace} get secrets/${secret} &>/dev/null; then
    # This eval line creates CACERT, CAKEY and GOSSIP shell vars from secret data
    eval $(kubectl -n ${namespace} get secrets/${secret} -o json | jq -r '.data | to_entries[] | "\(.key | ascii_upcase)=\(.value | @base64d | @sh )"')
    if [ ! -f ${cacert} ] ; then
        [ "${CACERT}" != '' ] && echo ${CACERT} | tr " " "\n" | awk '/BEGIN/ || /END/{printf "%s ",$0;next}7' > ${cacert}
    fi
    if [ ! -f ${cakey} ]; then
       [ "${CAKEY}" != '' ] && echo ${CAKEY} | tr " " "\n" | awk '/BEGIN/ || /EC/ || /PRIVATE/ || /END/{printf "%s ",$0;next}7' > ${cakey}
    fi
    if [ ! -f ${gossip} ]; then
       [ "${GOSSIP}" ] && echo ${GOSSIP} > ${gossip}
    fi
fi

[ ! -f ${gossip} ] && consul keygen > ${gossip}
[ ! -f consul-agent-ca.pem ] && consul tls ca create &>/dev/null

CACERT=$(base64 -w 0 < ${cacert})
CAKEY=$(base64 -w 0 < ${cakey})
GOSSIP=$(base64 -w 0 < ${gossip})
rm ${cacert} ${cakey} ${gossip}

response=$(kubectl -n ${namespace} patch secret ${secret} -p='{"data": {"cacert": "'${CACERT}'","cakey": "'${CAKEY}'","gossip": "'${GOSSIP}'"}}')
lastExit=$?
if ! grep -q 'no change' <<<${response}; then
  lastExit=-1
fi
echo '{"status": "'$lastExit'"}'
