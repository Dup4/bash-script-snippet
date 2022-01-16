#! /bin/bash

function get_var_type() {
    local a="${1}"

    printf "%d" "$a" &>/dev/null && echo "integer" && return
    # shellcheck disable=SC2001
    printf "%d" "$(echo "${a}" | sed 's/^[+-]\?0\+//')" &>/dev/null && echo "integer" && return
    printf "%f" "$a" &>/dev/null && echo "number" && return
    [ ${#a} -eq 1 ] && echo "char" && return
    echo "string"
}

function check() {
    local a="${1}"
    echo "${a} is $(get_var_type "${a}")"
}

check "."
check "1"
check ".1"
check "1."
check "1234"
check "1.234"
check "1.2.3.4"
check "a1234"
check "abc"
check "a"
check "1e+2"
check "1.e+2"
check ".1e+2"
check "-1"
check "-1.2"
check "-a"
check "0x1f"
check "0x1H"
check "0333"
check "0999"
check "+003"
check "+003.3"
