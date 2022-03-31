#! /bin/bash

REPO=""
DIR=""
TARGET=""
BRANCH="deploy-pages"

function usage() {
    echo "usage"
}

while getopts "b:d:t:r:h:" o; do
    case "${o}" in
    b)
        BRANCH=${OPTARG}
        ;;
    d)
        DIR=${OPTARG}
        ;;
    t)
        TARGET=${OPTARG}
        ;;
    r)
        REPO=${OPTARG}
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
    pass
else
    echo "git not found."
    exit 3
fi

if [[ -z "${TARGET}" ]]; then
    TARGET=${REPO#*/}
fi

echo "repo: ${REPO}"
echo "dir: ${DIR}"
echo "target: ${TARGET}"
echo "branch: ${BRANCH}"

cd "${DIR}" || exit 4

OK=0

for i in $(seq 5); do
    echo "trying. [number of tries=${i}]"
    git clone https://github.dup4.com/"${REPO}".git -b "${BRANCH}" --depth=1 "${TARGET}.back"
    # shellcheck disable=SC2181
    if [ $? -eq 0 ]; then
        OK=1
        break
    fi
done

if [ ${OK} -eq 0 ]; then
    echo "deploy failed."
    exit 5
fi

if [[ -d "${TARGET}.back" ]]; then
    rm -rf "${TARGET}" && mv "${TARGET}.back" "${TARGET}"
fi

exit 0
