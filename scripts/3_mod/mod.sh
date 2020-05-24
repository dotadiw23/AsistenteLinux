#!bin/bash

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\e[0;31m[ERROR]\e[0m Faltan parámetros"
}

# Lista de usuarios y grupos en el sistema
a(){
    clear
    echo "\n\e[0;32m[Usuarios del sistema]\e[0m" 
    cat /etc/passwd
    
    echo "\n\e[0;32m[Grupos del sistema]\e[0m" 
    cat /etc/group
}   

# Cambia el nombre de un usuario, recibiendo como
# parámetro el nuevo nombre y el nombre actual del usuario
b(){
    if [ -z "$1" -o -z "$2" ]; then
        clear
        msgError
    else 
        clear
        user=$(grep -i $2 /etc/shadow)
        if [ -z  "$user" ]; then
            echo "\e[0;31m[ERROR]\e[0m El usuario $2 no existe"
        else
            usermod -l $1 $2
            echo "\n\e[0;32mNombre de usuario actualizado\e[0m"
        fi
    fi
}

# Cambia el nombre de un grupo, recibiendo como
# parámetro el nuevo nombre y el nombre actual del grupo
c(){
    if [ -z "$1" -o -z "$2" ]; then
        clear
        msgError
    else 
        clear
        group=$(grep -i $2 /etc/group)
        if [ -z  "$group" ]; then
            echo "\e[0;31m[ERROR]\e[0m El grupo $2 no existe"
        else
            groupmod -n $1 $2
            echo "\n\e[0;32mNombre de usuario actualizado\e[0m"
        fi
    fi
}

# Cambiar de grupo a un usuario, recibe como
# parámetro el nombre del usuario y el nombre del 
# grupo al que se desea cambiar
d(){
    if [ -z "$1" -o -z "$2" ]; then
        clear
        msgError
    else
        clear
        user=$(grep -i $1 /etc/passwd)
        if [ -z "$user" ]; then
            echo "\e[0;31m[ERROR]\e[0m El usuario $1 no existe"
        else
        group=$(grep -i $2 /etc/group)
            if [ -z "$group" ]; then
                echo "\e[0;31m[ERROR]\e[0m El grupo $2 no existe"
            else
                usermod -g $2 $1 
                echo "\n\e[0;32mCambio de grupo realizado con éxito\e[0m"
            fi
        fi
    fi
}

# Volver al enú principal
e(){
    ./inicio.sh
}

clear
figlet Usuarios y Grupos Mod

while :
do 
    echo "\n¿Qué desea hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Ver lista de usuarios y grupos del sistema
    b). Cambiar nombre de un usuario \e[0;31m*\e[0m (nuevoNombre, nombre)
    c). Cambiar nombre de un grupo \e[0;31m*\e[0m (nuevoNombre, nombre)
    d). Cambiar el grupo al que pertenece un usuario \e[0;31m*\e[0m (usuario, grupo)
    e). Volver"

    read option

    $option
done