<%-- 
    Document   : exam
    Created on : 16 Aug, 2017, 12:01:43 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
String uname=(String)session.getAttribute("username");
if(uname==null)
{
	response.sendRedirect("index.jsp");
}


//String stat=(String)session.getAttribute("examStart");
if(session.getAttribute("examStart")!=null)
{
    response.sendRedirect("test.jsp");
}
else
{
  
int time=Integer.parseInt(request.getParameter("stime"));
int mark=Integer.parseInt(request.getParameter("smark"));
String name=request.getParameter("sname");
int total=Integer.parseInt(request.getParameter("stotal"));
int id=Integer.parseInt(request.getParameter("subid"));

%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>exam notification</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/style.css">
         <link rel="stylesheet" href="CFstylesheets/exam.css">
        
             <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
        
        <!-- Favicon and touch icons 
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
-->
  
    </head>
    <body>
       <jsp:include page="userHeader.jsp"/>
    
    <!--Selector content-->
       
    <div class="exam-container" align="center">
            <h1 class="well">WELCOME TO CF EXAMINATION PORTAL</h1>
	<div class="col-lg-12 well">
            <div class="row" id="name">
      
    <h2>Instructions:</h2>
    <ul>
	  <li align="left">Total Questions: <%=total%></li>
	  <li align="left">Time Alloted: <%=time%> Minutes</li>
	  <li align="left">Questions based on <%=name%></li>
	  <li align="left">There is no negative marking</li>
          <li align="left">Please <b>do not Refresh</b> your test page</li>
	  <li align="left">Top 20 will be short listed for the next round</li>
	  <li align="left">Click on <b>Start</b> button to start the test</li>
	  <li align="left">After the test starts, don't press back or refresh button or don't close the browser window</li>
	</ul>  
    
    <br/>
  
    <button class="btn btn-default" role="button" onClick="parent.location='examStart.jsp'">Start</button>    
   
       
            
            
            </div>
        </div>
    </div>
    </body>
</html>
<%}
%>