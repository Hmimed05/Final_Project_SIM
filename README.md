# Final_Project_SIM
# Final-project 
Web Services Monitoring     

Full Name : Hamza Hmimed


<h2>I-Introduction </h2>
<p> Website monitoring is the practice by which we monitor the availability, response times and loading times of a website.
The monitoring of a website is most often done by an external service which operates more or less frequent requests on the monitored pages. These queries can be made from different geographic locations.

The purpose of monitoring is to avoid loss of CA, customers or visitors due to server unavailability or too significant slowdown in loading times.

Website monitoring services obviously include alerting devices which make it possible to warn technical managers in the event of an incident or reaching predefined thresholds (limit loading time for example).

</p>

<h2>II- The purpose of work  </h2>
<p>Objective: install, configure, deploy and monitor a website . </br> 
    - Deploy a web service on CentOS 7 : </br>
        *  Web server : <B> Apache</B></br>
        *  Database: <B>MariaDB</B></br>
        *  Web Service: <B> PHP </B></br>
     - Monitor the Web Server & Database by Installing : <B>zabbix</B></br> </p>
     
 <h2>III-Installation and configuration of Environment :   </h2>
  <h3>  *************   Part 1 ******************* </h3>
      <h4>1- install web server </h4>  
     <div style="width: 600px; padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0;"> 
   <B> *reminder :</B> httpd is the Apache HTTP server program.
              It was designed to operate as an independent daemon process.
              When used this way, it will create a set of child processes or threads that will process requests.
     </div>
     
  to install httpd, you just have to type the following command: <B> yum -y install httpd </B>
  ![install_httpd](https://user-images.githubusercontent.com/65094783/82132203-89948500-97dd-11ea-9a42-512b50a81db7.PNG)
 
  to start httpd, you just have to type the following command: <B>systemctl start httpd </B> and <B> systemctl enable httpd</B>
    <div style="width: 600px; padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0;"> 
   ![status_httpd](https://user-images.githubusercontent.com/65094783/82132353-1a1f9500-97df-11ea-9d5d-b2f00b891aef.PNG)
   
   <B>*note :</B> Either enabled or disabled, will tell you if the service starts on boot. 
           In the case above, the Apache2 webserver “httpd”, it’s Enabled.</div>
           
    
    
   <div style="width: 600px; padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0;"> 
    <B>*reminder : </B>EPEL has an 'epel-release' package that includes gpg keys for package signing and repository information. 
         Installing this package for your  Linux version should allow you to use normal tools such as yum to install packages and their dependencies. </div>
 to install epel-release , you just have to type the following command:<B>yum -y install  epel-release</B> &&
  <B>rpm -Uvh https://miror.webstatic.com/yum/el7/webtatic-release.rpm</B>
  
  ![install_epel](https://user-images.githubusercontent.com/65094783/82132355-2efc2880-97df-11ea-90a5-9ec3872d4d6b.PNG)
  
  
 
  <h4>2- install php</h4>
  
  to install php , you just have to type the following command:</nb>
       yum install php php-pear php-cgi php-common php-mbstring php-snmp php-gd php-pecl-mysql php-xml php-mysql php-gettext php-bcmath
![install_php](https://user-images.githubusercontent.com/65094783/82133174-fb260080-97e8-11ea-9d41-e662c2f0dd8d.PNG)
to go from php5 to php 7 or vice versa, just type the following commands:
    
    **yum-config-manager --disable remi-php54 // Disable PHP 5 repositories
    **yum-config-manager --enable remi-php72  // enable PHP 7.2 repositories 


modify the php.ini file with the following lines:
  vi /etc/php.ini : 
         max_exexution_time = 600
         max_input_time=600
         memory_limit = 256M
         post_max_size=32M 
         upload_max_filesize=16M
         data.timezone=Africa/casablanca

restart httpd service : 
 systemctl restart httpd 
  
  
  <h4>3- install mariaDb server </h4>
    *reminder : MariaDB is an open source relational database management system which is an alternative solution compatible with the widely used technology of MySQL databases.
 
 to install mariaDB, you just have to type the following command:  yum install mariadb mariadb-server
 ![install_mariadb](https://user-images.githubusercontent.com/65094783/82133197-5fe15b00-97e9-11ea-9c12-d61ef556c417.PNG)
 to start and enable mariadb service  , you just have to type the following commands:systemctl start mariadb && systemctl enable mariadb  ![staus_maria](https://user-images.githubusercontent.com/65094783/82133200-6374e200-97e9-11ea-9a05-bb2c8f2b6ce4.PNG)

  
  <h3>  *********** Part 2 ********************</h3>
     in this part, we will try to install zabbix. 
     
 ***Note : Zabbix is an open-source monitoring software tool for diverse IT components, including networks, servers, virtual machines (VMs) and cloud services. Zabbix provides monitoring metrics, among others network utilization, CPU load and disk space consumption.****   
  
   <h4>4- Create zabbix zabbix DB</h4>
  we will connect to mysql with the following command:  mysql -u root -p  
 
we will create a database called "" zabbix "" :  create database zabbix ; 

we are going to give all the privileges of the "zabbix" database to  user called <zabbix> :
 grant all privileges on zabbix.* to zabbix@'localhost' identified by 'test123'
 grant all privileges on zabbix.* to zabbix@'%' identified by 'test123'
 ![creationDBZab](https://user-images.githubusercontent.com/65094783/82133275-70de9c00-97ea-11ea-98aa-8ff474534316.PNG)
      
   <h4>5- Install zabbix mysql db</h4>
  Adding Zabbix repository. 
 rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
 
![zabbixmysql](https://user-images.githubusercontent.com/65094783/82133294-bdc27280-97ea-11ea-9762-afe15513e932.PNG)


 Install Zabbix : yum install  -y zabbix-get zabbix-server-mysql zabbix-web-mysql zabbix-agent 
   
![zabbix](https://user-images.githubusercontent.com/65094783/82133324-30cbe900-97eb-11ea-8278-cb1e56cdc14c.PNG)


   
   <h4>6- Import zabbix sql file into DB</h4>
   
Change directory and go the Zabbix directory. 
cd /usr/share/doc/zabbix-server-mysql-4.0/
unzip create.sql.gz 
gunzip create.sql.gz
Import the MySQL dump file.
mysql -u root -p < create.sql

![zabbixsql](https://user-images.githubusercontent.com/65094783/82133332-46411300-97eb-11ea-8f48-3a8be6a36561.PNG)

   <h4>7- configure zabbix server conf file </h4>
   Now modify the Zabbix configuration file with Database details.

 vi /etc/zabbix/zabbix_server.conf

Modify the following parameters 

DBHost=localhost
DBPassword=test123

start and enable zabbix service , with the following comands  : 
 systemctl start zabbix-server
 systemctl enable zabbix-server
 
 ![staus_zibbexserv](https://user-images.githubusercontent.com/65094783/82133352-84d6cd80-97eb-11ea-88e1-3c5024ba209d.PNG)

   
   <h4>8- configure zabbix agent conf file </h4>
   
   Now modify the Zabbix agented configuration file 
  vi /etc/zabbix/zabbix_agented.conf

Modify the following parameters  :

server = 127.0.0.1
serverActive=127.0.0.1
Hostname=Zabbix-Server


start and enable zabbix-agent , with the following comands  :  
 systemctl start zabbix-agent
 systemctl enable zabbix-agent

![statusZabbixagent](https://user-images.githubusercontent.com/65094783/82133366-9f10ab80-97eb-11ea-9194-864fce4973c6.PNG)

  <h4>9- allow firewall  </h4>
     install firewall if not exit , with command :
yum install firewalld

start and enable firewall :

systemctl start firewalld
systemctl enable firewalld


Modify firewall rules : 

firewall-cmd --add-service=(http,https) --permanent
firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent
firewall-cmd --reload
firewall-cmd --list-all

and finally, we will restart all services:

systemctl restart zabbix-server
systemctl restart zabbix-agent
systemctl restart httpd


![systems start](https://user-images.githubusercontent.com/65094783/82133411-0cbcd780-97ec-11ea-879f-2d306198fe22.PNG)

 <h4>10- Setup Zabbix </h4>
 
 You can access Zabbix using following URL: in our case http://192.168.146.150/zabbix/
 You should see the welcome page.
![zabbix interface](https://user-images.githubusercontent.com/65094783/82133441-8359d500-97ec-11ea-92ca-3946fd0daca8.PNG)
 Click Next.
 Here you Zabbix will check installed PHP, MySQL/MariaDB versions and parameters, etc.
 If you see any parameter failing, you have to modify it and refresh the page.
 ![zabb2](https://user-images.githubusercontent.com/65094783/82133454-ad12fc00-97ec-11ea-9251-6950dd3fffb3.PNG)
 Click Next. 
 Add database details and click Next. 
  ![zabb3](https://user-images.githubusercontent.com/65094783/82133462-c0be6280-97ec-11ea-8b17-793392477e8e.PNG)
  Then you will see server details, and you can add any name for “Name”.
  ![zabb4](https://user-images.githubusercontent.com/65094783/82133483-efd4d400-97ec-11ea-8496-73257f47bdf0.PNG)
  Click Next. You should see the Database details and server details.
  ![zabb5](https://user-images.githubusercontent.com/65094783/82133487-02e7a400-97ed-11ea-9eb0-a79ffe499f66.PNG)
  Click Next to complete the installation.
  ![zabb6](https://user-images.githubusercontent.com/65094783/82133496-18f56480-97ed-11ea-9523-b8148e36f466.PNG)
   Click finish to access the login page.
   ![zab8](https://user-images.githubusercontent.com/65094783/82133503-40e4c800-97ed-11ea-91e5-b04a56b516d6.PNG)
   The default login name is “Admin” and password is “zabbix”. You will go to the Zabbix Dashboard.
    click on configuration ---> hosts and enableed ""zabbix server""
   
   ![122](https://user-images.githubusercontent.com/65094783/82170113-d783b880-98c3-11ea-9976-90f89aedf85e.PNG)

   ![zabbixfin](https://user-images.githubusercontent.com/65094783/82133657-fc5a2c00-97ee-11ea-9035-489ad9ba8d67.PNG)
   <h2>IV- Web Application  </h2>
   
   <h4> 1- Technique used </h4>
   after having presented the application made available to you in the context of carrying out this project, we discuss in this part the    techniques and languages used:
    - PHP: designates a computer language, or a scripting language, used mainly for the design of dynamic websites.
    
   ![php1](https://user-images.githubusercontent.com/65094783/82169872-1b29f280-98c3-11ea-9cd7-37c3cd3c9e01.PNG)
  
  - Css: is a computer language used on the Internet to format HTML or XML files.
   - Bootstrap: is a collection of useful tools for the creation of the design of websites and web applications.
   -javascript: is a programming language that allows you to implement complex mechanisms on a web page.
  
   <h4> 2- Application Database </h4>  
   we made a simple database (Mysql) of 6 tables:
   

![base](https://user-images.githubusercontent.com/65094783/82168995-68589500-98c0-11ea-9f70-097923b4f4f2.PNG)

   
   
  <h4> 3-web application : </h4>
      I created a web application with php, which manages student results. The project is intended for all students and teachers of the schools.
  for the admins interface (the teachers), we find that it is possible to do several tasks:
     - Authentication to the admin part login :( for example: login: hamza && password: 123456789)
     
   ![site1](https://user-images.githubusercontent.com/65094783/82166587-355ed300-98b9-11ea-8094-1e8687f6ee70.PNG)
   
   - admin interface or dashboards: displays multiple data and tasks that can do it
  
  ![site2](https://user-images.githubusercontent.com/65094783/82166746-adc59400-98b9-11ea-8d31-b89327f3b9d4.PNG)
  
  -  you can create a new class or control the old classes
    * create class
    
   ![site3](https://user-images.githubusercontent.com/65094783/82166765-bf0ea080-98b9-11ea-908d-326131ebb5a1.PNG)
   
   * manage classes 
    
   ![site4](https://user-images.githubusercontent.com/65094783/82166783-cc2b8f80-98b9-11ea-9833-4b5107469ea8.PNG)
  
   -you can add  a new subject  and  control the old subjects 
    
   * add subject
   
   ![1](https://user-images.githubusercontent.com/65094783/82167208-588a8200-98bb-11ea-8833-f8f43ee86a86.PNG)
   
   *manage subjects
   
   ![2](https://user-images.githubusercontent.com/65094783/82167211-59231880-98bb-11ea-9ae6-865205356850.PNG)
  
  -you can combine the subjects for a chosen class or manage this combinaiton 
   
   *add combination 
   
   ![3](https://user-images.githubusercontent.com/65094783/82167214-59bbaf00-98bb-11ea-9653-8e47395fe360.PNG)
   
   *manage combination
   
 ![4](https://user-images.githubusercontent.com/65094783/82167215-59bbaf00-98bb-11ea-957b-571fa3aa6951.PNG)
 
 
 - it is also almost the same for the management of students and results .. more than it is possible to change the admin password .
 
 <h2> V- web service monitoring  : </h2>
 
   <h4>1-Configuring a host : </h4>
    
 To configure a host in Zabbix frontend, do the following:   
 Go to: Configuration → Hosts
 ![host](https://user-images.githubusercontent.com/65094783/82498426-404f7880-9af0-11ea-8488-08fb6b44dca9.PNG)
Click on Create host to the right (or on the host name to edit an existing host)

![createHost](https://user-images.githubusercontent.com/65094783/82498455-51988500-9af0-11ea-908d-f2549869eba1.PNG)

Enter parameters of the host in the form . and go to templates to add linked templetes 

![agentToHost](https://user-images.githubusercontent.com/65094783/82498650-a805c380-9af0-11ea-8e5d-0e12970a8860.PNG)

![succesAddHost](https://user-images.githubusercontent.com/65094783/82500477-b9040400-9af3-11ea-875e-6438650c626c.PNG)



<h4> 2-Check Web Site URL From Zabbix Server <h4>
  we're going to show the website url as a Zabbix server. A large environment used open source Linux-based network monitoring tools as the Zabbix server. You can buy a domain and hosting package from any other location, but your website down or up, you can check it from the Zabbix server.
 
   * Go to your  host or zabbix server then click on Web.
   * See above right Create a web scenario click on it 
   * Show pop-up window enter your website information
   ![senario](https://user-images.githubusercontent.com/65094783/82500089-1481c200-9af3-11ea-96d4-fa5e9ea7e070.PNG)
   * Go to steps and add URL
   ![steps_scenario](https://user-images.githubusercontent.com/65094783/82500669-1b5d0480-9af4-11ea-8768-d349a670b11f.PNG)

   *Create trigger for student_result site url. 
   ![trigger](https://user-images.githubusercontent.com/65094783/82500719-3cbdf080-9af4-11ea-88f0-b463b9689bb4.PNG)
   * the result of monitoring this scenario is :
   ![WhatsApp Image 2020-05-21 at 02 55 19 (1)](https://user-images.githubusercontent.com/65094783/82512155-849e4100-9b0f-11ea-9f2d-6ea68ff7f7c2.jpeg)
   
   

 
 
 
     

   
