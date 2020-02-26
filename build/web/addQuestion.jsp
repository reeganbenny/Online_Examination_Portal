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
        <title>Add Question</title>

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
        <script src="js/check.js"></script>
        <script>
            function check()
{    
    
    var subid=document.getElementById("sub");
    
    var question=document.getElementById("quest").value;
  
    var A=document.getElementById("optionA").value;
    var B=document.getElementById("optionB").value;
    var C=document.getElementById("optionC").value;
    var D=document.getElementById("optionD").value;
    var answer=document.getElementById("answer").value;
 
    if(question==="")
    {
          alert('Field Required');
            document.getElementById('quest').style.borderColor = "red";
            document.getElementById('quest').focus();
            return false;
    }
    if(A==="")
    {
          alert('Field Required');
            document.getElementById('optionA').style.borderColor = "red";
            document.getElementById('optionA').focus();
            return false;
    }
    if(B==="")
    {
          alert('Field Required');
            document.getElementById('optionB').style.borderColor = "red";
            document.getElementById('optionB').focus();
            return false;
    }
    if(C==="")
    {
          alert('Field Required');
            document.getElementById('optionC').style.borderColor = "red";
            document.getElementById('optionC').focus();
            return false;
    }
    if(D==="")
    {
          alert('Field Required');
            document.getElementById('optionD').style.borderColor = "red";
            document.getElementById('optionD').focus();
            return false;
    }
    if(answer==="")
    {
          alert('Field Required');
          document.getElementById('answer').style.borderColor = "red";
          document.getElementById('aswer').focus();
          return false;
    }
    if(A===B)
    {
        alert('A & B have same option');
        document.getElementById('optionA').style.borderColor = "red";
        document.getElementById('optionA').focus();
        document.getElementById('optionB').style.borderColor = "red";
        document.getElementById('optionB').focus();
        return false;
    }
    if(A===C)
    {
        alert('A & C hame Option');
        document.getElementById('optionA').style.borderColor = "red";
        document.getElementById('optionA').focus();
        document.getElementById('optionC').style.borderColor = "red";
        document.getElementById('optionC').focus();
        return false;
    }
    if(A===D)
    {
        alert('A & D have same option');
        document.getElementById('optionA').style.borderColor = "red";
        document.getElementById('optionA').focus();
        document.getElementById('optionD').style.borderColor = "red";
        document.getElementById('optionD').focus();
        return false;
    }
    if(B===C)
    {
        alert('B & C have same option');
        document.getElementById('optionB').style.borderColor = "red";
        document.getElementById('optionB').focus();
        document.getElementById('optionC').style.borderColor = "red";
        document.getElementById('optionC').focus();
        return false;
    }
    if(B===D)
    {
        alert('B & D have same option');
        document.getElementById('optionB').style.borderColor = "red";
        document.getElementById('optionB').focus();
        document.getElementById('optionD').style.borderColor = "red";
        document.getElementById('optionD').focus();
        return false;
    }
    if(C===D)
    {
        alert('C & D have same option');
        document.getElementById('optionC').style.borderColor = "red";
        document.getElementById('optionC').focus();
        document.getElementById('optionD').style.borderColor = "red";
        document.getElementById('optionD').focus();
        return false;   
    }
    return true;
    
}
        </script>
        
        
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
    </head>

    <body>
      

 <jsp:include page="adminHeader.jsp"/>
   
        

         <div class="container">    
            <div class="jumbotron">
              
        <div class="container" align="center">
            <h1 class="well">Add Question!!</h1>
	<div class="col-lg-12 well">
	<div class="row">
            <div class="container row">
         
                
      <%
        String status=request.getParameter("status");
        int subid=Integer.parseInt(request.getParameter("subid"));
        if(status!=null){
            if(status.equals("false")){%>
                 <div class="alert alert-danger">
                    <strong>Sorry!</strong>Some error occured!!
                </div>
            <%}
            else if(status.equals("true")){ %>
                <div class="alert alert-success">
                    <strong>Success!</strong>Question added Successfully!!
                </div>
            <%  }
        }

        %>
           
        <form action="addques.jsp" method="post" onsubmit="return check()" >
            <input type="hidden" value="<%=subid%>" name="id">
            
    <div class="form-group">
        <label for="quest"> Question</label>
        <textarea  name="question" rows="10" cols="100" id="quest" class="form-control" ></textarea>
    </div>
    <div class="form-group">
        <label for="optionA">Option A :</label>
        <textarea rows="2" cols="50" name="a" class="form-control" id="optionA" required></textarea>
    </div>
    
    <div class="form-group">
        <label for="optionB">Option B :</label>
        <textarea rows="2" cols="50" name="b" class="form-control" id="optionB" required></textarea>
    </div>
    
    <div class="form-group">
        <label for="optionC">Option C :</label>
        <textarea rows="2" cols="50" name="c" class="form-control" id="optionC" required></textarea>
    </div>
    
    <div class="form-group">
        <label for="optionD">Option D :</label>
        <textarea rows="2" cols="50" name="d" class="form-control" id="optionD" required></textarea>
    </div>
    <div class="form-group">
        <label for="answer">Answer : </label>
        <input type="radio" name="answer" id="answer" value='A' required> A &nbsp;
        <input type="radio" name="answer" id="answer" value='B'> B &nbsp;
        <input type="radio" name="answer" id="answer" value='C'> C &nbsp;
        <input type="radio" name="answer" id="answer" value='D'> D &nbsp;
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