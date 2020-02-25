<%-- 
    Document   : adminloginCheck
    Created on : 6 Sep, 2017, 9:42:29 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
  

int id=0;

 


String uname=request.getParameter("form-username");
String upass=request.getParameter("form-password");

String str="select id from adminlogin where uname='"+uname+"' and upass='"+upass+"'";    
Connection con=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","root");
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
        session.setAttribute("adminid" , id);
        session.setAttribute("adminname", uname);
        session.removeAttribute("errMessage");
        response.sendRedirect("adminHome.jsp");
    }
 
    else
    {
        request.setAttribute("errMessage", "Invalid username or password");
       request.getRequestDispatcher("index.jsp").forward(request, response);
      // response.sendRedirect("index.jsp");
    }
}


%>
