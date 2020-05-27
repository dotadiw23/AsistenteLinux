#!/bin/bash

scriptHistory=historial/script1.txt

a() {
    DAY=$(date +%A" "%d)
    MONTH=$(date +%B)
    YEAR=$(date +%Y)
    TIME=$(date +%I:%M)

    clear
    output="\nSon las $TIME del día $DAY de $MONTH del $YEAR\n"
    echo $output
    echo $output >> $scriptHistory
}

b() {
    DISTRO=$(neofetch) #cat /etc/*-release
    clear
    echo
    echo
    echo "$DISTRO"
    echo $(hostnamectl) >> $scriptHistory
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