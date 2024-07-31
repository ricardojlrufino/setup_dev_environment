#!/bin/bash

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"  # This loads nvm

if command -v mvn > /dev/null; then
    
    echo ".. ✔ [maven] Já está instalado no seu sistema... [CUSTOM CHECK]"

    exit -1
fi
