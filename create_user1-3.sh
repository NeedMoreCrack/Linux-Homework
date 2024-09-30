sudo useradd -m -s /bin/bash user1
sudo useradd -m -s /bin/bash user2
sudo useradd -m -s /bin/bash user3
echo "user1:user1" | sudo chpasswd
echo "user2:user2" | sudo chpasswd
echo "user3:user3" | sudo chpasswd
sudo groupadd ios113
sudo usermod -aG ios113 user1
sudo usermod -aG ios113 user2
sudo usermod -aG ios113 user3

