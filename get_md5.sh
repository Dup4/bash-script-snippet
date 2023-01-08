#! /bin/bash

FILE_NAME="${1}"

if [[ -z "${FILE_NAME}" ]]; then
    echo "Usage: get_md5.sh ${FILE_NAME}"
    exit 1
fi

md5sum -b "${FILE_NAME}" | awk '{print $1}' >"${FILE_NAME}.md5"
