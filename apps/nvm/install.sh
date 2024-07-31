#!/bin/bash
set -e # Exit if any subcommand fails

APP_NAME="nvm"
requirements=("curl")

APP_VERSION=$(get_config_version $APP_NAME)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

############ REQUIREMENTS #############

validate_requirements $APP_NAME $APP_VERSION

############ INSTALL #############

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$APP_VERSION/install.sh | bash

############ CONFIGURE #############

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm