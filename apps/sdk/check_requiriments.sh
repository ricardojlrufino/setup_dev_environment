#!/bin/bash
APP_NAME="$1"
APP_VERSION="$2"

requirements=("curl" "unzip")
requirements_missing=()

function check(){

    if test -d "$HOME/.sdkman"; then

        echo ".. ✔ [$APP_NAME] Já está instalado no seu sistema..."

        exit -1
    fi
}


check_requirements # from functions
install_requirements $requirements_missing # from functions
check

