#!/bin/bash

namespace=$1
secret=$2
fqdn=$3
letsencrypt=$4

tlscrt='tls.crt'
tlskey='tls.key'
if kubectl -n ${namespace} get secrets/${secret} &>/dev/null; then
    # This eval line creates CACERT, CAKEY and GOSSIP shell vars from secret data
    eval $(
        kubectl -n ${namespace} get secrets/${secret} -o json |\
            jq -r '("\("TYPE")=\(.type | @sh)"),(.data | to_entries[] | "\(.key | ascii_upcase | gsub("\\.";"_"))=\(.value | @base64d | @sh )")'
        )
    if [ ! -f ${tlscrt} ] ; then
        [ "${TLS_CRT}" != '' ] && echo ${TLS_CRT} | tr " " "\n" | awk '/BEGIN/ || /END/{printf "%s ",$0;next}7' > ${tlscrt}
    fi
    if [ ! -f ${tlskey} ]; then
       [ "${TLS_KEY}" != '' ] && echo ${TLS_KEY} | tr " " "\n" | awk '/BEGIN/ || /PRIVATE/ || /END/{printf "%s ",$0;next}7' > ${tlskey}
    fi
fi

if [ ! -f ${tlscrt} ]; then
    if [ ${letsencrypt} == 0 ]; then
        cp /etc/letsencrypt/archive/${fqdn}/fullchain1.pem ${tlscrt}
        cp /etc/letsencrypt/archive/${fqdn}/fullchain1.pem ${tlskey}
    else
        cp /etc/ssl/$(cut -d. -f2- <<<${fqdn})/$(cut -d. -f1 <<<${fqdn}).crt
        cp /etc/ssl/$(cut -d. -f2- <<<${fqdn})/$(cut -d. -f1 <<<${fqdn}).key
    fi
fi

if [ "${TYPE}" != 'Opaque' ]; then
    sed -i'' '/i^---.*/d' ${tlscrt}
    sed -i'' '/i^---.*/d' ${tlskey}
fi

TLS_CRT=$(base64 -w 0 < ${tlscrt})
TLS_KEY=$(base64 -w 0 < ${tlskey})
rm ${tlscrt} ${tlskey}

response=$(kubectl -n ${namespace} patch secret ${secret} -p='{"data": {"tls.crt": "'${TLS_CRT}'","tls.key": "'${TLS_KEY}'"}}')
lastExit=$?
if ! grep -q 'no change' <<<${response}; then
  lastExit=-1
fi
echo '{"status": "'$lastExit'"}'
