#!/bin/bash
# Función para imprimir la ayuda
print_help() {
	echo "Uso: $0 <archivo.py>"
	echo "Descripción: Este script ejecuta un archivo Python y copia los errores al portapapeles."
}
# Verificar si se proporciona un archivo como argumento
if [ $# -ne 1 ]; then
	echo "Uso: $0 <archivo.py>"
	exit 1
fi

# Verificar si el archivo proporcionado existe
if [ ! -f "$1" ]; then
	echo "El archivo '$1' no existe."
	exit 1
fi

# Ejecutar el archivo Python y capturar la salida (incluyendo errores)
output=$(python3 "$1" 2>&1)

# Verificar si hubo errores
if [ $? -ne 0 ]; then
	# Si hubo errores, copiarlos al portapapeles
	echo "$output" | xclip -selection clipboard
	echo "Errores copiados al portapapeles."
else
	echo "La ejecución se completó sin errores."
fi
