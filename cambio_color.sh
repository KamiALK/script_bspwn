#archivo="/home/kamilo/.config/polybar/current.ini"
#patron="background = \${color.bg}"
#nuevo_valor="background = \${color.green}"
#sed -i "273s/$patron/$nuevo_valor/" "$archivo"
#echo "Se ha modificado la línea 273 en $archivo."
#polybar-msg cmd restart
#
#
#
#
#
archivo="/home/kamilo/.config/polybar/current.ini"
patron="background = \${color.green}"
nuevo_valor="background = \${color.bg}"
sed -i "273s/$patron/$nuevo_valor/" "$archivo"
echo "Se ha modificado la línea 273 en $archivo."
polybar-msg cmd restart
