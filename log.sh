# Obtener la ubicación actual
ubicacion_actual=$(pwd)

# Definir el nombre del archivo de registro
archivo_logs="$ubicacion_actual/logs_vista_andres"

# Verificar si el archivo de registro ya existe
if [ -f "$archivo_logs" ]; then
    echo "El archivo de registro ya existe."
else
    touch "$archivo_logs"  # Crear el archivo si no existe
    echo "Se ha creado el archivo de registro $archivo_logs."

fi
# Verificar si el archivo de registro ya existe
if [ -f "$archivo_logs" ]; then
    echo "El archivo de registro ya existe."
else
    touch "$archivo_logs"  # Crear el archivo si no existe
    echo "Se ha creado el archivo de registro $archivo_logs."

fi

# Añadir un separador al archivo de registro
echo "----------------------------------------" >> "$archivo_logs"
echo "Nueva ejecución del script: $(date)" >> "$archivo_logs"
echo "----------------------------------------" >> "$archivo_logs"



# Entrar en la carpeta de logs de npm
cd /home/kamilo/.npm/_logs || { echo "Error: no se pudo cambiar al directorio de logs de npm"; exit 1; }

# Encontrar el archivo más reciente en la carpeta de logs de npm
archivo_mas_reciente=$(ls -t | head -n1)

# Verificar si se encontró algún archivo
if [ -z "$archivo_mas_reciente" ]; then
    echo "Error: no se encontraron archivos en la carpeta de logs de npm"
    exit 1
fi

# Copiar el contenido del archivo más reciente al archivo de registro principal
cat "$archivo_mas_reciente" >> "$archivo_logs"

echo "La información del archivo más reciente ha sido copiada correctamente al archivo de registro."
