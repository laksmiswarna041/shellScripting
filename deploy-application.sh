!/bin/bash
#firewall
sudo apt update
sudo apt install firewalld
sudo service firewalld start
sudo systemctl enable firewalld

#DB server
sudo apt install mysql-server-8.0 
sudo apt install mysql-server
sudo usermod -d /var/lib/mysql/ mysql
sudo service mysql start
sudo systemctl enable mysql.service

#configuring firewall for DB
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

#configure DB
sudo mysql -u root
mysql> USE database ecomdb;

#install required packages
sudo apt update
sudo apt intsall apache2
sudo apt install php
sudo apt install php-mysql
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

#configure apache2
sudo sed -i 's/index.html/index.php/g' /etc/apache2/apache2.conf

#start apache2
sudo service apache2 start
sudo systemctl enable apache2
sudo service apache2 status

#download code from git
sudo apt install git
git clone https://swarnalakshmi-g-b@bitbucket.org/swarnalakshmi-g-b/samplephpapllication.git

#hosting on apache2
cd samplephpapllication
sudo mkdir /var/www/localhost
sudo chown -R $USER:$USER /var/www/localhost
sudo vi /etc/apache2/sites-available/localhost.conf
sudo service apache2 start

#enable virtualhost
sudo a2ensite localhost
sudo service apache2 start
sudo a2dissite 000-default
sudo apache2ctl configtest
sudo service apache2 reload

#test localhost
curl http://localhost

#go to http://localhost on browser

#sub script to backup the mysql database directories, archive and backup
