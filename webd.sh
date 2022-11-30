systemctl stop systemd-resolved
sh /home/orangepi/www/clash-iptables.sh
tinyproxy -c /root/tinyproxy.conf
#calibre-server --port=8082 '/home/orangepi/CalibreLibrary' 
nginx

#source /srv/calibreweb/bin/activate
/srv/calibreweb/bin/cps 
