#!bin/bash

scriptHistory=historial/script4.txt

msgError(){
    clear
    echo  "\n\e[0;31m[Error]\e[0m Faltan parámetros"
    echo  "\n\e[0;31m[Error]\e[0m Faltan parámetros" >> $scriptHistory
}

# Lista los directorios donde se encuentra un fichero con nombre similar
a(){
    if [ -z $1 ]; then 
        clear
        msgError

    else
        clear
        echo "\n\e[0;32mResultados para la búsqueda del fichero\e[0m [$1]
En ocasiones puede tardar un poco...\n"
        find / -name $1
        resul="$(find / -name $1)"
        echo "\n\e[0;32mResultados para la búsqueda del fichero\e[0m [$1]
En ocasiones puede tardar un poco...\n" >> $scriptHistory
        echo $resul >> scriptHistory
    fi
}

# Cambia los permisos de un fichero
b(){
    if [ -z "$1" -o -z "$2" ]; then # Valida si todos los parámetro requeridos
                                    # fueron enviados
        msgError
    else
        clear
        #Verifica si el path es válido
        if [ -d $1 -o -f $1 ]; then
            #chmod $2 $1
            actual=$(pwd)

            echo "\n\e[0;32mAplicando los cambios...\e[0m "
            echo "\n\e[0;32mAplicando los cambios...\e[0m " >> $scriptHistory
            sleep 2
            chmod $2 $1
            
            echo "\nEstado actual del directorio contenedor del fichero modificado\n"
            echo "\nEstado actual del directorio contenedor del fichero modificado\n" >> $scriptHistory
            cd "$1/.."
            ls -l

            cd $actual
        else
            echo "\n\e[0;31mParece que el fichero que intentas modificar no existe...\e[0m 
Inténtalo nuevamente"
            echo "\n\e[0;31mParece que el fichero que intentas modificar no existe...\e[0m 
Inténtalo nuevamente" >> $scriptHistory
        fi
    fi
}

c(){
    ./inicio.sh
}

clear
figlet Permisos

while :
do
    echo "\n¿Qué deseas hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Listar ficheros dado un nombre \e[0;31m*\e[0m (nombre del archivo o fichero)
    b). Cambiar permisos de un fichero \e[0;31m*\e[0m (nombre/rutaFichero, permisoNotacionOctal)
    c). Volver "
    
    read op

    $op
done