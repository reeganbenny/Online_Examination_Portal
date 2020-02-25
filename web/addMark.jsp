<%-- 
    Document   : addMark
    Created on : 9 Oct, 2017, 11:43:29 AM
    Author     : HP
--%>
<%@page import="java.sql.*"%>
<%@include file="connection.jsp" %>
<%

int mark=Integer.parseInt(request.getParameter("mark"));
int lid=Integer.parseInt(request.getParameter("lid"));
int qid=Integer.parseInt(request.getParameter("qid"));

//out.println(mark+" "+lid+" "+qid);
String result="false";
String str="";
try
{
    str="update logicalanswer set mark="+mark+" ,status='check' where logicid="+qid+" and loginid="+lid;
    //out.println(str);
    stmt.executeUpdate(str);
    result="true";
}
catch(Exception e)
{
    out.println("error   "+e.getMessage());
}
finally
{
    response.sendRedirect("details.jsp?lid="+lid);
}
if(result.equals("true")){
 
}
	
%> 