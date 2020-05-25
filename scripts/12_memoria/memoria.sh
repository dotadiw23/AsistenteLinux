#!bin/bash

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
}

# Permite ver memoria consumida
a(){
    clear 
    echo "\n\e[32m[Reporte de consumo de memoria del sistema]\e[0m\n"
    free -m
    echo "\n¿Desea ver una lista detallada de los procesos activos en el sistema? S/n"
    read op 

    if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ]; then
        echo
        ps aux --sort pmem
    fi
}

# Permite detener un proceso recibiendo como parámetro el nombre
# o PID del mismo
b(){
    if [ -z $1 ]; then 
        msgError
    else
        echo "\n\e[0;31mMatando\e[0m el proceso..."
        kill $1
    fi
}

c(){
    ./inicio.sh
}
clear
figlet Administracion de Memoria

while :
do 
    echo "\n¿Qué desea hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Ver reporte de consumo de memoria
    b). Detener un proceso activo \e[0;31m*\e[0m (PID del proceso)
    c). Volver
    "

    read option

    $option
done