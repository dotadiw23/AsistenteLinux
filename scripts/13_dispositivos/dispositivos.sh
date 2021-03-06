#!bin/bash

scriptHistory=historial/script13.txt 

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros" >> $scriptHistory
}

a(){
    clear
    echo "\n\e[0;32m[Controladores detectados en el sistema]\e[0m\n"
    echo "\n\e[0;32m[Controladores detectados en el sistema]\e[0m\n" >> $scriptHistory
    lsusb
    echo $(lsusb) >> $scriptHistory

    echo "\n\e[0;32m[Dispositivos y particiones extraíbles detectados en el sistema]\e[0m\n"
    echo "\n\e[0;32m[Dispositivos y particiones extraíbles detectados en el sistema]\e[0m\n" >> $scriptHistory
    df -l -m
    echo $(df -l -m) >> $scriptHistory
}

b(){
     if [ -z $1 ]; then 
        clear
        msgError
    else
        clear 
        echo "\n\e[0;32m[Contenido de la unidad]\e[0m\n"
        echo "\n\e[0;32m[Contenido de la unidad]\e[0m\n" >> $scriptHistory
        ls $1
        echo $(ls $1) >> $scriptHistory
    fi
}

c(){
    if [ -z $1 ]; then 
        clear
        msgError
    else
    printf "\n\e[0;32m[Desmontando dispositivo]\e[0m"   
    printf "\n\e[0;32m[Desmontando dispositivo]\e[0m"   >> $scriptHistory
    for i in 1 * 30
    do
        sleep 0.05
        printf "\e[0;32m.\e[0m"
        printf "\e[0;32m.\e[0m" >> $scriptHistory
    done
    echo
    eject $1
    fi
}

d(){
    ./inicio.sh
}

clear 
figlet Entrada y Salida de Dispositivos

while :
do 
    echo "\n¿Qué desea hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Ver listado de dispositivos de entrada y salida conectados
    b). Visualizar contenido del dispositivo \e[0;31m*\e[0m (Punto de montaje) 
    c). Desmontar un dispositivo conectado \e[0;31m*\e[0m (Punto de montaje)
    d). Volver
    "

    read option

    $option
done