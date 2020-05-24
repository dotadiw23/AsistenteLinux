#!bin/bash

a(){
    clear
    echo "\n> Ingrese el nombre del paquete a buscar... "
    read package

    path_=$(which $package)

    # Posible path del paquete
    if [ -z $path_ ]; then
        echo "\n\e[0;31m[No se han encontrado posibles rutas donde se aloje el paquete\e[0m $package\e[0;31m]\e[0m"
    else
        echo "\nPosibles ruta(s) donde se aloja el paquete:\n"
        which $package
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