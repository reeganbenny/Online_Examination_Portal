<%-- 
    Document   : addQuestion
    Created on : 17 Aug, 2017, 11:42:54 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javaFiles.User"%>
<%@page import="javaFiles.Result"%>
<%@page import="javaFiles.studentDetails"%>

<%
response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
if (session.getAttribute("adminname") == null)
{
    response.sendRedirect("index.jsp");
}
else
{
%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Tutorial</title>

        <!-- CSS -->
          <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/selector.css">
      
        
             <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/regvalidation.js"></script>
        <!--[if lt IE 10]>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons 
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
-->

<script>
    function checkTut()
    {
 
        var head=document.getElementById("heading").value;
        var exp=document.getElementById("explanation").value;
              // alert(head+" "+exp);
        if(head ==="")
        {
              alert('Field Required');
                document.getElementById('heading').style.borderColor = "red";
                document.getElementById('heading').focus();
                return false;
        }
        if(exp ==="")
        {
              alert('Field Required');
                document.getElementById('explantion').style.borderColor = "red";
                document.getElementById('explantion').focus();
                return false;
        }
        
        return true;
    }
    </script>
    
    </head>

    <body>
       

 <jsp:include page="adminHeader.jsp"/>
   
        

         <div class="container">    
            <div class="jumbotron">
              
        <div class="container" align="center">
            <h1 class="well">Add Tutorial!!</h1>
	<div class="col-lg-12 well">
	<div class="row">
            <div class="container row">
         
                
      <%
        int id=Integer.parseInt(request.getParameter("id"));
        String stat=request.getParameter("status");
        
        if(stat!=null){
            if(stat.equals("false")){
        %>
                 <div class="alert alert-danger">
                    <strong>Sorry!</strong>Some error occured!!
                </div>
            <%}
            else if(stat.equals("true")){ %>
                <div class="alert alert-success">
                    <strong>Success!</strong>Tutorial added Successfully!!
                </div>
            <%  }
}
%>

           
        <form action="addtutorialdb.jsp" name="tutorial" method="post" onsubmit="return checkTut()">
            <input type="hidden" name="id"  value="<%=id%>" >
           <div class="form-group">
               <label for="heading"> Topic Name: </label>
               <input type="text" name="heading" id="heading" class="form-control" value="" >
              
           </div> 
           <div class="form-group" >
               <label for="explanation">  Explanation:</label>
              <textarea name="explanation" id="explanation" class="form-control" cols="50" rows="10"></textarea>
           </div>
               
              <input type="submit" class="btn btn-success" value="ADD!!">
        </form> 
 </div>
        </div>
        </div>
            
        </div>
            </div>
         </div>
    </body>
</html>
  <%    
}
        %>