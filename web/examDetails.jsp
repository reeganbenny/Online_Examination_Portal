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
        <title>Exam Details</title>

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
      
    
    function filter()
    {
        var sub=document.getElementById("filter");
           var url="getExamDetails.jsp?sub="+sub.value;
        
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
       
    function addSubject(slno) {
        slno++;
    var table = document.getElementById("subShow");
    var row = table.insertRow(slno);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    document.getElementById("button").innerHTML="";
    cell1.innerHTML = slno;
    cell2.innerHTML = "<input type=\"text\" name=\"newsub\" placeholder=\"Enter Subject\" id=\"sub\" >";
    cell3.innerHTML = "You must Enter minimum <br> 5 question to Activate";
    cell4.innerHTML = "--";
    cell5.innerHTML = "In-Active";
    cell6.innerHTML ="<a  onclick=\"save()\"><span  class=\"fa fa-2x fa-floppy-o\" ></span> </a>";
}

function save()
{
    
    var name=document.getElementById("sub").value;
     if(name==="")
    {
          alert('Field Required');
            document.getElementById('sub').style.borderColor = "red";
            document.getElementById('sub').focus();
            
    }else
    {
    window.location="addsub.jsp?sub="+name;
    }
}
    
    </script>
    </head>

    <body>
      

 <jsp:include page="adminHeader.jsp"/>
   
        

         <div class="container">    
            <div class="jumbotron">
              
        <div class="container" align="center">
            <h1 class="well">Exam Details!!</h1>
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
                    <strong>Success!</strong>Question added Successfully!!
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
            <table class="table table-hover" id="subShow">
                <thead>
                 <tr>
                     <th class="">Sl.no</th>
                     <th class="">Subject</th>
                     <th class="">No. of questions</th>
                     <th class="">No. of tutorial</th>
                     <th class="">Status</th>
                     <th class="">Edit</th>
                 </tr>
                </thead>
                <tbody id="search">
                
            <%
                  
               
                try
                { 
                    int cquestion,ctutorial,stotal;
                    String str="select id,sname,stotal,status from subject "; 
                    int id,status;
                    String sname="";
                    ResultSet rs=stmt.executeQuery(str);
                    while(rs.next())
                    {
                        slno++;
                        id=rs.getInt("id");
                        status=rs.getInt("status");
                        sname=rs.getString("sname");
                        stotal=rs.getInt("stotal");
                        cquestion=User.getCount("question",id);
                        ctutorial=User.getCount("tutorial",id);
                         %>
        
          <tr>
                     <td class=""><%=slno%></td>
                     <td class=""><%=sname%></td>
                     <%
                         if(stotal<=cquestion)
                         {
                     %>
                     <td class="" style="color:green"><%=cquestion %></td>
                     <%
                         }else
                        {
                     %>
                     <td class="" style="color:red" title="Required min <%=stotal %> questions"><%=cquestion %></td>
                     <%
                         }
                      %>
                     <td class=""><%=ctutorial %></td>
                     <td class="">
                         <%
                             if(status==1)
                             {
                             %>
                             
                             Active
                             
                             <%
                                 }else
                                 {
                                 %>
                   
                             
                             In-Active
                             
                             <%
                                 }
                                 %>
                     
                     </td>
                     <td class="btn-group dropdown btn-block"> 
                         <a  class=" dropdown-toggle" data-toggle="dropdown">
                        <span class="fa fa-2x fa-pencil-square-o"></span>
                        
                      </a>
                      <ul class="dropdown-menu " role="menu">
                        <li><a href="showQuestion.jsp?subid=<%=id%>&status=first" >EDIT Question</a></li>
                         <li><a href="addQuestion.jsp?subid=<%=id%>" >ADD Question</a></li>
                        <li><a href="addTutorial.jsp?id=<%=id%>" >ADD Tutorial</a></li>
                        
                      </ul>
                     </td>
                 </tr>
           
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
            <div id="button">
                <a  role="button" onclick="addSubject(<%=slno %>)" class="btn btn-info">ADD Subject</a>
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