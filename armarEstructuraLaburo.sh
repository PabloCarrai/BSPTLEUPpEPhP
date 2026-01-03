#!/bin/bash

#	Variables de git
g=$(which git)
#	Url del repositorio a usar
url="https://github.com/PabloCarrai/EPAPCPhP.git"
#	Esto trae la ruta desde donde corre el script que es en donde estaria la carpeta
dir_del_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#	Aca armo la ruta absoluta de la carpeta
carpeta_a_revisar="$dir_del_script/$1"


# Función para mostrar el mensaje de ayuda
mostrar_ayuda() {
    echo "Uso: $0 [CarpetaProyecto]"
    echo ""
    echo "Descripción: Este script crea una estructura a partir de un repositorio"
    echo ""
    echo "Ejemplo:"
    echo "  $0 CarpetaProyecto"
}

# Verificar si no se pasaron argumentos
if [ $# -eq 0 ]; then
    mostrar_ayuda
    exit 1
fi
#	Chequea que la carpeta no exista, si existe muestra mensaje y sale con error
if [ -d "$carpeta_a_revisar" ]; then
	echo "La carpeta $1 existe, elije otro nombre"
	exit 1
else
#	Sino clona el repositorio en la carpeta en cuestion
	$g clone $url $1
	echo "Repositorio Clonado en "
	echo $1    
fi
