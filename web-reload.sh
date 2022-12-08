if [ "$1" == "d" ];
then
version="2.1.0"
curl -x 127.0.0.1:7890 -fsSL https://github.com/DrFZh/drfzh.github.io/raw/main/_pages/about.md -o /home/orangepi/www/html/static/fan.md
curl -x 127.0.0.1:7890 -fsSL https://cdnjs.cloudflare.com/ajax/libs/showdown/$version/showdown.min.js -o /home/orangepi/www/html/static/showdown.min.js
fi
cp /home/orangepi/www/html/index.html /var/www/html/index.html 
cp -R /home/orangepi/www/html/img /var/www/html/
cp -R /home/orangepi/www/html/static /var/www/html/
nginx -s reload