#! /bin/bash

TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# if the current script path is 
# ~/Shell-Script-Snippet/top_dir.sh
# the value of ${TOP_DIR} is 
# ~/Shell-Script-Snippet 
echo "${TOP_DIR}"