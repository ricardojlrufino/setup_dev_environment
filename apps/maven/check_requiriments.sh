#!/bin/bash
APP_NAME="mvn" # custom binary name

requirements=("sdk")
requirements_missing=()
source "$HOME/.sdkman/bin/sdkman-init.sh"

check_requirements # from functions
install_requirements $requirements_missing # from functions
check_app $APP_NAME # from functions
