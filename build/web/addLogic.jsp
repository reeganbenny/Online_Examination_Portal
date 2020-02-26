<%-- 
    Document   : addLogic
    Created on : 9 Oct, 2017, 6:27:39 PM
    Author     : HP
--%>


<%@include file="connection.jsp" %>
<%

String logic=request.getParameter("logic");

String result="false";
String str="";
try
{
    str="insert into logical (question,mark) values ('"+logic+"',50)";
    stmt.executeUpdate(str);
    result="true";
}
catch(Exception e)
{
    out.println("error   "+e.getMessage());
}
if(result.equals("true")){
    
    response.sendRedirect("LogicQuestionAdd.jsp?status=true");
}else{
   response.sendRedirect("LogicQuestionAdd.jsp?status=false");
}
	
%>