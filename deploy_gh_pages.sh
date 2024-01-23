#! /bin/bash

VERSION="v0.0.4"

REPO=""
DIR=""
NAME=""
BRANCH="deploy-pages"
HOST="github.com"
PROXY=""

echo "Version: ${VERSION}"

function usage() {
    echo "usage"
}

while getopts "b:d:n:t:r:p:h:" o; do
    case "${o}" in
    b)
        BRANCH=${OPTARG}
        ;;
    d)
        DIR=${OPTARG}
        ;;
    n)
        NAME=${OPTARG}
        ;;
    t)
        TOKEN=${OPTARG}
        ;;
    r)
        REPO=${OPTARG}
        ;;
    p)
        PROXY=${OPTARG}
        ;;
    h | *)
        usage
        ;;
    esac
done

if [[ -z "${REPO}" ]]; then
    echo "repo not found."
    exit 1
fi

if [[ -z "${DIR}" ]]; then
    echo "dir not found."
    exit 2
fi

if command -v git >/dev/null 2>&1; then
    echo "git found."
else
    echo "git not found."
    exit 3
fi

if [[ -z "${NAME}" ]]; then
    NAME=${REPO#*/}
fi

if [[ -n "${TOKEN}" ]]; then
    TOKEN="${TOKEN}@"
fi

if [[ -n "${PROXY}" ]]; then
    HOST="${PROXY}"
fi

echo "repo: ${REPO}"
echo "dir: ${DIR}"
echo "name: ${NAME}"
echo "branch: ${BRANCH}"

cd "${DIR}" || exit 4

OK=0

DOWNLOAD_PATH="${NAME}.gh.download"

if [[ -d "${DOWNLOAD_PATH}" ]]; then
    rm -rf "${DOWNLOAD_PATH}"
fi

function git_clone() {
    if [[ -n "${PROXY}" ]]; then
        for i in $(seq 5); do
            echo "trying https. [number of tries=${i}]"
            git clone https://"${TOKEN}${HOST}"/"${REPO}".git \
                -b "${BRANCH}" \
                --single-branch \
                --depth=1 \
                "${DOWNLOAD_PATH}"

            # shellcheck disable=SC2181
            if [[ $? -eq 0 ]]; then
                OK=1
                return
            fi
        done
    fi

    if [[ -z "${TOKEN}" ]]; then
        local host_list
        host_list=(
            "git@github.com"
        )

        for host in "${host_list[@]}"; do
            for i in $(seq 5); do
                echo "trying ssh. [host=${host}] [number of tries]"
                git clone "${host}":"${REPO}".git \
                    -b "${BRANCH}" \
                    --single-branch \
                    --depth=1 \
                    "${DOWNLOAD_PATH}"

                # shellcheck disable=SC2181
                if [[ $? -eq 0 ]]; then
                    OK=1
                    return
                fi
            done
        done
    fi
}

git_clone

if [[ ${OK} -eq 0 ]]; then
    echo "deploy failed."
    exit 5
fi

if [[ -d "${DOWNLOAD_PATH}" ]]; then
    mv "${NAME}" "${NAME}.back"
    mv "${DOWNLOAD_PATH}" "${NAME}"
    rm -rf "${NAME}.back"
fi

exit 0
