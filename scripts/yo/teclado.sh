#!/bin/bash

# Obtiene el layout actual del teclado
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Define el layout al que quieres cambiar
if [ $current_layout == "us" ]; then
    new_layout="es"
else
    new_layout="us"
fi

# Cambia al nuevo layout
setxkbmap $new_layout
