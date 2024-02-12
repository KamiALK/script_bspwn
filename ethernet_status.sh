#echo "%{F2495e7} %{Fffffff}$(/usr/sbin/ifconfig enp37s0 | grep "inet" |awk '{print $2}')%{u-}"
#
#
#
#
#
#
#
#
#
#
#
#

DB_PROCESSES=$(sudo lsof -i :3306 | awk 'NR>1 { if ($1 == "docker-pr") { print "", substr($9, length($9)-4) } else {print $1,  substr($9, length($9)-4) } }')







if [ -n "$DB_PROCESSES" ]; then
    DB_STATUS="$DB_PROCESSES"
    echo "%{F1bbf3e}$DB_STATUS  "
else
    echo "%{Fe51d0b}%{u-}%{Fe51d0b} Desconectado"
fi


echo "$DB_STATUS"
#
