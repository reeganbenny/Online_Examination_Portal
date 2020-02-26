<%-- 
    Document   : examStart
    Created on : 6 Sep, 2017, 7:21:05 PM
    Author     : Reegan
--%>

<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javaFiles.User" %>
<%
  session.setAttribute("examStart", "true");
   int total=(int)session.getAttribute("stotal");
     int   id=(int)session.getAttribute("subid");
   ArrayList lst=User.questionSet(total,id);
    LinkedHashMap<Integer, String> lst1 = new LinkedHashMap<Integer, String>();
    session.setAttribute("set",lst);
    session.setAttribute("Allanswers",lst1);
  response.sendRedirect("test.jsp");
%>