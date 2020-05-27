#!bin/bash

scriptHistory=historial/script6.txt

a(){
    clear
    echo "\n> Ingrese el nombre del paquete a buscar... "
    echo "\n> Ingrese el nombre del paquete a buscar... " >> $scriptHistory
    read package
    echo $package >> $scriptHistory

    path_=$(which $package)

    # Posible path del paquete
    if [ -z $path_ ]; then
        echo "\n\e[0;31m[No se han encontrado posibles rutas donde se aloje el paquete\e[0m $package\e[0;31m]\e[0m"
        echo "\n\e[0;31m[No se han encontrado posibles rutas donde se aloje el paquete\e[0m $package\e[0;31m]\e[0m" >> $scriptHistory
    else
        echo "\nPosibles ruta(s) donde se aloja el paquete:\n"
        echo "\nPosibles ruta(s) donde se aloja el paquete:\n" >> $scriptHistory
        which $package
        echo $(wich $package) >> $scriptHistory
    fi
}

b(){
    ./inicio.sh
}

clear 
figlet Busqueda de paquetes

while : 
do 

echo "\n¿Qué deseas hacer?
a). Buscar un paquete
b). Volver"

read option

$option

done