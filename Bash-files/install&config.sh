#!/bin/sh

#we have already explained the role of each command in the Readme file
#don't forget to enter the continent and the city  as a parameter of our Time Zones Supported by php : ./install&config.sh Africa Casablanca 


[ -z "${ZABBIX_PASSWD}" ] && ZABBIX_PASSWD=Zabbix_Passwd 

web_server_install(){
    
	
	
    sudo yum -y install httpd 
	
	sudo systemctl start httpd
 
    sudo systemctl enable httpd
	
    sudo    yum -y install  epel-release
	
    sudo    rpm -Uvh https://miror.webstatic.com/yum/el7/webtatic-release.rpm 
	
	
}

php_install(){

  #yum-config-manager --disable remi-php54

  #yum-config-manager --enable remi-php72
    
    sudo   yum install php php-pear php-cgi php-common php-mbstring php-snmp php-gd php-pecl-mysql php-xml php-mysql php-gettext php-bcmath

    sudo systemctl restart httpd  
  
  
   timezone=$(timedatectl | grep "Time zone:" | \
                awk -F':' '{ print $2 }' | awk '{ print $1 }')
  sudo sed -e 's/^post_max_size = .*/post_max_size = 16M/g' \
       -e 's/^max_execution_time = .*/max_execution_time = 300/g' \
       -e 's/^max_input_time = .*/max_input_time = 300/g' \
	   -e 's/^memory_limit =.*/ memory_limit = 256M/g' \
	   -e ' upload_max_filesize=.*/  upload_max_filesize=16M/g' \
       -e "s:^;date.timezone =.*:date.timezone = \"${timezone}\":g" \
       -i /etc/php.ini
	   
	 
  
}

mariadb_install(){

   sudo yum install mariadb mariadb-server
   
   sudo systemctl start mariadb

   sudo systemctl enable mariadb
  
   sudo  mysql_secure_installation

   cat <<EOF | sudo mysql -u root -p 
create database zabbix;
grant all privileges on zabbix.* to zabbix@localhost identified by \
'${ZABBIX_PASSWD}';
exit
EOF


  sudo  rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm 
  
  sudo zcat  /usr/share/doc/zabbix-server-mysql-4.0/create.sql.gz  | mysql -u root -p 

}

zabbix_server_install()
{ 
 sudo yum install  -y zabbix-get zabbix-server-mysql zabbix-web-mysql mod_ssl 
 
 
 sudo sed -e 's/# ListenPort=.*/ListenPort=10051/g' \
       -e "s/# DBPassword=.*/DBPassword=${ZABBIX_PASSWD}/g" \
       -i /etc/zabbix_server.conf


# Skip setup.php
  cat <<EOF | sudo tee /etc/zabbix/web/zabbix.conf.php
<?php
// Zabbix GUI configuration file.
global \$DB;

\$DB['TYPE']     = 'MYSQL';
\$DB['SERVER']   = 'localhost';
\$DB['PORT']     = '0';
\$DB['DATABASE'] = 'zabbix';
\$DB['USER']     = 'zabbix';
\$DB['PASSWORD'] = '${ZABBIX_PASSWD}';

// Schema name. Used for IBM DB2 and PostgreSQL.
\$DB['SCHEMA'] = '';

\$ZBX_SERVER      = 'localhost';
\$ZBX_SERVER_PORT = '10051';
\$ZBX_SERVER_NAME = '';

\$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
?>
EOF

   firewall-cmd --add-service={http,https} --permanent
  
   firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent
  
   firewall-cmd --reload
  
   firewall-cmd --list-all
 
   setsebool -P httpd_can_connect_zabbix 
  
  sudo  systemctl enable httpd zabbix-server 
   
  sudo systemctl restart httpd zabbix-server

}

zabbix_agent_install()
{
  
  sudo yum install -y zabbix-agent
 
  sudo sed -e "s/^Hostname=.*/Hostname=localhost/g" \
       -i /etc/zabbix/zabbix_agented.conf
	   
 
  sudo systemctl enable zabbix-agent
 
  sudo systemctl start zabbix-agent

}
zabbix_main()
{ 
web_server_install
php_install
mariadb_install
zabbix_server_install
zabbix_agent_install 
}

zabbix_main

