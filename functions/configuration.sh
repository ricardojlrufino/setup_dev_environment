# Read configuration file with versions

## Versions file 
IFS="="
while read var value
do
    [[ $var == '#'* ]] && continue
    export "CFG_$var"="$value"
done < $SCRIPT_DIR/settings.ini

# Debug 
#printenv | grep "CFG_"


get_config_version(){
    key="CFG_version_$1"
    printf '%s\n' "${!key}"
}


export -f get_config_version