<%-- 
    Document   : examSelector
    Created on : 12 Aug, 2017, 12:51:04 AM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@page import="javaFiles.User" %>

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
}else if(session.getAttribute("logicExam")==null)
{
    response.sendRedirect("logic.jsp");
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


int slno=Integer.parseInt(request.getParameter("slno"));
int qid=Integer.parseInt(request.getParameter("id"));
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
             $(window).load(function(){        
   $('#myModal').modal('show');
    }); 
            
              function Checkfiles()
    {
   
        var fup = document.getElementById('logicanswer');
        var fileName = fup.value;
        var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

    if(ext =="TXT" || ext=="txt")
    {
        return true;
    }
    else
    {
        alert("Upload text files only");
        return false;
    }
    }
    
    
    form.onsubmit = function () { return Checkfiles(); };

        
            
            
        </script>
        <title>Logic Question</title>
        
        
    </head>
    
    
    
    <body>
    <jsp:include page="userHeader.jsp"/>
    
    <!--Selector content-->
    <div class="container">
    <div class="jumbotron">
    <div class="container" align="center">
            <h1 class="well">LOGICAL QUESTION <%=slno%></h1>
	<div class="col-lg-12 well">
            
	<div class="row" >
     
            
            
           
            
                 
            <%
               try
               {
                   String query="select question from logical where id="+qid;
                   ResultSet rs=stmt.executeQuery(query);
                   
                   
                   while(rs.next())
                           {
                              
                               %>
                               <p align="left"><b>Question no.<%=slno%>:</b> <%=rs.getString("question")%></p>
                               <div class="form-group">
                                   <form method="post" action="uploadServlet" onsubmit="return Checkfiles()" enctype="multipart/form-data">
                                   <input type="hidden" name="qid" value="<%=qid%>" >
                                   <input type="hidden" name="lid" value="<%=id%>">
                                    <input type="file" id="logicanswer" name="logicanswer"><br>
                                   <button type="submit" class="btn btn-group-lg btn-success" >Submit</button> 
                               </form>
                               </div>
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
             
              
            
            
            
            
        
        </div>
        </div>
    </div>
    
    
   
    
    </div>   
    </div>
              
 <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" align="center">INSTRUCTIONS</h4>
      </div>
      <div class="modal-body">
        <p>1.You must Save your Answer in a .txt file.</p>
        <p>2.Size of the file must not exceed 10MB .</p>
        <p>3.Score will be display on certificate after the answer review by the admin</p>
        <p>$.If you have any problem in uploading file please contact admin.</p>
      </div>
      <div class="modal-footer" >
        <button type="button" class="btn btn-success"  data-dismiss="modal">OK</button>
      </div>
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