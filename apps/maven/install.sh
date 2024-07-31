#!/bin/bash
set -e # Exit if any subcommand fails

APP_NAME="maven"
APP_VERSION=$(get_config_version $APP_NAME)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$HOME/.sdkman/bin/sdkman-init.sh"

############ REQUIREMENTS #############

printf "ℹ️  Checking requiriments for $APP_NAME - version $APP_VERSION \n"
$SCRIPT_DIR/check_requiriments.sh $APP_NAME $APP_VERSION

############ INSTALL #############

sdk install maven $APP_VERSION

############ CONFIGURE #############