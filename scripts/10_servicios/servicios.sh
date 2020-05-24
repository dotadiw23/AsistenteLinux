#!bin/bash

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\e[0;31m[ERROR]\e[0m Faltan parámetros"
}

# Permite ver procesos0
a(){
    clear
    top
    clear
}

# Filtra un proceso por PID
b(){
   if [ -z "$1" ]; then
        clear
        msgError
   else
        clear
        echo "\e[0;32mResultados para el proceso idenfiticado con PID:\e[0m [$1]\n"
        top -p $1
        clear
   fi 
}

# Finaliza un servicio/proceso
e(){
    if [ -z "$1" ]; then
        clear
        msgError
    else
        clear
        echo "\n\e[0;31mFinalizando\e[0m el proceso...\n"
        kill $1
        echo "Acción terminada\n"

    fi 
}

g(){
    ./inicio.sh
}

clear
figlet Procesos y Servicios

while :
do
    echo "\n¿Qué desea hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Consultar listado de servicios/procesos en ejecución (Pulse q para salir de esta opción)
    b). Buscar un proceso \e[0;31m*\e[0m (PID del proceso)
    c). Iniciar un servicio/proceso \e[0;31m*\e[0m (PID del servicio/proceso)
    d). Restaurar un servicio/proceso \e[0;31m*\e[0m (PID del servicio/proceso)
    e). Finalizar un servicio/proceso \e[0;31m*\e[0m (PID del servicio/proceso)
    f). Volver"

    read option

    $option
done