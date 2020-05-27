#!bin/bash

scriptHistory=historial/script9.txt

msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros" >> $scriptHistory
}

# Permite recuperar ficheros en la papelera
a(){
    if [ -z $2 ]; then
        if [ -z $1 ]; then
            msgError
        else # Para el directorio por defecto
            clear
            echo "\n> Ingresa el nombre de tu carpeta personal..."
            echo "\n> Ingresa el nombre de tu carpeta personal..." >> $scriptHistory
            read personalFolder
            echo $personalFolder >> $scriptHistory

            actual=$(pwd)
            cd /home/$personalFolder/.local/share/Trash/files
            search=$(ls -l | grep $1)
            
            if [ -z "$search" ];then 
                echo "\n\e[0;31mNo se han encontrado resultados para tu búsqueda\e[0m\n"
                echo "\n\e[0;31mNo se han encontrado resultados para tu búsqueda\e[0m\n" >> $scriptHistory
            else
                if [ -d "/home/$personalFolder" ]; then
                    echo "\nListado de ficheros eliminados que coinciden con el indicio \e[1;34m$1\e[0m\n"
                    echo "\nListado de ficheros eliminados que coinciden con el indicio \e[1;34m$1\e[0m\n" >> $scriptHistory
                    ls -l | grep $1
                    echo "\n¿Deseas recuperar estos archivos? S/n"
                    echo "\n¿Deseas recuperar estos archivos? S/n" >> $scriptHistory
                    read op
                    echo $op >> $scriptHistory

                    if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ]; then
                        printf "\nRecuperando ficheros"
                        printf "\nRecuperando ficheros" >> $scriptHistory
                        for i in 1 * 10
                        do 
                            sleep 0.05
                            printf "."
                            printf "." >> $scriptHistory
                        done

                        backup=$(date)
                        newFolder="/home/$personalFolder/backups/$backup"
                        mkdir -p "$newFolder"
                        mv $1* "$newFolder"
                        echo "\nPuedes encontrarlos en el directorio $newFolder"
                        echo "\nPuedes encontrarlos en el directorio $newFolder" >> $scriptHistory
                    fi
                else
                    echo "\n\e[0;31m[ERROR]\e[0m Parece que esa carpeta no existe"
                    echo "\n\e[0;31m[ERROR]\e[0m Parece que esa carpeta no existe" >> $scriptHistory
                fi
            fi
            cd $actual
        fi
    else # Para directorios personalizados
        if [ -d $2 ]; then
            clear
            echo "\n> Ingresa el nombre de tu carpeta personal..."
            echo "\n> Ingresa el nombre de tu carpeta personal..." >> $scriptHistory
            read personalFolder
            echo $personalFolder >> $scriptHistory

            actual=$(pwd)
            cd /home/$personalFolder/.local/share/Trash/files
            search=$(ls -l | grep $1)
            
            if [ -z "$search" ];then 
                echo "\n\e[0;31mNo se han encontrado resultados para tu búsqueda\e[0m\n"
                echo "\n\e[0;31mNo se han encontrado resultados para tu búsqueda\e[0m\n" >> $scriptHistory
            else
                if [ -d "/home/$personalFolder" ]; then
                    echo "\nListado de ficheros eliminados que coinciden con el indicio \e[1;34m$1\e[0m\n"
                    echo "\nListado de ficheros eliminados que coinciden con el indicio \e[1;34m$1\e[0m\n" >> $scriptHistory
                    ls -l | grep $1
                    echo "\n¿Deseas recuperar estos archivos? S/n"
                    echo "\n¿Deseas recuperar estos archivos? S/n" >> $scriptHistory
                    read op
                    echo $op >> $scriptHistory

                    if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ]; then
                        printf "\nRecuperando ficheros"
                        printf "\nRecuperando ficheros" >> $scriptHistory
                        for i in 1 * 10
                        do 
                            sleep 0.05
                            printf "."
                            printf "." >> $scriptHistory
                        done

                        backup=$(date)
                        mkdir -p "$2"
                        mv $1* "$2"
                        echo "\nPuedes encontrarlos en el directorio $2"
                        echo "\nPuedes encontrarlos en el directorio $2" >> $scriptHistory
                    fi
                else
                    echo "\n\e[0;31m[ERROR]\e[0m Parece que esa carpeta no existe"
                    echo "\n\e[0;31m[ERROR]\e[0m Parece que esa carpeta no existe" >> $scriptHistory
                fi
            fi
            cd $actual

        else 
            clear
            echo "\n\e[0;31m[ERROR]\e[0m \e[1;34m$2\e[0m no es un directorio..."
            echo "\n\e[0;31m[ERROR]\e[0m \e[1;34m$2\e[0m no es un directorio..." >> $scriptHistory
        fi
    fi
}

b(){
    ./inicio.sh    
}

clear 
figlet Recuperar archivos

while : 
do 

echo "\n¿Qué deseas hacer?
(Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)

> Si se recibe un solo parámetro el sistema lo tomará como un indicio de búsqueda
> Se se reciben 2 el segundo será tomado como el nombre un directorio destino para 
  recuperar todos los archivos que coincidan con el indicio. (Este directorio se guardará
  en la raíz de tu directorio personal). 

a). Recuperar un fichero \e[0;31m*\e[0m (Indicio del nombre de fichero)
b). Volver"

read option

$option

done