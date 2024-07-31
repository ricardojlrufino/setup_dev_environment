#!/bin/bash

####################################################
## Install packages configured in settings.ini
####################################################

echo -e "🏃🏃🏃 Instalando pacotes configurados em DEFAULT_PACKAGES = ${CFG_DEFAULT_PACKAGES}"

_pkg_update  # defino nas functions (geralmente apt update)

## Check default terminal tools
IFS=$' '
for i in ${CFG_DEFAULT_PACKAGES}; do 
    if ! command -v $i > /dev/null; then
        echo -e "🏃${YELLOW} Instalando${NO_COLOR} $i ...  "; 
        _pkg_install $i
        if command -v $i > /dev/null; then
          echo -e "ℹ️ ${CYAN} Pacote Instalado: $i ${NO_COLOR}"; 
        else
          echo -e "💀 ${YELLOW} Falha na instalacao do pacote $i ${NO_COLOR}"; 
        fi
    fi
done

