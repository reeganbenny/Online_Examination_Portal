<%-- 
    Document   : adminLogout
    Created on : 6 Sep, 2017, 11:59:39 PM
    Author     : Reegan
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
    %>