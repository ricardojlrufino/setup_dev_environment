#!/bin/bash
set -e # Exit if any subcommand fails

APP_NAME="curl"
requirements=()

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

############ REQUIREMENTS #############

validate_requirements $APP_NAME $APP_VERSION

############ INSTALL #############

_pkg_install $APP_NAME