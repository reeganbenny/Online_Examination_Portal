<%-- 
    Document   : validate
    Created on : 7 Sep, 2017, 11:21:35 AM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>


<%
    try
    {
     String email=request.getParameter("email");
     String str="SELECT * from login where usname='"+email+"'";
     ResultSet rs=stmt.executeQuery(str);
       if (rs.next())
       {
          
           out.print("Already registered with same email id!!!!");
        } else
          {
        
            out.print("");
         }
    }catch(Exception e)
    {
    }
    %>