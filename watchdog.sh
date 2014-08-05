#! /bin/sh

#Frequency=10
WATCHQPFILE="/etc/watch.conf"

sleep 4

num=`ps -ef |grep -i QPlayer-new |wc -l`

if (test $num -gt 1)
then
	if [ -f "${WATCHQPFILE}" ]
        then 
		rm -f "${WATCHQPFILE}"
	fi
fi

while true
do
	num=`ps -ef |grep -i new |wc -l`
	if (test $num -gt 1)
	then
#		echo "yer running"
		sleep 6
	else
#		echo "Player no run"
		if [ -f "${WATCHQPFILE}" ]
		then 
			/system/update/recovery.sh
			rm -f "${WATCHQPFILE}"
			reboot
		else
			touch "${WATCHQPFILE}"
			reboot
		fi
	fi
done
