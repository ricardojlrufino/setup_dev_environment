#!/bin/bash
set -e # Exit if any subcommand fails

APP_NAME="java"
requirements=("sdk" "mvn")

APP_VERSION=$(get_config_version $APP_NAME)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

############ REQUIREMENTS #############

test -d "$HOME/.sdkman" && source "$HOME/.sdkman/bin/sdkman-init.sh"
validate_requirements $APP_NAME $APP_VERSION

############ INSTALL #############

source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java $APP_VERSION

############ CONFIGURE #############