#!bin/bash

# En caso que falten parámetros de entrada, esta función lo 
# notifica al usuario
msgError(){
    clear
    echo "\n\e[0;31m[ERROR]\e[0m Faltan parámetros"
}

installDeb(){
    status=$(apt list --installed $1)
    if [ $status ];then #Verifica la instalacion
        clear
        echo "\n\e[0;32mEstado del paquete:\e[0m $1\n"
        printf "Instalado: "
        for i in 1 * 20
        do 
            sleep 0.05
            printf "."
        done
        printf " \e[1;31m[No]\e[0m"
        echo "\n¿Desea intentar instalarlo? S/n" # Sugiere instalarlo si no lo está
        read op

        if [ $op = "S" -o $op = "s" -o $op = "y" -o $op = "Y" ]; then
            apt-get install $1
        fi

    else 
        clear
        echo "\n\e[0;32mEstado del paquete:\e[0m $1\n"
        printf "Instalado: "
        for i in 1 * 20
        do 
            sleep 0.05
            printf "."
        done
        printf " \e[1;32m[Si]\e[0m"

        echo "\n¿Que deseas hacer con este paquete?
a). Actualizar
b). Desinstalar"
        read op

        if [ $op = "a" ]; then 
            apt-get install $1
        else
            echo "\nEstá a punto de eliminar el paquete $1. ¿Desea continuar? S/n"
            read op2

            if [ $op2 = "S" -o $op2 = "s" -o $op2 = "y" -o $op2 = "Y" ]; then
                echo "\e[31mEliminando el paquete...\e[0m"
                apt-get remove $1
            fi

        fi

    fi


}

unpackTarGz(){
    clear
    echo "\n¿Deseas desempaquetar el fichero \e[1;34m$1\e[0m? S/n"
    read op

    if [ $op = "S" -o $op = "s" -o $op = "y" -o $op = "Y" ];then 
        echo "\n> Por favor ingresa la ruta donde quieres desempaquetar este fichero..."
        read path

        if [ -d $path ];then
            actual=$(pwd) 
            cd $path
            echo "\nDesempaquetando el fichero..."
            sleep 1
            tar -xzvf $1
            cd $actual
        else
            echo "\n\e[0;31m[ERROR]\e[0m $path no es un ruta válida"
        fi
    fi
}

unpackTar(){
    clear
    echo "\n¿Deseas desempaquetar el fichero \e[1;34m$1\e[0m? S/n"
    read op

    if [ $op = "S" -o $op = "s" -o $op = "y" -o $op = "Y" ];then 
        echo "\n> Por favor ingresa la ruta donde quieres desempaquetar este fichero..."
        read path

        if [ -d $path ];then
            actual=$(pwd) 
            cd $path
            echo "\nDesempaquetando el fichero..."
            sleep 1
            tar -xvf $1
            cd $actual
        else
            echo "\n\e[0;31m[ERROR]\e[0m $path no es un ruta válida"
        fi
    fi
}

unpackGz(){
    clear
    echo "\n¿Deseas desempaquetar el fichero \e[1;34m$1\e[0m? S/n"
    read op

    if [ $op = "S" -o $op = "s" -o $op = "y" -o $op = "Y" ];then 
        echo "\n> Por favor ingresa la ruta donde quieres desempaquetar este fichero..."
        read path

        if [ -d $path ];then
            actual=$(pwd) 
            cd $path
            echo "\nDesempaquetando el fichero..."
            sleep 1
            gzip -d $1
            cd $actual
        else
            echo "\n\e[0;31m[ERROR]\e[0m $path no es un ruta válida"
        fi
    fi
}

unpackZip(){
    status=$(apt list --installed zip)
    if [ $status ];then #Verifica la instalacion del paquete zip
        clear
        echo "\nParece que no dispones de un paquete para desempaqeutar este fichero...
¿Deseas descargar uno ahora? S/n"
        read op
        if [ $op = "S" -o $op = "s" -o $op = "y" -o $op = "Y" ];then 
            apt-get install zip
            unpackZip $1 
        fi
    else
        clear
        echo "\n¿Deseas desempaquetar el fichero \e[1;34m$1\e[0m? S/n"
        read op

        if [ $op = "S" -o $op = "s" -o $op = "y" -o $op = "Y" ];then 
            echo "\n> Por favor ingresa la ruta donde quieres desempaquetar este fichero..."
            read path

            if [ -d $path ];then
                actual=$(pwd) 
                cd $path
                echo "\nDesempaquetando el fichero..."
                sleep 1
                unzip $1
                cd $actual
            else
                echo "\n\e[0;31m[ERROR]\e[0m $path no es un ruta válida"
            fi
        fi
    fi
}

a(){

    if [ -z "$1" ]; then 
        clear
        msgError
    else
        if [ -d $1 -o -f $1 ];then # Para rutas o ficheros
            case $1 in
            *.tar.gz)
                unpackTarGz $1
                ;;
            *.tar)
                unpackTar $1
                ;;
            *.gz)
                unpackGz $1
                ;;
            *.zip)
                unpackZip $1
                ;;
            *)
                clear
                echo "\n\e[0;31m[ERROR]\e[0m El fichero no coincide con alguna extension válida \e[1;32m[.tar.gz, .tar, .gz, .zip]\e[0m"
                ;;
            esac
        else # Para paquetes
            clear
            echo "\nAl no tratarse de una ruta existente, el sistema tomara esta lectura como un paquete debian
¿Desea continuar? S/n"
            read op
            if [ $op = "S" -o $op = "s" -o $op = "y" -o $op = "Y" ];then 
                installDeb $1
            fi
        fi
    fi


}

b(){
    ./inicio.sh
}

clear 
figlet Instalacion de paquetes

while : 
do 

echo "\n¿Qué deseas hacer?
(Las opciones con un \e[0;31m*\e[0m requieren envío por parámetro)

a). Instalar un paquete \e[0;31m*\e[0m (Nombre o ruta del paquete)
b). Volver"

read option

$option

done