# Obtener la ruta del directorio de trabajo actual
GIT_DIR="$PWD"

# Concatenar la ruta completa del directorio .git
FULL_GIT_DIR="${GIT_DIR}/.git"

# Verificar si el directorio .git existe
if [ -d "$FULL_GIT_DIR" ]; then
    # Ingresar al directorio .git
    cd "$FULL_GIT_DIR" || exit

    # Concatenar la ruta del archivo de texto
    RAMAS_FILE="./ramas.txt"

    # Verificar si el archivo de ramas existe
    if [ ! -f "$RAMAS_FILE" ]; then
        # Si no existe, crear el enlace simbólico
        ln -s HEAD "$RAMAS_FILE"
        echo "Se ha creado el enlace simbólico 'ramas.txt'"
    fi

    # Obtener la ruta completa del archivo de ramas
    ruta_rama="$FULL_GIT_DIR/ramas.txt"

    # Modificar el otro script con la nueva ruta del archivo de ramas
    sed -i "s|^ruta_rama=.*|ruta_rama=\"$ruta_rama\"|" /home/kamilo/.config/bin/htb_target.sh
    
    # Mostrar la ruta del archivo de ramas
    echo "La ruta del archivo de ramas es: $ruta_rama"
else
    echo "El directorio .git no existe en la ubicación actual."
fi
