# DEVELOPERS

Segue algumas orientações sobre a estrutura e funcionamento.

# Apps

Novos Apps pode sem ser adicionados facilmente seguindo a estrutura contida em `apps/$pasta`

No geral você precisa apenas de um arquivo chamado `install.sh` para funcionar, para casos
mais complexos existem alguns arquivos implícitos que você pode adicionar.

Estrutura: 
* /apps/seuapp/install.sh (required)
* /apps/seuapp/check.sh - Verificar se a aplicação está instalada (opcional) (ex. apps/nvm/check.sh)
* check_version.sh - Retorna a versão da aplicação (opcional) (ex. apps/node/check_version.sh)
* /apps/seuapp/check_requiriments.sh - personaliza a instalação do requirements  (opcional)  (ex. apps/sdk/check_requiriments.sh)

# Dependências

Existe um sistema básico de dependências onde no arquivo `install.sh` você declara
uma lista de dependências.

No exemplo a mais completo é o do node?

> node (dependente)> nvm (dependente)> curl

Quando uma dependência declarada existir em `/apps/$DEP`, ela será instalada usando o
script de `/apps/$DEP/install.sh`

# Diagnóstico

São scripts localizados na pasta `diagnostic`, e são usados para para criar pré-condições de instalação geral como checar VPN, PROXY, HOSTS.

Para adicionar uma nova checagem basta criar um novo script na pasta, com um sequencial.

## Diagnostico - Correção automática ou Sugestão

Quando um disgnóstico falha, um script de 'fix' é executado.

Você pode implementar uma correção automática, como imprimir na tela orientações.

Eles ficam na pasta `diagnostic/fix`, e devem ter o mesmo nome da pasta original.

# CLI / Default Packages

Os pacotes padrão que serão instalados são configurados no arquivo 'settings.ini' 

Para adicionar novos pacotes edite a variável `DEFAULT_PACKAGES`.

Eles serão instalados pelo diagnóstico no `fix_diagnostic/4.required_packages.sh`

# Variáveis

Serão criadas variáveis de ambiente a partir do arquivo settings.ini automaticamente

E são acessadas através do formado `$CFG_NOME_PARAMETRO` 

# Functions 

A pasta contem scripts utilitários que podem ser reutilizados.

Arquivos colocados dentro da pasta `functions/cmds`. São automaticamente exportados no PATH, 
e podem ser usados nos demais scripts.

# LOGS / DEBUG / TRACE

use as funções: 

* _DEBUG "Alguma coisa"
* _TRACE "Alguma coisa"

Ajuste o nível na `setting.ini`: DEBUG_LEVEL para DEBUG OU TRACE


# TODO
- [ ] O script de instalação não força versão especificada, se o aplicativo já estiver instalado. Você pode instalar 
- [ ] Implmentar /functions/cmds/_pkg_install para varios tipos de S.O
- [ ] Implementar alguma internacionalização