<%-- 
    Document   : subjectSession
    Created on : 20 Aug, 2017, 7:56:28 AM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        
int time=Integer.parseInt(request.getParameter("stime"));
int mark=Integer.parseInt(request.getParameter("smark"));
String subname=request.getParameter("sname");
int total=Integer.parseInt(request.getParameter("stotal"));
int id=Integer.parseInt(request.getParameter("subid"));
session.setAttribute("stime", time);
session.setAttribute("smark", mark);
session.setAttribute("subname", subname);
session.setAttribute("stotal", total);
session.setAttribute("subid", id);
response.sendRedirect("exam.jsp?sname="+subname+"&stotal="+total+"&stime="+time+"&smark="+mark+"&subid="+id);
    }
    catch(Exception e)
    {
        out.println("error "+e.getMessage());
    }

%>