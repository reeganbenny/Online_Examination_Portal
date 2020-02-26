<%-- 
    Document   : loginCheck
    Created on : 20 Aug, 2017, 5:15:28 AM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
     
   
<%
  

int id=0;

 


String uname=request.getParameter("form-username");
String upass=request.getParameter("form-password");

String str="select id from login where usname='"+uname+"' and upassword='"+upass+"'";    
Connection con=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery(str);

if(rs.next())
{
id=rs.getInt("id");
}
out.println(" id value will be  :- "+id);
//
}
catch(Exception e)
{
   out.println(str+"    "+e.getMessage());
}
finally
{
    if(id!=0)
    {
        session.setAttribute("loginid" , id);
        session.setAttribute("username", uname);
        session.removeAttribute("errorMessage");
        response.sendRedirect("examSelector.jsp");
    }
 
    else
    {
        request.setAttribute("errorMessage", "Invalid username or password");
       request.getRequestDispatcher("index.jsp").forward(request, response);
       //response.sendRedirect("index.jsp");
    }
}


%>
