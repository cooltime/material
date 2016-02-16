#!/bin/sh

sysctl -w net.core.netdev_max_backlog=4096
sysctl -w net.core.somaxconn=4096
sysctl -w net.ipv4.tcp_max_syn_backlog=4096


sysctl -w net.ipv4.netfilter.ip_conntrack_max=655350
sysctl -w net.netfilter.nf_conntrack_max=655350
#sysctl -w net.ipv4.netfilter.ip_conntrack_tcp_timeout_established=1200

echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
