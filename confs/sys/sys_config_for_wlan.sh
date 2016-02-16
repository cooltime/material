#!/bin/sh

sysctl -w net.core.netdev_max_backlog=4096
sysctl -w net.core.somaxconn=4096
sysctl -w net.ipv4.tcp_max_syn_backlog=4096


sysctl -w net.ipv4.netfilter.ip_conntrack_max=655350
sysctl -w net.netfilter.nf_conntrack_max=655350
#sysctl -w net.ipv4.netfilter.ip_conntrack_tcp_timeout_established=1200


sysctl -w net.ipv4.ip_local_port_range="10000 65000"

#TCP数据接收窗口发送窗口 默认是229376，131071
#sysctl -w net.core.rmem_default=229376
#sysctl -w net.core.wmem_default=229376
sysctl -w net.core.rmem_max=513920
sysctl -w net.core.wmem_max=513920


echo 0 > /proc/sys/net/ipv4/tcp_tw_recycle
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
