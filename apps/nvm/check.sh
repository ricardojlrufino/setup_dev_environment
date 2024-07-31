#!/bin/bash

## check.sh - Verificar se a aplicação está instalada (usado pelo requirements_utils.sh)

APP_NAME=$1

if test -d "$HOME/.nvm"; then

    echo ".. ✔ [$APP_NAME] Já está instalado no seu sistema... [CUSTOM CHECK]"

    exit -1
fi