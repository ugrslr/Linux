#! /bin/bash

##---------Zabbix Paketi İndirme----------##

wget https://github.com/ugrslr/Linux/raw/main/zabbix-6-4-1-ubuntu-22-04-all.deb

dpkg -i zabbix-6-4-1-ubuntu-22-04-all.deb

apt update

##---------Postgre Yükleme--------##

apt install postgresql postgresql-contrib -y

systemctl start postgresql.service

##-------Install Zabbix server, frontend, agent---------##

apt install zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y

chmod 777 $HOME

#-----------Create initial database----------------#

sudo -u postgres createuser zabbix -P

echo "DB kullanıcısı için vermiş olduğunuz şifreyi bir daha girin:"

read dbpswd

sudo -u postgres createdb -O zabbix zabbix

zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

echo "DBpassword=$dbpswd" >> /etc/zabbix/zabbix_server.conf

systemctl restart zabbix-server zabbix-agent apache2

systemctl enable zabbix-server zabbix-agent apache2