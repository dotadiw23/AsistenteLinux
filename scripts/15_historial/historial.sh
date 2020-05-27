#!bin/bash

volver(){
    clear
    ./inicio.sh
}

limpiar(){
    clear
    echo > historial/script$1.txt
}

leer(){
    clear
    echo "\n\e[0;32mHistorial de ejecución del script $1\e[0m "
    cat historial/script$1.txt
}

clear
figlet Historial de Ejecucion

while :
do 
    echo "
Selecciona un script parar ver su historial de ejecución...
    1. Información del Sistema
    2. Gestión de usuarios y grupos
    3. Modificación usuarios, grupos u otros
    4. Gestión de permisos
    5. Copia de archivos
    6. Búsqueda de paquetes
    7. Instalación de paquetes
    8. Limpieza de archivos
    9. Recuperación de archivos
    10. Gestión de servicios y procesos
    11. Espacio del equipo en disco
    12. Administración de memoria
    13. Entrada y salida de dispositivos
    14. Copia de seguridad
    15. Vaciar el historial de un script
    16. Volver"

    read opcion

    if [ $opcion -gt 14 ]; then 
        case $opcion in
        15)
            echo "\n> Ingresa el numero del script que deseas limpiar..."
            read numScript
            limpiar $numScript
            ;;
        16)
            volver
            ;;
        esac
    else
        if [ $opcion -lt 15 ];then 
            leer $opcion
        fi
    fi

done