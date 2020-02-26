<%-- 
    Document   : addques
    Created on : 17 Aug, 2017, 11:48:15 PM
    Author     : Reegan
--%>
<%@page import="java.sql.*"%>
<%@include file="connection.jsp" %>
<%
StringBuffer text = new StringBuffer(request.getParameter("question"));
String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");
char answer=request.getParameter("answer").charAt(0);
int sid=Integer.parseInt(request.getParameter("id"));
String question=new String(text);
String result="false";
String str="";
String query="";
int n=0;
try
{
    str="insert into question (subid,question ,Aoption,Boption,Coption,Doption,answer) values ('"+sid+"','"+question+"','"+a+"','"+b+"','"+c+"','"+d+"','"+answer+"')";
    stmt.executeUpdate(str);
    
    query="select count(*) from question where subid="+sid;
    ResultSet rs=stmt.executeQuery(query);
    rs.next();
    n=rs.getInt(1);
    if(n>=5)
    {
        query="UPDATE subject SET status=1 WHERE id="+sid;
        stmt.executeUpdate(query);
    }
    result="true";
}
catch(Exception e)
{
    out.println("error   "+e.getMessage());
}

finally
{
if(result.equals("true")){
    response.sendRedirect("addQuestion.jsp?status=true&subid="+sid);
}else{
   response.sendRedirect("addQuestion.jsp?status=false&subid="+sid);
}
}
	
%>