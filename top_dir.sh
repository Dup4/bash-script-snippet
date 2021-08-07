#! /bin/bash

TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# if the current script path is 
# ~/Shell-Script-Snippet/shell_folder.sh
# the value of ${TOP_DIR} is 
# ~/Shell-Script-Snippet 
echo "${TOP_DIR}"