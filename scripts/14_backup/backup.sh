#!bin/bash

scriptHistory=historial/script14.txt

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros" >> $scriptHistory
}

# Genera un a copia total
a(){
    if [ -z "$1" ]; then 
        msgError
    else
        if [ -d "$1" -o -f "$1" ]; then 
            clear
            echo "\n> Ingresa la ruta en la que desea guardar tu copia total de seguridad..."
            echo "\n> Ingresa la ruta en la que desea guardar tu copia total de seguridad..." >> $scriptHistory
            read path
            echo $path >> $scriptHistory

            if [ -d "$path" ]; then 
                fecha="$(date +%m-%d-%Y-%H-%M)"
                name="backup_total_$fecha.tar.gz"
                tar -czvf $name $1
                mv $name $path
                if [ -z "ls $path | grep $name" ]; then
                    echo "\n\e[0;31mNo se pudo crear la copia de seguridad\e[0m"
                    echo "\n\e[0;31mNo se pudo crear la copia de seguridad\e[0m" >> $scriptHistory
                else
                    echo "\n\e[0;32mCopia de seguridad creada con exito en: \e[0m $path"
                    echo "\n\e[0;32mCopia de seguridad creada con exito en: \e[0m $path" >> $scriptHistory
                    echo "¿Desea ver el directorio contenedor? S/n"
                    echo "¿Desea ver el directorio contenedor? S/n" >> $scriptHistory
                    read op 
                    echo $op >> $scriptHistory

                    if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ];then 
                        ls $path
                        echo $(ls $path) >> $scriptHistory
                    fi
                fi
            else 
                clear 
                echo "\n\e[0;31m[ERROR]\e[0m $1 no es un directorio existente..."
                echo "\n\e[0;31m[ERROR]\e[0m $1 no es un directorio existente..." >> $scriptHistory
            fi

        else
            clear 
            echo "\n\e[0;31m[ERROR]\e[0m $1 no existe..."
            echo "\n\e[0;31m[ERROR]\e[0m $1 no existe..." >> $scriptHistory
        fi
    fi
}
# Genera una copia diferecial
c(){
    clear
    echo "\n> Ingrese la ruta de los ficheros o directorios que desea guardar..."
    echo "\n> Ingrese la ruta de los ficheros o directorios que desea guardar..." >> $scriptHistory
    read files
    echo $files >> $scriptHistory

    echo "\n> Ingrese la ruta donde desea guardar esta copia de seguridad..."
    echo "\n> Ingrese la ruta donde desea guardar esta copia de seguridad..." >> $scriptHistory
    read path
    echo $path >> $scriptHistory

    fecha="$(date +%m-%d-%Y-%H-%M)"
    name="backup_diferencial_$fecha.tar.gz"
    tar -czvf $name $files
    mv $name $path

    if [ -z "ls $path | grep $name" ]; then
        echo "\n\e[0;31mNo se pudo crear la copia de seguridad\e[0m"
        echo "\n\e[0;31mNo se pudo crear la copia de seguridad\e[0m" >> $scriptHistory
    else
        echo "\n\e[0;32mCopia de seguridad creada con exito en: \e[0m $path"
        echo "\n\e[0;32mCopia de seguridad creada con exito en: \e[0m $path" >> $scriptHistory
        echo "¿Desea ver el directorio contenedor? S/n"
        echo "¿Desea ver el directorio contenedor? S/n" >> $scriptHistory
        read op 
        echo $op >> $scriptHistory

        if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ];then 
            ls $path
            echo $(ls $path) >> $scriptHistory
        fi
    fi
}

# Restaurar copia 
c(){
    if [ -z $1 ];then
        msgError
    else
        if [ -f $1 ]; then
            case $1 in 
                *tar*)
                    clear
                    echo "\n> Ingrese la ruta donde desea restablecer su copia..."
                    echo "\n> Ingrese la ruta donde desea restablecer su copia..." >> $scriptHistory
                    read path
                    echo $path >> $scriptHistory
                    if [ -d $path ];then
                        tar -xvzf $1 -C $path
                        echo "\n\e[0;32mIntentando extraer la copia en:\e[0m $path"
                        echo "\n\e[0;32mIntentando extraer la copia en:\e[0m $path" >> $scriptHistory
                        echo "¿Desea ver el directorio contenedor? S/n"
                        echo "¿Desea ver el directorio contenedor? S/n" >> $scriptHistory
                        read op 
                        echo $op >> $scriptHistory

                        if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ];then 
                            ls $path
                            echo $(ls $path) >> $scriptHistory
                        fi
                    else
                        echo "\n\e[0;31m[ERROR]\e[0m La ruta ingresada NO corresponde a la de un directorio..."
                        echo "\n\e[0;31m[ERROR]\e[0m La ruta ingresada NO corresponde a la de un directorio..." >> $scriptHistory
                    fi
                    ;;
                *)
                    clear
                    echo "\n\e[0;31m[ERROR]\e[0m El fichero no tiene un formato de copia de seguridad..."
                    echo "\n\e[0;31m[ERROR]\e[0m El fichero no tiene un formato de copia de seguridad..." >> $scriptHistory
                    ;;
            esac
        else
            clear
            echo "\n\e[0;31m[ERROR]\e[0m La ruta ingresada NO corresponde a la de un fichero..."
            echo "\n\e[0;31m[ERROR]\e[0m La ruta ingresada NO corresponde a la de un fichero..." >> $scriptHistory
        fi
    fi
}

d(){
    ./inicio.sh
}

clear
figlet Copias de Seguridad

while :
do 
    echo "\n¿Qué desea hacer?
    (Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)
    a). Realizar un copia de seguridad total \e[0;31m*\e[0m (Ruta del directorio o fchero) 
    b). Realizar un copia de seguridad incremental \e[0;31m*\e[0m (Ruta del directorio o fichero) 
    c). Restaurar una copia (Ruta de la copia)
    d). Volver
    "

    read option

    $option
done