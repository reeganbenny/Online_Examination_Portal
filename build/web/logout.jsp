<%-- 
    Document   : logout
    Created on : 6 Sep, 2017, 4:30:27 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

session.removeAttribute("username");
session.removeAttribute("loginid");
session.invalidate();
response.sendRedirect("index.jsp");
%>