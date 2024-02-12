

#IFACE=$(/usr/sbin/ifconfig | grep enp37s0 | awk '{print $1}' | tr -d ':')
#
#if [ "$IFACE" = "tun0" ]; then
#	echo "%{F1bbf3e} %{Fffffff}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
#else
#	echo "%{F1bbf3e}%{u-} Disconnected"
#fi






DB_PROCESSES=$(sudo lsof -i :8000 | awk 'NR>1 { if ($1 == "docker-pr") { print "", substr($9, length($9)-4) } else {print $1,  substr($9, length($9)-4) } }')


if [ -n "$DB_PROCESSES" ]; then
	DB_STATUS="$DB_PROCESSES"
	echo "%{F1bbf3e} %{F1bbf3e}$DB_STATUS"
else
	echo "%{Fe51d0b}ﲅ %{u-}%{Fe51d0b} Desconectado"
fi


echo "$DB_STATUS"


