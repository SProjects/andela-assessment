#!/bin/bash

set -ex
set -o pipefail

install_nginx() {
    sudo apt-get update -y

    sudo apt-get install -y nginx
}

main() {
    install_nginx
}

main "$@"