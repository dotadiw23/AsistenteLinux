#!bin/bash

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
}

# Genera un a copia total
a(){
    if [ -z "$1" ]; then 
        msgError
    else
        if [ -d "$1" -o -f "$1" ]; then 
            clear
            echo "\n> Ingresa la ruta en la que desea guardar tu copia total de seguridad..."
            read path

            if [ -d "$path" ]; then 
                fecha="$(date +%m-%d-%Y-%H-%M)"
                name="backup_total_$fecha.tar.gz"
                tar -czvf $name $1
                mv $name $path
                if [ -z "ls $path | grep $name" ]; then
                    echo "\n\e[0;31mNo se pudo crear la copia de seguridad\e[0m"
                else
                    echo "\n\e[0;32mCopia de seguridad creada con exito en: \e[0m $path"
                    echo "¿Desea ver el directorio contenedor? S/n"
                    read op 

                    if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ];then 
                        ls $path
                    fi
                fi
            else 
                clear 
            echo "\n\e[0;31m[ERROR]\e[0m $1 no es un directorio existente..."
            fi

        else
            clear 
            echo "\n\e[0;31m[ERROR]\e[0m $1 no existe..."
        fi
    fi
}
# Genera una copia diferecial
c(){
    clear
    echo "\n> Ingrese la ruta de los ficheros o directorios que desea guardar..."
    read files

    echo "\n> Ingrese la ruta donde desea guardar esta copia de seguridad..."
    read path

    fecha="$(date +%m-%d-%Y-%H-%M)"
    name="backup_diferencial_$fecha.tar.gz"
    tar -czvf $name $files
    mv $name $path

    if [ -z "ls $path | grep $name" ]; then
        echo "\n\e[0;31mNo se pudo crear la copia de seguridad\e[0m"
    else
        echo "\n\e[0;32mCopia de seguridad creada con exito en: \e[0m $path"
        echo "¿Desea ver el directorio contenedor? S/n"
        read op 

        if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ];then 
            ls $path
        fi
    fi
}

# Restaurar copia 
d(){
    if [ -z $1 ];then
        msgError
    else
        if [ -f $1 ]; then
            case $1 in 
                *tar*)
                    clear
                    echo "\n> Ingrese la ruta donde desea restablecer su copia..."
                    read path
                    if [ -d $path ];then
                        tar -xvzf $1 -C $path
                        echo "\n\e[0;32mIntentando extraer la copia en:\e[0m $path"
                        echo "¿Desea ver el directorio contenedor? S/n"
                        read op 

                        if [ $op = "y" -o $op = "Y" -o $op = "s" -o $op = "S" ];then 
                            ls $path
                        fi
                    else
                        echo "\n\e[0;31m[ERROR]\e[0m La ruta ingresada NO corresponde a la de un directorio..."
                    fi
                    ;;
                *)
                    clear
                    echo "\n\e[0;31m[ERROR]\e[0m El fichero no tiene un formato de copia de seguridad..."
                    ;;
            esac
        else
            clear
            echo "\n\e[0;31m[ERROR]\e[0m La ruta ingresada NO corresponde a la de un fichero..."
        fi
    fi
}

e(){
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
    c). Realizar un copia de seguridad diferencial
    d). Restaurar una copia (Ruta de la copia)
    e). Volver
    "

    read option

    $option
done