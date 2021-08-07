#! /bin/bash

TOP_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# the following code is the test code

# if the current script path is 
# ~/Shell-Script-Snippet/top_dir.sh
# the value of ${TOP_DIR} is 
# ~/Shell-Script-Snippet 
echo "${TOP_DIR}"