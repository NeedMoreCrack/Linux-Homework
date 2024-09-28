#!/bin/zsh

cd /etc/ssh
echo "PermitRootLogin yes" >> sshd_config
hostPath="/etc/hosts"
echo "Please enter your linux ip:"
read ip
echo "$ip photo.linux.test " >> $hostPath
echo "$ip blog.linux.test " >> $hostPath
echo "$ip resume.linux.test " >> $hostPath
echo "Please enter your linux name:"
read linuxName
echo "Please enter your linux password:"
read -s linuxPw
ssh -t $linuxName@$ip <<EOF
echo $linuxPw | sudo -S bash -c '
cd /var/www/
mkdir -p photo
cd photo
touch index.htm
echo "photo.ubuntu.test" > index.htm
cd /var/www/
mkdir -p blog
cd blog
touch index.html
echo "<?php phpinfo(); ?>" > index.php
cd /var/www/
mkdir -p resume
cd resume
touch index.html
chmod 755 -R /var/www
echo "resume.ubuntu.test" > index.html
cd /etc/apache2/sites-available
touch photo.conf
echo "<VirtualHost *:80>
    ServerAdmin webmaster@photo.ubuntu.test
    ServerName photo.ubuntu.test
    DocumentRoot /var/www/photo
    ErrorLog /error.log
    CustomLog /access.log combined
    DirectoryIndex index.htm
</VirtualHost>" > photo.conf
touch blog.conf
echo "<VirtualHost *:80>
    ServerAdmin webmaster@blog.ubuntu.test
    ServerName blog.ubuntu.test
    DocumentRoot /var/www/blog
    ErrorLog /error.log
    CustomLog /access.log combined
    DirectoryIndex index.php
</VirtualHost>" > blog.conf
touch resume.conf
echo "<VirtualHost *:80>
    ServerAdmin webmaster@resume.ubuntu.test
    ServerName resume.ubuntu.test
    DocumentRoot /var/www/resume
    ErrorLog /error.log
    CustomLog /access.log combined
</VirtualHost>" > resume.conf
cd /etc/apache2/sites-available && sudo a2ensite photo.conf && sudo a2ensite blog.conf && sudo a2ensite resume.conf && sudo systemctl reload apache2
cd /etc/ssh
sed -i '/PermitRootLogin yes/d' sshd_config
'
EOF
open -na "Google Chrome" --args "photo.ubuntu.test" && open -na "Google Chrome" --args "blog.ubuntu.test" && open -na "Google Chrome" --args "resume.ubuntu.test"
