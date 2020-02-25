<%-- 
    Document   : addques
    Created on : 17 Aug, 2017, 11:48:15 PM
    Author     : Reegan
--%>

<%@include file="connection.jsp" %>
<%

String sub=request.getParameter("sub");

String result="false";
String str="";
try
{
    str="insert into subject (sname,smark,stotal,stime,status) values ('"+sub+"',100,5,5,0)";
    stmt.executeUpdate(str);
    result="true";
}
catch(Exception e)
{
    out.println("error   "+e.getMessage());
}
if(result.equals("true")){
    response.sendRedirect("examDetails.jsp?status=add");
}else{
   response.sendRedirect("examDetails.jsp?status=false");
}
	
%>