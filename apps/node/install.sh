#!/bin/bash
set -e # Exit if any subcommand fails

APP_NAME="node"
requirements=("nvm")

APP_VERSION=$(get_config_version $APP_NAME)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

############ REQUIREMENTS #############

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
validate_requirements $APP_NAME $APP_VERSION

############ INSTALL #############

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install $APP_VERSION

############ CONFIGURE #############

$SCRIPT_DIR/config.sh