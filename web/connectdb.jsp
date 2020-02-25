<%-- 
    Document   : connectdb
    Created on : 6 Aug, 2017, 9:25:35 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
Connection con=null;
try{
 Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
     
}
catch(Exception e)
{
    System.out.println(e.getMessage());
}

    %>