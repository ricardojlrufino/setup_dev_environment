#!/bin/bash

install_requirements(){
    # echo "param ---->> $1"
    requirements=$1

    if ! test -z "$requirements"; then
        for i in "${requirements[@]}"; do 
            echo ".. $i será instalado no sistema... "
            $APP_DIR/apps/$i/install.sh
        done

    fi

}

validate_requirements(){

    printf "ℹ️  Verificando pre-requisitos para $APP_NAME - version $APP_VERSION \n"

    if test -f $APP_DIR/apps/$APP_NAME/check_requiriments.sh; then
        echo "xxxx $APP_NAME - using custom check_requiriments.sh"
        $APP_DIR/apps/$APP_NAME/check_requiriments.sh
    else
        _DEBUG "$APP_NAME - Requirements: ${requirements}"
        requirements_missing=()
        check_requirements $requirements # from functions
        install_requirements $requirements_missing # from functions
        check_app $APP_NAME 
        
    fi
    
}

check_requirements(){

    for i in "${requirements[@]}"; do 
        if ! command -v $i > /dev/null; then
            echo ".. ✘ $i não está instalado no sistema... "
            requirements_missing=("${requirements_missing[@]}" $i) # push element
        fi
    done
    
}

check_app(){
    
    APP_NAME=$1

    if test -f $APP_DIR/apps/$APP_NAME/check.sh; then

        _TRACE "using custom check_app $APP_NAME"

        $APP_DIR/apps/$APP_NAME/check.sh ${APP_NAME}
        
    else

        if command -v $APP_NAME > /dev/null; then

            echo ".. ✔ [$APP_NAME] Já está instalado no seu sistema..."

            check_version $APP_NAME $APP_VERSION # from functions

            ## exit -1 # abort install
        fi
    fi
    
}

function check_version(){
    APP_NAME=$1
    APP_VERSION=$2

    if test -f $APP_DIR/apps/$APP_NAME/check_version.sh; then

        _TRACE "using custom check_version $APP_NAME , requested: $APP_VERSION"

        version=$($APP_DIR/apps/$APP_NAME/check_version.sh ${APP_NAME})

        if [[ "$version" != "$APP_VERSION" ]]; then
            echo -e "ℹ️ ${YELLOW} As versões podem estar diferentes da solicitada ${NO_COLOR}"
            echo -e "Atual: ${YELLOW}$version${NO_COLOR}"
            echo -e "Solicitada: ${YELLOW}$APP_VERSION${NO_COLOR}"

            if ask "Deseja instalar a versão solicitada"; then
                echo "ok..."
                return 0
            else
                exit -1  # abort install
            fi
        fi
    fi

    # version match
    exit -1  # abort install
}

export -f install_requirements
export -f check_requirements
export -f check_app
export -f check_version
export -f validate_requirements
