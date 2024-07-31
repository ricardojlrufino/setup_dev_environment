#/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
####################################################
## Executa etapa de diagnóstico
####################################################

echo -e "$PURPLE"
echo "/=========== Diagnóstico ================\\"

diagnostic_success=true
diagnostic_erros=()
for f in $APP_DIR/diagnostic/*.sh; do
  diagnostic=$(basename ${f})

  # Cache this verification if success...
  PASS_FILE="/tmp/ckeck_success_$diagnostic"
  if test -f "$PASS_FILE"; then
    echo " [♥] $diagnostic"
    continue
  fi  

  printf "🏃 $diagnostic"
  
  # Run ....
  if ! bash "$f" >/dev/null; then 
    diagnostic_success=false
    diagnostic_erros=("${diagnostic_erros[@]}" $diagnostic) # push element
    echo -e "\r 💀  $diagnostic"
  else
    echo -e "\r [✔] $diagnostic"
    touch $PASS_FILE  # cache verification
  fi
  
done

echo "\\=========== Diagnóstico ================/"
echo -e "$NO_COLOR"

if [ "$diagnostic_success" = false ] ; then
    echo "💀"
    echo -e "💀 ${RED}Diagnóstico falhou ! ${NO_COLOR}"
    echo "💀"
    echo ""
    sleep 1

    for i in "${diagnostic_erros[@]}"; do 
        echo -e "${YELLOW}---------- 🔎 Checkando/Aplicando solução para o ${PURPLE} $i ${NO_COLOR} ---------- ${NO_COLOR}" ; 
        $APP_DIR/diagnostic/fix/$i
    done
    echo -e "ℹ️"  
    echo -e "${YELLOW}ℹ️  Execute novamente o script de instalação (ou sigs as instruções sugeridas acima) "
    echo -e "ℹ️"
    exit -1
fi
