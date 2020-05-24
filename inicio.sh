#!/bin/bash

USER=$(whoami)
TERMINAL=$(tty) #hostname
NETWORK=$(hostname -I)

clear
figlet Asistente Linux
echo "
Hola $USER, estás conectado en el terminal $TERMINAL con dirección de red $NETWORK"

echo "
¿Que deseas hacer hoy?
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
    15. Historial de ejecución de scripts"

read opcion 

case $opcion in
    1)
        sh 1_info/info.sh
        ;;
    2) 
        sh 2_gestion/gestion.sh
        ;;
    3)
        sh 3_mod/mod.sh
        ;;
    4)
        sh 4_permisos/permisos.sh
        ;;
    5)
        sh 5_copia/copia.sh
        ;;
    6)
        sh 6_busqueda/busqueda.sh
        ;;
    7)
        sh 7_instalacion/instalacion.sh
        ;;
    8)
        sh 8_limpieza/limpieza.sh
        ;;
    9) 
        sh 9_recuperar/recuperar.sh
        ;;
    10)
        sh 10_servicios/servicios.sh
        ;;
    11)
        sh 11_espacio/espacio.sh
        ;;
esac


