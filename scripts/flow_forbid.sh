#!/bin/bash

ETH="eth0"
#流量阈值，单位MB
THRESHOLD=50
#断网时间
SLEEP_INTERVAL=120
LOCK_FILE=/home/opdir/flow_forbid.lock

echo "----------------------check start on "$(date "+%Y-%m-%d %H:%M:%S")"------------------------"

if [ -f $LOCK_FILE ]
then
	echo "another process is processing the case, exit on "$(date "+%Y-%m-%d %H:%M:%S")
	exit 0
fi


RECV=$(dstat -n 1 1 | tail -1 | awk '{print $1}')
echo $RECV | grep "M"
if [ $? -eq 0 ]
then
    CURRENT=$(echo $RECV | awk -F 'M' '{print $1}')
else
    CURRENT=0
fi

echo "net traffic now is $RECV on "$(date "+%Y-%m-%d %H:%M:%S")

if [ $CURRENT -lt $THRESHOLD ]
then
    /sbin/ifconfig | grep $ETH
    if [ $? -eq 0 ]
    then
        echo "everything is ok on "$(date "+%Y-%m-%d %H:%M:%S")
    else
        /sbin/ifup $ETH
        sleep 10
        /sbin/ifconfig | grep $ETH
        if [ $? -eq 0 ]
        then
            /sbin/sysctl -w net.ipv4.netfilter.ip_conntrack_max=655350
            /sbin/sysctl -w net.netfilter.nf_conntrack_max=655350
            echo "$ETH is recovered on "$(date "+%Y-%m-%d %H:%M:%S")
        fi
    fi

    exit 0
fi

touch $LOCK_FILE
/sbin/ifdown $ETH
echo "$ETH is down on "$(date "+%Y-%m-%d %H:%M:%S")
sleep $SLEEP_INTERVAL
for i in `seq 1 1 5`
do
    /sbin/ifup $ETH
    sleep 10
    /sbin/ifconfig | grep $ETH
    if [ $? -eq 0 ]
    then
        /sbin/sysctl -w net.ipv4.netfilter.ip_conntrack_max=655350
        /sbin/sysctl -w net.netfilter.nf_conntrack_max=655350
        echo "$ETH is recovered on "$(date "+%Y-%m-%d %H:%M:%S")
	rm $LOCK_FILE
        exit 0
    fi
done
rm $LOCK_FILE
echo "failed to bring up $ETH on "$(date "+%Y-%m-%d %H:%M:%S")
exit 1
