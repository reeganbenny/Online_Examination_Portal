<%-- 
    Document   : regdatabase
    Created on : 6 Aug, 2017, 9:13:04 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<body>

<%
    try
    {
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
     Statement stmt=con.createStatement();
     String fn=request.getParameter("fname");
     String ln=request.getParameter("lname");
     String hn=request.getParameter("hname");
     String dis=request.getParameter("dist");
     String city=request.getParameter("city");
     String state=request.getParameter("state");
     String pin=request.getParameter("pin");
     String mob=request.getParameter("mob");
     String email=request.getParameter("emailid");
     String col=request.getParameter("col");
     String degree=request.getParameter("deg");
     String upass=request.getParameter("upass");
     fn=fn+" "+ln;
     String sql1;
     String sql2;
     String sql3;
     sql1="insert into login(usname,upassword) values('"+email+"','"+upass+"')";
     stmt.executeUpdate(sql1);
     sql2="select id from login where usname='"+email+"'";
     ResultSet rs=stmt.executeQuery(sql2);
     rs.next();
     int lid=rs.getInt("id");
     sql3="insert into studentdetails(loginid,name,housename,district,city,state,pin,mobile,email,college,degree) values("+lid+",'"+fn+"','"+hn+"','"+dis+"','"+city+"','"+state+"','"+pin+"','"+mob+"','"+email+"','"+col+"','"+degree+"')";
    
     stmt.executeUpdate(sql3);
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
    response.sendRedirect("index.jsp");
%>

</body>