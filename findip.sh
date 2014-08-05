#! /bin/sh

#1. get current machine ip

ipaddr=`ifconfig eth0 | grep "inet addr" | awk -F ':' '{print $2}' | awk '{print $1}'`

if [ $? != 0 ];then
	echo "Get ip failure."
	return 1
fi

#echo "${ipaddr}"

#2. get host ip

hostip=`echo ${ipaddr} | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\."`

if [ $? != 0 ];then
	echo "Get Host ip error."
	return 1
fi

#echo "${hostip}"

#3. find active ip 

for i in `seq 255`;do
	pingip="${hostip}${i}"
	ping -c1 ${pingip} 
	#>/dev/null 
	#2>&1 &
done

wait 
#>/dev/null 2>&1 &

iplist=`arp -a | grep : | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"`

for i in ${iplist}; do	
	usr/local/samba/bin/smbclient -L //${i} -U root% >log 2>&1
	result=`cat log | grep -o "music"`
	if [ "" != "${result}" ];then
		echo ${i}
	fi
done

return 0



