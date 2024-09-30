useradd -m -s /bin/bash user1
useradd -m -s /bin/bash user2
useradd -m -s /bin/bash user3
echo "user1:user1" | sudo chpasswd
echo "user2:user2" | sudo chpasswd
echo "user3:user3" | sudo chpasswd
groupadd ios113
usermod -aG ios113 user1
usermod -aG ios113 user2
usermod -aG ios113 user3

