#! /bin/bash

suffix="${1}"
path_prefix="${2}"

echo "suffix=${suffix}"

if [[ -z "${path_prefix}" ]]; then
    path_prefix="${PWD}"
fi

function del() {
    path="${1}"
    rm "${path}"
    echo "delete file. [path=${path}]"
}

function walk() {
    local path_prefix="${1}"

    for path in "${path_prefix}"/*; do
        if [[ -d "${path}" ]]; then
            walk "${path}"
        fi

        if [[ -f "${path}" ]]; then
            path_suffix="${path##*.}"

            if [[ -z "${suffix}" ]]; then
                if [[ "${path_suffix}" = "${path}" ]]; then
                    del "${path}"
                fi
            else
                if [[ "${path_suffix}" = "${suffix}" ]]; then
                    del "${path}"
                fi
            fi
        fi
    done
}

walk "${path_prefix}"
