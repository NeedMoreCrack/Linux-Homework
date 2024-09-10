# Linux-Homework

要先將/var/www權限改成777(原先755)
chmod 777 -R /var/www

再將/etc/apache2/sites-available權限改成777(原先644)
chmod 777 -R /etc/apache2/sites-available

最後啟用設定檔
sudo a2ensite city.conf
sudo a2ensite blog.conf
sudo a2ensite shopping.conf

再重啟apache
sudo systemctl reload apache2

最後再把上面兩個資料夾的權限改回來
