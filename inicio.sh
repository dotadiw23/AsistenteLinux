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
        sh scripts/1_info/info.sh
        ;;
    2) 
        sh scripts/2_gestion/gestion.sh
        ;;
    3)
        sh scripts/3_mod/mod.sh
        ;;
    4)
        sh scripts/4_permisos/permisos.sh
        ;;
    5)
        sh scripts/5_copia/copia.sh
        ;;
    6)
        sh scripts/6_busqueda/busqueda.sh
        ;;
    7)
        sh scripts/7_instalacion/instalacion.sh
        ;;
    8)
        sh scripts/8_limpieza/limpieza.sh
        ;;
    9) 
        sh scripts/9_recuperar/recuperar.sh
        ;;
    10)
        sh scripts/10_servicios/servicios.sh
        ;;
    11)
        sh scripts/11_espacio/espacio.sh
        ;;
    12)
        sh scripts/12_memoria/memoria.sh
        ;;
    13)
        sh scripts/13_dispositivos/dispositivos.sh
        ;;
    14)
        sh scripts/14_backup/backup.sh
esac


