#!/bin/bash

scriptHistory=historial/script2.txt

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    output="\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
    echo $output
    echo $output >> scriptHistory
}

# Perimte visualizar todos los usuarios del sistema 
a(){
    USERS=$(cut -d ":" -f 1 /etc/passwd)
    clear
    output="\n\e[1;32m[USUARIOS DEL SISTEMA]\e[0m\n\n"
    $USERS
    echo $output >> $scriptHistory
}

# Permite ver los usuarios conectados en el sistema
b(){
    CONNECTED=$(w)
    clear
    echo "\n\e[1;32m[USUARIOS CONECTADOS]\e[0m\n$CONNECTED\n"
    echo "\n\e[1;32m[USUARIOS CONECTADOS]\e[0m\n$CONNECTED\n" >> $scriptHistory
}

# Permite ver los usuarios conectados en el sistema
# y valida si el usuario ingresado existe
c(){
    if [ -z "$1" ]; then 
        clear
        msgError
    else
        msg=$(grep -i $1 /etc/passwd) #Captura la información del usuario
        estadoUsuario=$(w | grep $1) #Verfica si el usuario se encuentra conectado
        
        if [ -z $msg ]; then
            clear
            echo "\n\e[0;31m[ERROR]\e[0m El usuario $1 no existe"
            echo "\n\e[0;31m[ERROR]\e[0m El usuario $1 no existe" >> $scriptHistory
        else
            if [ -z $estadoUsuario ]; then
                clear
                echo "\n$msg \e[0;31m[Usuario Desconectado]\e[0m"
                echo "\n$msg \e[0;31m[Usuario Desconectado]\e[0m" >> $scriptHistory
            else
                clear
                echo "\n$msg \e[1;32m[Usuario Conectado]\e[0m" >> $scriptHistory
            fi
        fi
    fi
}

# Añade un nuevo usuario recibiendo como parámetro
# el nombre que tendrá, un comentario y el grupo al  
# que va a pertenecer
d(){
    if [ -z "$1" -o -z "$2" -o -z "$3" ]; then 
        clear
        msgError
    else
        clear
        if [ -z "$4" ]; then
            group=$(grep -i $3 /etc/group)
            if [ -z "$group" ]; then # Si el grupo no existe, lo crea
                echo "\nCreando el grupo $3..."
                echo "\nCreando el grupo $3..." >> $scriptHistory
                addgroup $3
            fi
            useradd -c $2 -g $3 $1 # Crea el usuario con su comentario y lo añade al grupo
            echo "\n\e[1;32mUsuario creado correctamente\e[0m"
            echo "\n\e[1;32mUsuario creado correctamente\e[0m" >> $scriptHistory
        else
            clear 
            echo "\n\e[0;31m[ERROR]\e[0m Se han enviado más parámetros de los que se debería
        Prueba encerrando el comentario entre parentesís 
        d usuario (comentario) grupo"
            echo "\n\e[0;31m[ERROR]\e[0m Se han enviado más parámetros de los que se debería
        Prueba encerrando el comentario entre parentesís 
        d usuario (comentario) grupo" >> $scriptHistory
        fi
    fi
}

# Añade un nuevo grupo recibiendo como parámetro
# el nombre que tendrá
e(){
    if [ -z "$1" ]; then 
        clear
        msgError
    else
        groupadd $1
        clear
        echo "\n\e[1;32mGrupo creado correctamente\e[0m"
        echo "\n\e[1;32mGrupo creado correctamente\e[0m" >> $scriptHistory
    fi
}

# Elimina un usuario recibiendo como parámetro el nombre
# del usuario
f(){
    if [ -z $1 ]; then 
        clear
        msgError
    else
        user=$(grep -i $1 /etc/passwd) # Valida si el usuario existe
        if [ -z "$user" ]; then
            clear
            echo "\n\e[0;31m[ERROR]\e[0m El usuario $1 no existe"
            echo "\n\e[0;31m[ERROR]\e[0m El usuario $1 no existe" >> $scriptHistory
        else
            deluser $1
            clear
            echo "\n\e[1;32mUsuario eliminado correctamente\e[0m"
            echo "\n\e[1;32mUsuario eliminado correctamente\e[0m" >> $scriptHistory
        fi
    fi
}

# Elimina un grupo recibiendo como parámetro el nombre
# del grupo
g(){
    if [ -z "$1" ]; then 
        clear
        msgError
    else    
        group=$(grep -i $1 /etc/group) # Valida si el usuario existe
        if [ -z "$group" ]; then
            clear
            echo "\n\e[0;31m[ERROR]\e[0m El grupo $1 no existe" >> $scriptHistory
        else
            groupdel $1
            clear
            echo "\n\e[1;32mGrupo eliminado correctamente\e[0m" >> $scriptHistory
        fi   
    fi
}

# Volver al menu principal
h(){
    ./inicio.sh
}

clear
figlet Usuarios y Grupos

while :
do 
    echo "\n¿Qué desea hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Ver lista de usuarios
    b). Ver lista de usuarios conectados
    c). Ver información de un usuario echo \e[0;31m*\e[0m (nombre)
    d). Agregar un usuario \e[0;31m*\e[0m (nombre, comentario y grupo)
    e). Agregar un grupo \e[0;31m*\e[0m (nombre)
    f). Eliminar un usuario \e[0;31m*\e[0m (nombre)
    g). Eliminar un grupo \e[0;31m*\e[0m (nombre)
    h.) Volver"

    read option

    $option
done