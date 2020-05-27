#!bin/bash

scriptHistory=historial/script10.txt

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\e[0;31m[ERROR]\e[0m Faltan parámetros"
    echo "\e[0;31m[ERROR]\e[0m Faltan parámetros" >> $scriptHistory
}

status(){
    echo "\n\e[0;32m[Estado del servicio]\e[0m\n"
    echo "\n\e[0;32m[Estado del servicio]\e[0m\n" >> $scriptHistory
    systemctl status $1
    echo $(systemctl status $1) >> $scriptHistory
}

# Permite ver procesos
a(){
    clear
    top
}

# Filtra un proceso por PID
b(){
   if [ -z "$1" ]; then
        clear
        msgError
   else
        clear
        echo "\e[0;32mResultados para el proceso idenfiticado con PID:\e[0m [$1]\n"
        echo "\e[0;32mResultados para el proceso idenfiticado con PID:\e[0m [$1]\n" >> $scriptHistory
        top -p $1
        echo $(top -p $1) >> $scriptHistory
   fi 
}

# Inicia un servicio/proceso recibiendo como parámetro su nombre
c(){
    if [ -z $1 ]; then 
        msgError
    else
        clear
        systemctl start $1
        status $1
        echo "Proceso iniciado" >> $scriptHistory
    fi
}

# Reinicia un servicio/proceso recibiendo como parámetro su nombre
d(){
    if [ -z $1 ]; then 
        msgError
    else
        clear
        systemctl restart $1
        status $1
        echo "Proceso reiniciado" >> $scriptHistory
    fi
}

# Finaliza un servicio/proceso 
e(){
    if [ -z $1 ]; then 
        msgError
    else
        clear
        systemctl stop $1
        status $1
        echo "Proceso detenido" >> $scriptHistory
    fi
}

f(){
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
    c). Iniciar un servicio/proceso \e[0;31m*\e[0m (Nombre del servicio/proceso)
    d). Restaurar un servicio/proceso \e[0;31m*\e[0m (Nombre del servicio/proceso)
    e). Finalizar un servicio/proceso \e[0;31m*\e[0m (Nombre del servicio/proceso)
    f). Volver"

    read option

    $option
done