#!/bin/zsh

cd /etc/ssh
echo "PermitRootLogin yes" >> sshd_config
hostPath="/etc/hosts"
echo "Please enter your linux ip:"
read ip
echo "$ip blog.linux.test " >> $hostPath
echo "$ip shopping.linux.test " >> $hostPath
echo "$ip city.linux.test " >> $hostPath
echo "Please enter your linux name:"
read linuxName
echo "Please enter your linux password:"
read -s linuxPw
ssh -t $linuxName@$ip <<EOF
echo $linuxPw | sudo -S bash -c '
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
chmod 755 -R /var/www
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
</VirtualHost>" > shopping.conf
cd /etc/apache2/sites-available && sudo a2ensite city.conf && sudo a2ensite blog.conf && sudo a2ensite shopping.conf && sudo systemctl reload apache2
cd /etc/ssh
sed -i '/PermitRootLogin yes/d' sshd_config
'
EOF
