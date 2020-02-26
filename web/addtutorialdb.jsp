<%-- 
    Document   : addtutorialdb
    Created on : 13 Sep, 2017, 11:16:51 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%

String head=request.getParameter("heading");
int id=Integer.parseInt(request.getParameter("id"));
StringBuffer text=new StringBuffer(request.getParameter("explanation"));
String result="false";
String str="";
String error="";
String explanation=new String(text);
try
{
    str="insert into tutorial (sid,header) values ("+id+",'"+head+"')";
    stmt.executeUpdate(str);
    str="select id from tutorial where header='"+head+"'";
    ResultSet rs=stmt.executeQuery(str);
    rs.next();
    int tid=rs.getInt("id");
    str="insert into explanation (sid,tid,explanation) values ("+id+","+tid+",'"+explanation+"')";
    stmt.executeUpdate(str);
    result="true";
}
catch(Exception e)
{
    out.println("error   "+e.getMessage());
    
}
finally
{
if(result.equals("true")){
    response.sendRedirect("addTutorial.jsp?status=true&id="+id);
}else{
   response.sendRedirect("addTutorial.jsp?status=false&id="+id);
}
}
	
%>