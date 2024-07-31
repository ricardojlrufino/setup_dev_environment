#!/bin/bash
##############################################################################################
# Aplicação/Script para realizar a instação de uma aplicação específica e suas dependências.
# Veja o README.md e settings.ini para mais detalhes
# Author: Ricardo JL Rufino
##############################################################################################

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export APP_DIR=$SCRIPT_DIR
. $SCRIPT_DIR/functions/imports.sh

##############################################
# Script principal de instalação
##############################################

## PARAMS
APP="$1"

## Run diagnostic and fix
$SCRIPT_DIR/functions/diagnostic.sh

## MAIN

if [ -z "$1" ]; then
    echo "No argument supplied, install all"
    $SCRIPT_DIR/apps/java/install.sh
    $SCRIPT_DIR/apps/node/install.sh
else
   $SCRIPT_DIR/apps/${APP}/install.sh
fi




