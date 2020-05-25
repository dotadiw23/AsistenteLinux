#!bin/bash

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
}

# Permite ver el espacio del sistema
a(){
    clear 
    echo "\n\e[32m[Reporte de espacio libre del sistema]\e[0m\n"
    df -m
}

# Permite ver el espacio de un directorio
b(){
    if [ -z "$1" ]; then 
        msgError
    else
        clear
        if [ -d $1 ];then 
            echo "\n\e[32m[Reporte de espacio libre del directorio\e[0m \e[1;34m$1\e[0m \e[32m]\e[0m\n"
            df -m $1
        else
            clear
            echo "\n\e[0;31m[ERROR]\e[0m \e[1;34m$1\e[0m no es un directorio..."
        fi
    fi
}

c(){
    ./inicio.sh
}

clear
figlet Espacio en el disco

while :
do 
    echo "\n¿Qué desea hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Ver espacio disponible en el sistema
    b). Ver espacio disponible en un directorio \e[0;31m*\e[0m (Ruta del directorio)
    c). Volver
    "

    read option

    $option
done