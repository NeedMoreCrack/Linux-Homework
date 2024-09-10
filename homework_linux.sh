#!/bin/zsh

cd /etc

hostPath="/etc/hosts"

echo "Enter linux ip:"
read ip
echo "$ip blog.linux.test " >> $hostPath
echo "$ip shopping.linux.test " >> $hostPath
echo "$ip city.linux.test " >> $hostPath

echo "Enter your linux name:"
read linuxName
ssh $linuxName@$ip <<EOF
cd /var/www/
mkdir -p city
cd city
touch index.html
echo "city" > index.html
cd /var/www/
mkdir -p blog
cd blog
touch index.html
echo "blog" > index.html
cd /var/www/
mkdir -p shopping
cd shopping
touch index.html
echo "shopping" > index.html
cd /etc/apache2/sites-available
touch city.conf
echo "<VirtualHost *:80>
    ServerAdmin webmaster@city.linux.test
    ServerName city.linux.test
    DocumentRoot /var/www/city
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > city.conf
touch blog.conf
echo "<VirtualHost *:80>
    ServerAdmin webmaster@blog.linux.test
    ServerName blog.linux.test
    DocumentRoot /var/www/blog
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > blog.conf
touch shopping.conf
echo "<VirtualHost *:80>
    ServerAdmin webmaster@shopping.linux.test
    ServerName shopping.linux.test
    DocumentRoot /var/www/shopping
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > city.conf
EOF
