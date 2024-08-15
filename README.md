# Ferramenta para configuração do ambiente de desenvolvimento 

Trata-se de um conjunto de shells scripts que simplifica o setup e configuração inicial da maquina do desenvolvedor. 

Se você precisa criar uma automação para instalação e configuração de ambientes de desenvolvimento, essa ferramenta serve como um framework/template para tal. 

O script de instalação também possui rotinas de diagnóstico para verificar pré-requisitos, e ajustá-los caso necessário. Essas rotinhas servem para configurações especiais que podem variar de empresa para empresa. 

  
Os scripts permitem instalação de versões específicas e parametrizações das ferramentas através do arquivo: `settings.ini` 

Você pode usar estes scripts como base para personalizar seu ambiente. 
Para mais detalhes do funcionando e personalização leia: [](DEVELOPER.md)


# Apps / SDKs disponíveis 

Neste setup está disponível a possibilidade de instalar as seguintes ferramentas: 

* node (+ nvm Node Version manager) 
* java (+ sdkman - Java Version Manager) 
* maven 

Não deixe de ler os arquivos de instalação para entender o que será feito, como o `/apps/node/install.sh` 

# Instalação 

> git clone (this_repository)  ~/.setup_dev && cd "$_"  
> Adicionar permissões de execução  
> find . -type f -iname "*.sh" -exec chmod +x {} \;  

# Executando 

Revise o arquivo `settings.ini` e execute: 

> ./install.sh  

Para instalar apenas ferramentas especificas e suas dependências 

> ./install.sh java 

Na primeira execução ele faz um pré-diagnóstico e sugere e/ou executa modificações caso necessário e instala os pacotes definidos no arquivo 'settings.ini'.   

# Sdkman - Java Version Manager 

Nos exemplos é instalado o sdkman, junto com o java, e você pode usar ele para instalar outras ferramentas e outros JDK.

Veja: https://sdkman.io/usage 

sdk install springboot 
sdk install quarkus 

# Procedimento para testes 

> docker run -it --rm --name test_script -v $PWD:/app ubuntu:22.04 
  
em outra sessão execute: 

> docker exec -it test_script /app/setup.sh 

# License

Copyright © 2024 Ricardo JL Rufino  
This work is free. You can redistribute it and/or modify it under the  
terms of the Do What The Fuck You Want To Public License, Version 2,  
as published by Sam Hocevar. See the COPYING file or http://www.wtfpl.net/   
for more details.  