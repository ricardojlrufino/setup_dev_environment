#!/bin/bash
set -e # Exit if any subcommand fails

echo "🏃Configurando node ..."

echo "-- Configurando NOTE_TLS_REJECT_UNAUTHORIZED"
export NOTE_TLS_REJECT_UNAUTHORIZED=0
echo "export NOTE_TLS_REJECT_UNAUTHORIZED=0" | _add_profile

test -z "$CFG_NODE_EXTRA_CA_CERTS" || {
    echo "-- Configurando certificados"
    export NODE_EXTRA_CA_CERTS=$HOME/custom-bundle.pem
    echo "export NODE_EXTRA_CA_CERTS=$HOME/custom-bundle.pem" | _add_profile
    curl -k -s -S $CFG_NODE_EXTRA_CA_CERTS -o $NODE_EXTRA_CA_CERTS
}

test -z "$CFG_NODE_NPM_FILE" || {
    echo "-- Configurar o .npmrc"
    curl -k -s -S $CFG_NODE_NPM_FILE -o ~/.npmrc
    cat ~/.npmrc
}

