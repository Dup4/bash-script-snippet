#! /bin/bash

# https://linuxhint.com/generate-random-string-bash/

LEN="${1}"

if [[ -z "${LEN}" ]]; then
    LEN=6
fi

echo $RANDOM | md5sum | head -c "${LEN}"

echo
