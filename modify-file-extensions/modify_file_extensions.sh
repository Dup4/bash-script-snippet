#! /bin/bash

origin="${1}"
target="${2}"

find . -name "*.${origin}" | awk -F "." '{print $2}' | while read -r filename; do
    origin_filename="./${filename}.${origin}"
    target_filename="./${filename}.${target}"
    echo "${origin_filename} -> ${target_filename}"
    mv "${origin_filename}" "${target_filename}"
done
