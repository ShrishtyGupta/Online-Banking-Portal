

Guide to Running the WEB Application

Resources Required : Tomcat Server, Netbeans IDE, Java 8, MySQL, MySQL Workbench

STEP 1: 
Clone the Project using the following command :  git clone https://github.com/ShrishtyGupta/Online-Banking-Portal.git

STEP 2: 
Import the project in Netbeans IDE as a maven web application. Or simply open the project and let netbeans detect that it isa maven web app. 

STEP 3:
Make sure that you are working in Local Instance with id and password as root and root. If you are unable to work in the specified instance create another one and take note of it's ID and password. 
Enter the instance and create database named icinbank using command : CREATE DATABASE icinbank;

STEP 3.1:
If you are not working in the instance with id password root. Then after making a new instance, go back to Netbeans IDE, and in project files icinbank>Other Sources>src/main/resoures>hibernate.cfg.xml change the usernamd and password to your unique username and password. 

STEP 4:
Below the Menu Bar, change the browser to Mozilla aor Chrome or any other web browser of your choice.

STEP 5:
Right click on icinbank Project in Netbeans and click build with dependencies. Then after build gets completed click on Run, make sure to select deployment server as Tomcat.
If you want to access the admin portal then you will have to create an entry in user table for admin with user type as admin. 
For normal customer users, entries can be made through the registration page in web portal itself. 
