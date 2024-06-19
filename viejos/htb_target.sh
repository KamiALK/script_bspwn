#
#ip_target=$(cat ~/.config/bin/target | awk '{print $1}')
#name_target=$(cat ~/.config/bin/target | awk '{print $2}')
#
#if [ $ip_target ] && [ $name_target ]; then
#	echo "%{Fe51d0b}什%{Fffffff} $ip_target - $name_target"
#elif [ $(cat ~/.config/bin/target | wc -w) -eq 1 ]; then
#	echo "%{Fe51d0b}什%{Fffffff} $ip_target"
#else
#	echo "%{Fe51d0b}ﲅ %{u-}%{Fffffff} No target"
#fi


if pgrep -x "code" > /dev/null; then
    estado="activado"
else
    estado="desactivado"
fi

ruta_rama="/home/kamilo/Documentos/testing_entorno/.git/ramas.txt"
# ramas_cat=$(cat /home/kamilo/Documentos/testing_entorno/.git/ramas.txt)

ramas_cat=$(cat "$ruta_rama")
rama_limpia=$(echo "$ramas_cat" | sed 's/ref: refs\/heads\///')

if [ "$estado" = "activado" ]; then
    if [ "$rama_limpia" = "main" ] || [ "$rama_limpia" = "master" ]; then
        echo "%{F1bbf3e}   %{u-}%{F1bbf3e} $rama_limpia  "
    else
        echo "%{F1bbf3e}  %{u-}%{F1bbf3e} $rama_limpia  "
    fi
else
    echo "%{Fe51d0b} %{u-}%{Fffffff} Desconnected"
fi


