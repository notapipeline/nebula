#!/bin/bash

while [ ! -d .git ]; do
    cd ..
    if [ "${pwd}" == '/' ]; then
        echo "Not a valid cluster repository" >&2
        exit 1
    fi
done

if [ ! -d secrets ]; then
    mkdir secrets
fi

cd secrets

