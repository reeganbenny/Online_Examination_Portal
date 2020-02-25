<%-- 
    Document   : examSelector
    Created on : 12 Aug, 2017, 12:51:04 AM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.com.User" %>
<%@page import="java.com.Result" %>
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


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/style.css">
        <link rel="stylesheet" href="CFstylesheets/selector.css">
        <link rel="stylesheet" href="CFstylesheets/resultModalcss.css">
        
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
        <title>Exam Option</title>
        
        
    </head>
    
    
    
    <body>
   
     <jsp:include page="userHeader.jsp"/>
    <!--Selector content-->
    
    <div class="sel-container" align="center">
            <h1 class="col-lg-12 col-md-12 col-sm-12 well">WELCOME TO CF EXAMINATION PORTAL</h1>
	<div class="col-lg-12 well">
	<div class="row">
            
            <%
                int status;
   try
    {
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","root");
     Statement stmt=con.createStatement();   
     String str="SELECT * FROM subject";
     ResultSet rs=stmt.executeQuery(str);
     String name;
     int st=0;
     int total,time,mark,subid;
     Result r=new Result();
     while(rs.next())
     {
         name=rs.getString("sname");
         total=rs.getInt("stotal");
         time=rs.getInt("stime");
         mark=rs.getInt("smark");
         subid=rs.getInt("id");
         st=rs.getInt("status");
         r=User.check(id,subid);
         if(st==1)
         {
        %>
           <div class="col-sm-4 hero-feature">
                            <div class="thumbnail animation">
				<div class="bounceIn" >
					<div class="align-center">
						<h4><%=name%></h4>					
						<!--<div class="icon">
							<img class="round" src="img/selector/java.jpg" />
						</div>-->
							<table>
                                                    <tr><td>Questions</td><td></td><td></td><td>:<%=total%> </td></tr>
                                                    <tr></tr>
                                                    <tr><td>Time     </td><td></td><td></td><td>:<%=time%> </td></tr>
                                                     <tr></tr>
                                                    <tr><td>Mark     </td><td></td><td></td><td>:<%=mark%></td></tr>
                                                     <tr></tr>
                                                </table>
                                                         <%
                                                            if(r.status==0)
                                                            {
                                                                
                                                          %>
						<div class="ficon">
							<a href="subjectSession.jsp?sname=<%=name%>&stotal=<%=total%>&stime=<%=time%>&smark=<%=mark%>&subid=<%=subid%>" class="btn btn-primary" role="button">START NOW!</a>
						</div>
                                                        <% 
                                                            }else
                                                            {
                                                        %>
                                                        <div class="ficon">
							<a href="resultModal.jsp?subid=<%=subid %>&stotal=<%=total %>&smark=<%=mark%>" data-toggle="modal" data-target="#theModal" class="btn btn-success" role="button">RESULT!</a>
                                                        </div>
                                                          <div id="theModal" class="modal fade text-center">
                                                            <div class="modal-dialog">
                                                              <div class="modal-content">
                                                              </div>
                                                            </div>
                                                          </div>
    
                                                        <% 
                                                            }
                                                        %>
					</div>
				</div>
                        </div>
                        </div>
                <%  } }
  }
   catch(Exception e)
   {
       System.out.println(e.getMessage());
   }
}
}
catch(Exception e)
{

}
                %>
             
            
            
        </div>
        </div>
    </div>
    
    
   
    
        
    </body>
</html>
