#!/bin/bash

# Nombre del archivo de configuración de Kitty
CONFIG_FILE=~/.config/kitty/kitty.conf

# Función para establecer la opacidad en la configuración de Kitty
set_opacity() {
	sed -i "s/background_opacity .*/background_opacity $1/" "$CONFIG_FILE"
}

# Verificar si la ventana está maximizada y ajustar la opacidad en consecuencia
if xprop -id $(xdotool getactivewindow) _NET_WM_STATE | grep -q "_NET_WM_STATE_MAXIMIZED_HORZ" &&
	xprop -id $(xdotool getactivewindow) _NET_WM_STATE | grep -q "_NET_WM_STATE_MAXIMIZED_VERT"; then
	set_opacity 0.099
else
	set_opacity 0.8
fi
