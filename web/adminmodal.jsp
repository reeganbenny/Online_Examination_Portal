<%-- 
    Document   : adminHome
    Created on : 17 Aug, 2017, 9:59:55 PM
    Author     : Reegan
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.com.User"%>
<%@page import="java.com.Result"%>
<%@page import="java.com.studentDetails"%>
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
        <title>Registration</title>

        <!-- CSS -->
          <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/selector.css">
      
        
             <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.js"></script>

       
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


    </style>
    <script>
      
    
    function filter()
    {
        var email=document.getElementById("filter");
           var url="getDetails.jsp?email="+email.value;
        if(email !== "")
        {
        var obj=new XMLHttpRequest();
        var val="haii";
        try
        {
            obj.onreadystatechange=function()
            {
                if(obj.readyState===4)
                {
                     
                    val1=this.responseText;
                    
                    document.getElementById("search").innerHTML=val1;
                    
                }
            };//end of function
            
            obj.open("GET",url,true);
            obj.send();
        
        }
        catch(e)
        {
            alert("Unable to connect to server");
        }
    }
    }
       
  $(document).ready(function(){
   
        $("#theModal").on('hidden.bs.modal', function () {
             $(this).removeData('bs.modal');
           
    });
});

    
    
    </script>
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
					<a class="navbar-brand" href="#">CF EXAMINATION PORTAL</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling  -->
				<div class="collapse navbar-collapse " id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right ">
						<li><a href="adminHome.jsp">Home</a></li>
						<li>
                                                    <a href="examDetails.jsp" >Exam Details
                                                     </a>
                                                    
                                                </li>
                                                <li><a href="adminlogout.jsp">Logout</a></li>
		
					</ul>
				</div>
			</div>
		</nav>
   
        

         <div class="container">    
            <div class="jumbotron">
              
        <div class="container" align="center">
            <h1 class="well">Student Details!!</h1>
	<div class="col-lg-12 well">
	<div class="row">
            <div class="container row">
                <div class="form-group">
                  
                    <input type="text" placeholder="&#61442 Filter Details by Email" onkeyup="filter()"  class="form-control" id="filter" name="filter">
              
                </div>
                <div style="overflow: auto">  
            <table class="table table-hover" >
                <thead>
                 <tr>
                     <th class="">Sl.no</th>
                     <th class="">Name</th>
                     <th class="">Email</th>
                     <th class="">Exams Attended</th>
                     <th class="">Exams not Attended</th>
                     <th class="">View more</th>
                 </tr>
                </thead>
                <tbody id="search">
                
            <%
                String str="select id,loginid,name,email from studentdetails ";    
               
                try
                { 
                    int slno=0,id,lid;
                    String name="";
                    String email="";
                    ResultSet rs=stmt.executeQuery(str);
                    ArrayList<String> exam=new ArrayList<String>();
                    ArrayList<String> notexam=new ArrayList<String>();
                    while(rs.next())
                    {
                        slno++;
                        id=rs.getInt("id");
                        lid=rs.getInt("loginid");
                        name=rs.getString("name");
                        email=rs.getString("email");
                        exam=User.getExam(1,lid);
                        notexam=User.getExam(0,lid);
                         %>
        
          <tr>
                     <td class=""><%=slno%></td>
                     <td class=""><%=name%></td>
                     <td class=""><%=email %></td>
                     <td class="">
                         <%
                             for(String st:exam)
                             {
                             %>
                             
                             <%=st%><br>
                             
                             <%
                                 }
                                 %>
                     </td>
                     <td class="">
                          <%
                             for(String st:notexam)
                             {
                             %>
                             
                             <%=st%><br>
                             
                             <%
                                 }
                                 %>
                     
                     </td>
                     <td ><a  href="mdalView.jsp?lid=<%=lid %>" data-toggle="modal" data-target="#theModal" data-refresh="true" ><span class="fa fa-2x fa-eye" ></span></a></td>
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