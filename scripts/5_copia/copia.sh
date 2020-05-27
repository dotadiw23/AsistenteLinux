#!bin/bash

#verifyAction() {

#}

#Permite la copia de archvivos
a(){

    clear
    echo "\n> Ingrese la ruta del fichero a copiar..."
    read file
    echo "\n> Ingrese la ruta de destino... "
    read destination

    if [ -d $file -o -f $file ]; then # Válida si el fichero a copiar existe
        if [ -d $destination ]; then # Válida si el directorio destino existe
            echo "\n\e[32mLa copia se esta llevando a cabo...\e[0m"
            sleep 1
            
            if [ -d $file ]; then # Si el fichero es un directorio hace una copia recursiva 
                cp -r $file $destination
            else
                cp $file $destination
            fi

            echo "\nEstado actual de la carpeta destino\n"
            actual=$(pwd)
            cd $destination
            ls -l
            cd $actual

        else
            echo "\n\e[31mEl directorio destino\e[0m [$destination] \e[31mno existe...\e[0m
Inténtalo nuevamente\n" 
        fi
    else
        echo "\n\e[31mEl fichero a copiar\e[0m [$file] \e[31mno existe...\e[0m
Inténtalo nuevamente\n"    
    fi

}

b(){
    ./inicio.sh
}

clear
figlet Copia de Ficheros

while : 
do 

echo "\n¿Qué deseas hacer?
a). Copia de archivos
b). Vover"

read option

$option

done