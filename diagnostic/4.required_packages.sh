#!/bin/bash
# Verifica se falta instalar algum pacote do SO

IFS=$' '
for i in ${CFG_DEFAULT_PACKAGES}; do 
    if ! command -v $i > /dev/null; then
        exit -1
    fi
done