#!/bin/bash


#重置input规则
iptables -F INPUT
#这两个默认允许
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT


#这是默认的允许通道，lo,内网eth1
iptables -I INPUT 1  -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -I INPUT 2  -i lo -j ACCEPT
iptables -I INPUT 3  -i eth1 -j ACCEPT

#允许办公室的ip访问
iptables -A INPUT -s 106.2.205.114 -j ACCEPT

#这是开放tcp端口的地方
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
#是否允许53的UDP端口，需要看情况
#iptables -A INPUT -p udp -i eth0 --sport 53 -j ACCEPT
iptables -A INPUT -p udp -i eth0 --sport 6000:6100 -j ACCEPT

#允许icmp
iptables -A INPUT -p icmp -j ACCEPT

#不允许其他任何连接，放到最后
iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited
