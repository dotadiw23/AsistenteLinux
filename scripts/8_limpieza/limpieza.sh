#!bin/bash

continue_=false

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
}

verify(){

    if [ $1 = "y" -o $1 = "Y" -o $1 = "s" -o $1 = "S" ]; then
        $continue_=true
    else 
        $continue_=false
    fi

}

# Permite eliminar un fichero
a(){
    if [ -z "$1" ]; then 
        clear
        msgError
    else
        clear
    
        if [ -f $1 ]; then
            rm $1
            echo "\n\e[0;32mEl fichero\e[0m $1 \e[0;32mse ha borrado correctamente \e[0m "
        else
            echo "\n\e[0;31m[ERROR]\e[0m No se ha podido borrar el fichero, compruebe la ruta"
        fi
    fi
}

# Permite eliminar un directorio 
b(){
    if [ -z "$1" ]; then 
        clear
        msgError
    else
        clear
        if [ -d $1 ]; then
            rm -r $1
            echo "\n\e[0;32mEl directorio\e[0m $1 \e[0;32mse ha borrado correctamente \e[0m "
        else
            echo "\n\e[0;31m[ERROR]\e[0m No se ha podido borrar el directorio, compruebe la ruta"
        fi

    fi
}

# Permite vaciar una carpeta
c(){
    if [ -z "$1" ]; then 
        clear
        msgError
    else
        clear
        if [ -d $1 ]; then
            rm -r $1/*
            echo "\n\e[0;32mEl contenido del directorio\e[0m $1 \e[0;32mse ha borrado correctamente \e[0m "
        else
            echo "\n\e[0;31m[ERROR]\e[0m No se ha podido borrar el directorio, compruebe la ruta"
        fi

    fi
}

d(){
    ./inicio.sh
}

clear 
figlet Limpieza de Archivos

while : 
do 

echo "\n¿Qué deseas hacer?
(Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)

a). Borrar un archivo \e[0;31m*\e[0m (Ruta absoluta del archivo)
b). Borar directorio \e[0;31m*\e[0m  (Ruta absoluta del directorio)
c). Borrar archivos dentro de un directorio especificado \e[0;31m*\e[0m (Ruta absoluta del directorio
d). Volver"

read option

$option

done