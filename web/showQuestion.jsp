<%-- 
    Document   : adminHome
    Created on : 17 Aug, 2017, 9:59:55 PM
    Author     : Reegan
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javaFiles.User"%>
<%@page import="javaFiles.Result"%>
<%@page import="javaFiles.studentDetails"%>
<%@include file="connection.jsp" %>
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
        <title>Logic Question</title>

        <!-- CSS -->
          <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap-theme.css">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap-theme.min.css">
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
<style>


#filter::-webkit-input-placeholder { 
font-family: FontAwesome;
font-weight: normal;
overflow: visible;
vertical-align: top;
display: inline-block !important;
padding-left: 5px;
padding-top: 2px;
color: #A9A9A9;
}


.dropdown-menu 
{
    background-color: #34495e;    
    box-shadow: none;
    overflow: hidden;
    
    -webkit-box-shadow: none;
    width: auto;
    margin-left: -125px;
    left: 50%;
    }
.dropdown-menu .divider 
{
    background:none;    
    }
.dropdown-menu>li>a
{
    color:#f5f5f5;
    }

       

    </style>
    <script>
    $(document).ready(function(){
   
        $("#theModal").on('hidden.bs.modal', function () {
             $(this).removeData('bs.modal');
           
    });
});

</script>
    </head>

    <body>
      

 <jsp:include page="adminHeader.jsp"/>
   
        

         <div class="container">    
            <div class="jumbotron">
              
        <div class="container" align="center">
            <h1 class="well">Question Details!!</h1>
	<div class="col-lg-12 well">
	<div class="row">
            <div class="container row">
                                
      <%
          int slno=0;
        String stat=request.getParameter("status");
        
        if(stat!=null){
            if(stat.equals("false")){%>
                 <div class="alert alert-danger">
                    <strong>Sorry!</strong>Some error occured!!
                </div>
            <%}
            else if(stat.equals("true")){ %>
                <div class="alert alert-success">
                    <strong>Success!</strong>Question Delete Successfully!!
                </div>
            <%  }else if(stat.equals("add"))
                {
            %>
                <div class="alert alert-success">
                    <strong>Success!</strong>Subject added Successfully!!
                </div>
            <%
                }
}
        

        %>
               <!-- <div class="form-group">
                  
                    <input type="text" placeholder="&#61442 Filter Details by Subject name" onkeyup="filter()"  class="form-control" id="filter" name="filter">
              
                </div>-->
                <div style="overflow: auto">  
            <table class="table table-hover" id="logicShow">
                <thead>
                 <tr>
                     <th class="">Sl.no</th>
                     <th class="">Question</th>
                     <th class="">Delete</th>
                 </tr>
                </thead>
                <tbody id="search">
                
            <%
                  int subid=Integer.parseInt(request.getParameter("subid"));
               
                try
                { 
                    int cquestion,ctutorial,stotal;
                    String str="select id,question from question where subid="+subid+" and status=1"; 
                    int id;
                    String question;
                    String sname="";
                    ResultSet rs=stmt.executeQuery(str);
                    while(rs.next())
                    {
                        slno++;
                        id=rs.getInt("id");
                        question=rs.getString("question");
                        
                         %>
        
          <tr>
                     <td class=""><%=slno%></td>
                     <td class=""><a href="quesModalAdmin.jsp?qid=<%=id%>" data-toggle="modal" data-target="#theModal">Question no.<%=slno%></a></td>
                     <td class=""><a role="button" href="deletequestion.jsp?qid=<%=id%>&subid=<%=subid%>" class="btn btn-danger">Delete</a>
                    
                   
                   
                     
                 </tr>
                  <div id="theModal" class="modal fade text-center">
                                                            <div class="modal-dialog">
                                                              <div class="modal-content">
                                                              </div>
                                                            </div>
                                                          </div>
           
                <%
                        
                    }
                }
                catch(Exception e)
                {
                    
                }
%>

            </tbody>
            </table>
                </div>
            
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