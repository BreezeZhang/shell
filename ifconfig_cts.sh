echo "start exec ifconfig eth0 10.0.2.4 netmask 255.255.255.0 up"
ifconfig eth0 10.0.2.4 netmask 255.255.255.0 up
route add default gw 10.0.2.2 dev eth0
echo "*************************************************"
echo "*************************************************"

sleep 10

ipaddr=`ifconfig eth0 | grep "ip"`
if [ "" == "${ipaddr}" ];then
	reboot
fi

while true
do
	sleep 180
	ipaddr=`ifconfig eth0 | grep "ip"`
	if [ "" == "${ipaddr}" ];then
		reboot
	fi
done
