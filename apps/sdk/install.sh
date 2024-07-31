#!/bin/bash
set -e # Exit if any subcommand fails

APP_NAME="sdk"

APP_VERSION=$(get_config_version $APP_NAME)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

############ REQUIREMENTS #############

printf "ℹ️  Checking requiriments for $APP_NAME - version $APP_VERSION \n"
$SCRIPT_DIR/check_requiriments.sh $APP_NAME $APP_VERSION

############ INSTALL #############

curl -s "https://get.sdkman.io" | bash

############ CONFIGURE #############

source "$HOME/.sdkman/bin/sdkman-init.sh"