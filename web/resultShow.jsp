<%@page import="java.util.LinkedHashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.com.User" %>
<%@page import="java.com.Question" %>
<%@ page import="java.sql.*" %>
<%
int subid=Integer.parseInt(request.getParameter("subid"));
int id;
String user;
  response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
if (session.getAttribute("username") == null)
{
    response.sendRedirect("index.jsp");
}else if(session.getAttribute("examStart")!=null)
{
    response.sendRedirect("test.jsp");
}else
{
   user=(String)session.getAttribute("username");
    id=(int)session.getAttribute("loginid"); 

%>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/style.css">
         <link rel="stylesheet" href="CFstylesheets/exam.css">
         <style>
             hr.style1{
		border-top: 1px dotted #8c8b8b;
}
         </style>
             <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
        
</head>

<body>
    
    
<jsp:include page="userHeader.jsp"/>
     
    
     <div class="exam-container" align="center">
            <h1 class="well">WELCOME TO CF EXAMINATION PORTAL</h1>
	<div class="col-lg-12 well">
            <div class="row" id="name" >
        
   
        <%
            Connection con=null;
            try
            {
                
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","root");
    Statement stmt=con.createStatement();
      String str="select * from answers where lid="+id+" and subid="+subid+"";        
      String ans,block="";
      int qid;
      int slno=0;
      Question ques=new Question();
    ResultSet rs=stmt.executeQuery(str);
    while(rs.next())
    {
        qid=rs.getInt("question");
        ans=rs.getString("answer");
        slno++;
        ques=User.answer(qid);
       %>
       <div>
           <%
                if(ans.equals("undefined"))
        {
        %>
        <p align="left" style="color:red">
            NOT ATTENDED
        </p>
            <p align="left">
                 <b>Question no:-<%=slno%>.<%=ques.question%></b>
            </p>
            <%
                }else
                {
                %>
                 <p align="left">
                <b>Question no:-<%=slno%>.<%=ques.question%></b>
            </p>
                
             <%
                 }
                if(ans.equals(ques.Answer))
                {
                    if(ans.equals("A"))
                    {
                %>
            <p align="left">
            <span><b>A:</b><%=ques.Aoption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            <%
                }else
                {
                %>
              <p align="left">
              <span> <b>A:</b><%=ques.Aoption%></span>
            </p>
            <%
                }
                 if(ans.equals("B"))
                    {
                %>
            <p align="left">
                <span><b>B:</b><%=ques.Boption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            <%
                }else
                {
                %>
              <p align="left">
              <span> <b>B:</b><%=ques.Boption%></span>
            </p>
            <%
                }
               
                 if(ans.equals("C"))
                    {
                %>
            <p align="left">
                <span><b>C:</b><%=ques.Coption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            <%
                }else
                {
                %>
              <p align="left">
              <span> <b>C:</b><%=ques.Coption%> </span>
            </p>
            <%
                }
                
                 if(ans.equals("D"))
                    {
                %>
            <p align="left">
                <span><b>D:</b><%=ques.Doption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            <%
                }else
                {
                %>
              <p align="left">
              <span> <b>D:</b><%=ques.Doption%> </span>
            </p>
            
            <%
                }
            }else
            {
                 if(ans.equals("A"))
                    {
                %>
            <p align="left">
                <span><b>A:</b><%=ques.Aoption%></span>&nbsp;&nbsp;<span class="fa fa-times" style="color: red"></span>
            </p>
            <%
                }else if(ques.Answer.equals("A"))
                {
                %>
              <p align="left">
                <span><b>A:</b><%=ques.Aoption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            
            <%
                }else
                {
                %>
                    <p align="left">
                <span><b>A:</b><%=ques.Aoption%></span>
            </p>
            <%
                }
                if(ans.equals("B"))
                    {
                %>
            <p align="left">
                <span><b>B:</b><%=ques.Boption%></span>&nbsp;&nbsp;<span class="fa fa-times" style="color: red"></span>
            </p>
            <%
                }else if(ques.Answer.equals("B"))
                {
                %>
              <p align="left">
                <span><b>B:</b><%=ques.Boption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            
            <%
                }else
                {
                %>
                    <p align="left">
                <span><b>B:</b><%=ques.Boption%></span>
            </p>
            <%
                }
                if(ans.equals("C"))
                    {
                %>
            <p align="left">
                <span><b>C:</b><%=ques.Coption%></span>&nbsp;&nbsp;<span class="fa fa-times" style="color: red"></span>
            </p>
            <%
                }else if(ques.Answer.equals("C"))
                {
                %>
              <p align="left">
                <span><b>C:</b><%=ques.Coption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            
            <%
                }else
                {
                %>
                    <p align="left">
                <span><b>C:</b><%=ques.Coption%></span>
            </p>
            <%
                }
                if(ans.equals("D"))
                    {
                %>
            <p align="left">
                <span><b>D:</b><%=ques.Doption%></span>&nbsp;&nbsp;<span class="fa fa-times" style="color: red"></span>
            </p>
            <%
                }else if(ques.Answer.equals("D"))
                {
                %>
              <p align="left">
                <span><b>D:</b><%=ques.Doption%></span>&nbsp;&nbsp;<span class="fa fa-check" style="color: green"></span>
            </p>
            
            <%
                }else
                {
                %>
                    <p align="left">
                <span><b>D:</b><%=ques.Doption%></span>
            </p>
         
            <%
                }
            
            }
%>
   <hr class="style1">
       </div>
   <%
              }
        }
            catch(Exception e)
            {
                
            }
}
            %>
            
        
    
            </div>
        </div>
     </div>
</body>

</html>