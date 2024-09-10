# Linux-Homework
  
抓取檔案的方法 先到你的本機終端機家目錄下然後clone:  
git clone https://github.com/NeedMoreCrack/Linux-Homework.git   
  
先改虛擬機的資料夾權限：  
要先將/var/www權限改成777(原先755)  
sudo chmod 777 -R /var/www  
  
再將/etc/apache2/sites-available權限改成777(原先644)  
sudo chmod 777 -R /etc/apache2/sites-available  
  
權限改完後到本機的家目錄進入Linux-Homework以sudo執行.sh檔案：  
sh 檔名.sh  
  
最後到/etc/apache2/sites-available下啟用設定檔  
cd /etc/apache2/sites-available
sudo a2ensite city.conf && sudo a2ensite blog.conf && sudo a2ensite shopping.conf  
sudo systemctl reload apache2  
  
最後再把上面兩個資料夾的權限改回來  
本機的瀏覽器打下面這些網址就會顯示對應的字了：  
city.linux.test  
blog.linux.test  
shopping.linux.test  
