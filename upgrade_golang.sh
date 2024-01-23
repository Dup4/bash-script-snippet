#! /bin/bash

VERSION="v0.0.4"

GO_INSTALL_PATH="/usr/local/go"
GO_LATEST_FILENAME="go${VERSION}.linux-amd64.tar.gz"
GO_LATEST_DOWNLOAD_URL="https://go.dev/dl/${GO_LATEST_FILENAME}"
GO_LATEST_DOWNLOAD_PATH="/tmp/${GO_LATEST_FILENAME}"

wget --tries=3 "${GO_LATEST_DOWNLOAD_URL}" -O "${GO_LATEST_DOWNLOAD_PATH}"

if [[ -s "${GO_LATEST_DOWNLOAD_PATH}" ]]; then
    if [[ -d "${GO_INSTALL_PATH}" ]]; then
        sudo rm -rf "${GO_INSTALL_PATH}"
    fi

    sudo tar -C /usr/local -xzf "${GO_LATEST_DOWNLOAD_PATH}"
    rm -rf "${GO_LATEST_DOWNLOAD_PATH}"

    go version
fi
