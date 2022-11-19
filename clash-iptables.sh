
iptables -t nat -N clash
iptables -t nat -N clash_dns

# 这个是fake-ip对应的dns地址，一般不用动
iptables -t nat -A PREROUTING -p tcp --dport 53 -d 198.18.0.0/24 -j clash_dns
iptables -t nat -A PREROUTING -p udp --dport 53 -d 198.18.0.0/24 -j clash_dns
iptables -t nat -A PREROUTING -p tcp -j clash

# 让当前机器成为一个网关服务器
iptables -t filter -A FORWARD -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j MASQUERADE

# 这里需要注意的是，下面两行最后的 192.168.1.21 是当前旁路由的 IP 地址，请根据你自己的实际情况修改
# 目的DNS端口是后面clash配置里面的5354
iptables -t nat -A clash_dns -p udp --dport 53 -d 198.18.0.0/24 -j DNAT --to-destination 192.168.31.2:7853
iptables -t nat -A clash_dns -p tcp --dport 53 -d 198.18.0.0/24 -j DNAT --to-destination 192.168.31.2:7853

# 绕过一些内网地址，（RETURN 表示退出当前Chain，返回到上一级的Chain继续匹配）
iptables -t nat -A clash -d 0.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 10.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 127.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 169.254.0.0/16 -j RETURN
iptables -t nat -A clash -d 172.16.0.0/12 -j RETURN
iptables -t nat -A clash -d 192.168.0.0/16 -j RETURN
iptables -t nat -A clash -d 224.0.0.0/4 -j RETURN
iptables -t nat -A clash -d 240.0.0.0/4 -j RETURN

# 注意, 这边的7892对应后续clash配置里的redir-port
iptables -t nat -A clash -p tcp -j REDIRECT --to-ports 7892
