<%-- 
    Document   : getExplanation
    Created on : 10 Sep, 2017, 10:48:31 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@include file="connection.jsp" %>

<%
    String str="";
    String exp;
    try
    {
     int id=Integer.parseInt(request.getParameter("id"));
     String sub=request.getParameter("sub");
     int subid=Integer.parseInt(request.getParameter("subid"));
     str="SELECT * from explanation where sid="+subid+" and tid="+id;
     ResultSet rs=stmt.executeQuery(str);
       if (rs.next())
       {
           exp="<div id="+"exp1"+"><div id="+"exp2"+">"+sub+"</div><div id="+"exp3"+"><p>"+rs.getString("explanation") +"</p></div></div>";
           out.print(exp);
        } 
       else
          {
        out.print("Content Not available");
         }
    }catch(Exception e)
    {
          out.print("Error in Finding Explanation"+str);
    }
    %>