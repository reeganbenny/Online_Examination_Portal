<%-- 
    Document   : connection
    Created on : 10 Sep, 2017, 3:47:13 PM
    Author     : Reegan
--%>

<%@page import="java.sql.*"%>
<%
 
Connection con  =   null;
Statement stmt=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
stmt=con.createStatement();  
}
catch(Exception e)
{
    System.out.println("Error :- "+e.getMessage());
}
%>