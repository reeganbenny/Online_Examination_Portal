<%-- 
    Document   : createDatabase
    Created on : 13 Sep, 2017, 9:17:43 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
    try
    {
        
        String query2="CREATE TABLE if not exists login(id INT(100) NOT NULL AUTO_INCREMENT,usname VARCHAR(50) NOT NULL,upassword VARCHAR(50) NOT NULL,PRIMARY KEY (id));";
        String query3="CREATE TABLE if not exists studentdetails(id INT(100) NOT NULL AUTO_INCREMENT,loginid INT(100) NOT NULL,name VARCHAR(100) NOT NULL,housename VARCHAR(100) NOT NULL,district VARCHAR(100) NOT NULL,city VARCHAR(100) NOT NULL,state VARCHAR(100) NOT NULL,pin INT(10) NOT NULL,mobile BIGINT(11) NOT NULL,email VARCHAR(100) NOT NULL,college VARCHAR(100) NOT NULL,Degree VARCHAR(100) NULL DEFAULT NULL,PRIMARY KEY (id),FOREIGN KEY (`loginid`) REFERENCES login (id));";
        String query4="create table if not exists adminlogin(id int(100) not null auto_increment,uname varchar(100),upass varchar(100),primary key(id));";
        String query5="CREATE TABLE if not exists subject(id INT(100) NOT NULL AUTO_INCREMENT,sname VARCHAR(500) NOT NULL,stotal INT(100) NOT NULL,smark INT(100) NOT NULL,stime INT(100) NOT NULL,status INT(2) NOT NULL DEFAULT '0',PRIMARY KEY (id));";
        String query6="CREATE TABLE if not exists question(id INT(100) NOT NULL AUTO_INCREMENT,subid INT(100) NOT NULL,question LONGTEXT NULL,Aoption VARCHAR(500) NULL DEFAULT 'Not Found',Boption VARCHAR(500) NULL DEFAULT 'Not found',Coption VARCHAR(500) NULL DEFAULT 'Not found',Doption VARCHAR(500) NULL DEFAULT 'Not found',answer VARCHAR(50) NULL DEFAULT 'Not found',PRIMARY KEY (id),FOREIGN KEY(subid) REFERENCES subject(id));";
        String query7="create table if not exists tutorial (id int(100) NOT NULL AUTO_INCREMENT,sid int(100),header varchar(500),primary key(id),foreign key(sid) references subject(id));";
        String query8="CREATE TABLE if not exists result(id INT(100) NOT NULL AUTO_INCREMENT,lid INT(100) NULL DEFAULT NULL,subid INT(100) NULL DEFAULT NULL,total INT(100) NULL DEFAULT NULL,grade VARCHAR(5) NULL DEFAULT NULL,status INT(2) NULL DEFAULT '1',PRIMARY KEY (id),FOREIGN KEY (lid) REFERENCES login (id));";
        String query9="CREATE TABLE if not exists answers(id int(100) NOT NULL AUTO_INCREMENT,lid INT(100),subid INT(100),question INT(100),answer VARCHAR(2),PRIMARY KEY (id),foreign key(lid) references login(id));";
        String query10="create table if not exists explanation(id int(100) not null auto_increment,tid int(100),explanation longtext,primary key(id),foreign key(tid) references tutorial(id));";
        String query11="CREATE TABLE if not exists logical (id INT(100) NOT NULL AUTO_INCREMENT,question LONGTEXT NULL,status INT(2) NULL DEFAULT NULL,PRIMARY KEY (id))";
        stmt.executeUpdate(query2);
        stmt.executeUpdate(query3);
        stmt.executeUpdate(query4);
        stmt.executeUpdate(query5);
        stmt.executeUpdate(query6);
        stmt.executeUpdate(query7);
        stmt.executeUpdate(query8);
        stmt.executeUpdate(query9);
        stmt.executeUpdate(query10);
        stmt.executeUpdate(query11);
        
    }
    catch(Exception e)
    {
        System.out.println("Error:-----"+e.getMessage());
        response.sendRedirect("error.jsp");
    }
    finally
    {
        stmt.close();
        con.close();        
    }
    %>