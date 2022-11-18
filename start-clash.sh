systemctl stop systemd-resolved
tinyproxy -c /root/tinyproxy.conf
clash -ext-ui  /home/orangepi/.config/clashdashboard/ -f /home/orangepi/.config/clash/ibcn_lazy.yml
