#!/bin/bash
export PATH="$PATH:$SCRIPT_DIR/functions/cmds"
. $SCRIPT_DIR/functions/colors.sh
. $SCRIPT_DIR/functions/requirements_utils.sh
. $SCRIPT_DIR/functions/pkg_install.sh
. $SCRIPT_DIR/functions/configuration.sh
. $SCRIPT_DIR/functions/ask.sh

chmod -R +x $SCRIPT_DIR/functions/cmds/*
