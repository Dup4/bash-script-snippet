#! /bin/bash

CUR_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# the following code is the test code

# if the current script path is
# ~/Shell-Script-Snippet/cur_dir.sh
# the value of ${CUR_DIR} is
# ~/Shell-Script-Snippet
echo "${CUR_DIR}"
