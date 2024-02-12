#!/bin/bash

#!/bin/bash

# Define la ruta de los tres scripts
SCRIPT_UNO="/home/kamilo/.config/bin/intercambio_uno.sh"
SCRIPT_DOS="/home/kamilo/.config/bin/intercambio_dos.sh"
SCRIPT_TRES="/home/kamilo/.config/bin/intercambio_tres.sh"
SCRIPT_CUATRO="/home/kamilo/.config/bin/intercambio_cuatro.sh"

# Ejecuta los tres scripts
"$SCRIPT_UNO"
"$SCRIPT_DOS"
"$SCRIPT_TRES"
"$SCRIPT_CUATRO"
#  mia funciona Cambia el estado del script_state
#current_state=$(cat ~/.config/polybar/script_state)
#if [ "$current_state" = "0" ]; then
#    echo "1" > ~/.config/polybar/script_state
#else
#    echo "0" > ~/.config/polybar/script_state
#fi

#!/bin/bash

# Obtén el contenido actual del módulo
current_content=$(cat ~/.config/polybar/module_content)

# Cambia el contenido del módulo
if [ "$current_content" = "" ]; then
    echo "" > ~/.config/polybar/module_content
else
    echo "" > ~/.config/polybar/module_content
fi
