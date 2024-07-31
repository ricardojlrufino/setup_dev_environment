#!/bin/bash

##
## Chamar o script de config de algum aplicativo em específico
##

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export APP_DIR=$SCRIPT_DIR
. $SCRIPT_DIR/functions/imports.sh

APP="$1"

$SCRIPT_DIR/apps/${APP}/config.sh