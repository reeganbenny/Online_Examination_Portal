<%-- 
    Document   : dbCOUNT
    Created on : 16 Aug, 2017, 10:45:24 AM
    Author     : Reegan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    
   
   try
    {
        
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","root");
     Statement stmt=con.createStatement();   
     
     String str="SELECT COUNT(id) FROM SUBJECT";
      
     ResultSet rs=stmt.executeQuery(str);
     rs.next();
       
     int n=rs.getInt(1);
   out.println("haaiii"+n);
        
  

 
           
               
    }
   catch(Exception e)
   {
       System.out.println(e.getMessage());
   }


 %>