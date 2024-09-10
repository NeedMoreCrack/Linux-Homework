# Linux-Homework

抓取檔案的方法 先到你的linux家目錄下然後clone:
git clone https://github.com/NeedMoreCrack/Linux-Homework.git

執行.sh檔案的方法：
sh 檔名.sh

改虛擬機：
要先將/var/www權限改成777(原先755)
chmod 777 -R /var/www

再將/etc/apache2/sites-available權限改成777(原先644)
chmod 777 -R /etc/apache2/sites-available

最後到/etc/apache2/sites-available下啟用設定檔
sudo a2ensite city.conf && sudo a2ensite blog.conf && sudo a2ensite shopping.conf

再重啟apache
sudo systemctl reload apache2

最後再把上面兩個資料夾的權限改回來

本機的瀏覽器打下面這些網址就會顯示對應的字了：
city.linux.test
blog.linux.test
shopping.linux.test
