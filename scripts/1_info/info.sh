#!/bin/bash
a() {
    DAY=$(date +%A" "%d)
    MONTH=$(date +%B)
    YEAR=$(date +%Y)
    TIME=$(date +%I:%M)

    clear
    echo "\nSon las $TIME del día $DAY de $MONTH del $YEAR\n"
}

b() {
    DISTRO=$(neofetch) #cat /etc/*-release
    clear
    echo
    echo
    echo "$DISTRO"
}

c(){
    ./inicio.sh
}


clear
figlet Informacion del Sistema

while :
do
    echo "\n¿Qué desea hacer?
    a). Mostrar la fecha y la hora actuales del sistema
    b). Información del Distro y Release actual del sistema
    c). Volver"

    read option
    
    $option

done