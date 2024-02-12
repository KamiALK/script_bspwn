#!/bin/bash

archivo="/home/kamilo/.config/bin/cambio_color.sh"

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "El archivo $archivo no existe."
    exit 1
fi

# Leer el contenido del archivo línea por línea
while IFS= read -r linea; do
    if [[ $linea =~ ^\s*# ]]; then
        # Si la línea está comentada, la descomentamos
        echo "${linea//#/}" >> "$archivo.temp"
    else
        # Si la línea no está comentada, la comentamos
        echo "#$linea" >> "$archivo.temp"
    fi
done < "$archivo"

# Reemplazar el archivo original con el archivo temporal
mv "$archivo.temp" "$archivo"

echo "¡Comentarios alternados exitosamente en el archivo $archivo!"

# Establecer permisos para el archivo htb_target.sh
chmod +x "$archivo"

# Ejecutar el script htb_target.sh
bash "$archivo"

bspc wm -r
