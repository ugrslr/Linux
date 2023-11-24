##---------Zabbix Paketi İndirme----------##

wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb

dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb

apt update

##---------Postgre Yükleme--------##

sudo apt install postgresql postgresql-contrib -y

sudo systemctl start postgresql.service

#sudo -i -u postgres

#Psql

#\l 

##-------Install Zabbix server, frontend, agent---------##

apt install zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y

chmod 777 /home/$USER

#(Kullanıcı dizinine Full erişim yetkisi vermek gerekiyor. "satu" yazan yere, sizin kurulumda verdiğiniz user'ı vermeniz  gerekiyor. )#

#-----------Create initial database----------------#

sudo -u postgres createuser --pwprompt zabbix

sudo -u postgres createdb -O zabbix zabbix

zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

#echo 

#nano /etc/zabbix/zabbix_server.conf

# (Zabbix konfigürasyon dosyasında düzenleme yapmak için nano editörü ile erişiyoruz)

#DBPassword=password

#(Burada, database kullanıcısı oluştururken verdiğimiz şifreyi giriyoruz.)#

#systemctl restart zabbix-server zabbix-agent apache2

#systemctl enable zabbix-server zabbix-agent apache2



Zabbix Default User: Admin
zabbix Default PW: zabbix
