<%-- 
    Document   : examSelector
    Created on : 12 Aug, 2017, 12:51:04 AM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@page import="java.com.User" %>

     <%
         try
         {
String user;
int id=0;
 response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
if (session.getAttribute("username") == null)
{
    response.sendRedirect("index.jsp");
}
else
{
   user=(String)session.getAttribute("username");
    id=(int)session.getAttribute("loginid"); 

//String stat=(String)session.getAttribute("examStart");
if(session.getAttribute("examStart")!=null)
{
    response.sendRedirect("test.jsp");
}
int slno=0;

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <script>
             
    
    
    $(document).ready(function(){
   
        $("#theModal").on('hidden.bs.modal', function () {
             $(this).removeData('bs.modal');
           
    });
});
            </script>
             
        <title>Logic Questions</title>
        
        
    </head>
    
    
    
    <body>
    <jsp:include page="userHeader.jsp"/>
    
    <!--Selector content-->
    <div class="container">
    <div class="jumbotron">
    <div class="container" align="center">
            <h1 class="well">LOGICAL QUESTION</h1>
	<div class="col-lg-12 well">
	<div class="row" >
           <%
        
        String stat=request.getParameter("status");
        
        if(stat!=null){
            if(stat.equals("false")){%>
                 <div class="alert alert-danger">
                    <strong>Sorry!</strong>Some error occured..Please contact Admin!!
                </div>
            <%}
            else if(stat.equals("true")){ %>
                <div class="alert alert-success">
                    <strong>Success!</strong>Answer added Successfully!!
                </div>
            <%  }
}
        

        %>
            
            
            <div style="overflow: auto">  
            <table class="table table-hover" >
                <thead>
                 <tr>
                        <td>slno.</td>
                        <td>Select Question</td>
                        <td>Total Mark</td>
                        <td>Status</td>
                        <td>View More</td>
                    </tr>
                </thead>
                  <tbody  id="logic">
                 
            <%
               try
               {
                   String status="";
                   String query="select * from logical where status=1";
                   ResultSet rs=stmt.executeQuery(query);
                   
                   
                   while(rs.next())
                           {
                               int logicid=rs.getInt("id");
                               status=User.checkStatus(id,logicid);
                               slno++;
                               %>
                               
                               <tr>
                                    
                                   <td><%=slno %></td>
                                   <td><a href="questionModal.jsp?qid=<%=logicid%>" data-toggle="modal" data-target="#theModal" >Logical Question <%=slno%> </a></td>
                                   <td><%=rs.getInt("mark") %></td>
                                   <%
                                       if(status.equals("not submitted"))
                                       {
                                             %>
                                             <td>Not Submitted</td>
                                    <td><a  href="logicExam.jsp?slno=<%=slno%>&id=<%=logicid%>" role="button" class="btn btn-info" >View More</a></td>
                                   <%
                                       }else if(status.equals("uncheck"))
                                        {
                                       %>
                                       <td>Not Checked</td>
                                    <td><a  href="#" role="button" class="btn btn-primary" >View Result</a></td>
                                   <%
                                        }else
                                        {
                                               %>
                                               <td>Checked</td>
                                    <td><a  href="certificate.jsp" role="button" class="btn btn-success" >View Result</a></td>
                                   <%
                                        }
                                     %>
                                  
                                   
                               </tr>
                               
                               <%
                               
                           }
               }
               catch(Exception e)
               {
  
String str1=e.getMessage();
%>

<script>
    alert("Error "+<%=str1 %>)
</script>
        <%
                 
                   
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
              
          <div id="theModal" class="modal fade text-center">
                                                            <div class="modal-dialog">
                                                              <div class="modal-content">
                                                              </div>
                                                            </div>
                                                          </div> 
         
                  
                
                
                
                
    </body>
</html>
<%
    }
}
        catch(Exception e)
                {
                
                }
    
%>