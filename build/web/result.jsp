<%@page import="java.util.LinkedHashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javaFiles.User" %>
<%
    
     response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
String uname=(String)session.getAttribute("username");
if(session.getAttribute("examStart")!=null)
{
    response.sendRedirect("test.jsp");
}

else if(uname==null)
{
    response.sendRedirect("index.jsp");
}

String name=(String)session.getAttribute("subname");
int result;
if(name!=null)
{
    int sid=(int)session.getAttribute("subid");
int lid=(int)session.getAttribute("loginid");
LinkedHashMap<Integer, String> ansLink=(LinkedHashMap)session.getAttribute("Allanswers");

result=User.result(ansLink,sid,lid);

session.removeAttribute("Allanswers");
session.removeAttribute("subid");
session.removeAttribute("stime");
session.removeAttribute("stotal");
session.removeAttribute("subname");
session.removeAttribute("smark");


}
else
{
    result=0;
}
%>
<html>
<head>
      <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="refresh" content="5;url=examSelector.jsp" />
        <title>Result</title>

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
        
</head>

<body>
    
    

         <nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">CF EXAMINATION PORTAL</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling  -->
				<div class="collapse navbar-collapse " id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right ">
						<li><a href="examSelector.jsp">Home</a></li>
                                                <li><a href="#">About</a></li>
					
					</ul>
				</div>
			</div>
		</nav>
   
     
    
     <div class="exam-container" align="center">
            <h1 class="well">WELCOME TO CF EXAMINATION PORTAL</h1>
	<div class="col-lg-12 well">
            <div class="row" id="name" >
        
    <div id="section">
    <h2>Test Finished:Your Result is:<%=result%></h2>
    <ul>
      <li>Your result is saved.</li>
      <li>You can go through other Exam if need.</li>
      <li>you will be redirect to <b>home page</b> after 5 seconds</li>
      
    </ul>  
    
    <br/>
    <h2>Happy Coding!! :) :)</h2>
    </div>
            </div>
        </div>
     </div>
</body>

</html>