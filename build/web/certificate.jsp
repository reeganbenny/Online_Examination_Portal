<%@page import="java.sql.*"%>
<%@page import="javaFiles.User"%>
<%@page import="javaFiles.LogicResult"%>
<%@page import="javaFiles.Result"%>
<%@include file="connection.jsp" %>
     <%
String user;
int lid=0;
 response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
if (session.getAttribute("username") == null)
{
    response.sendRedirect("index.jsp");
}
else if(session.getAttribute("examStart")!=null)
        {
            response.sendRedirect("test.jsp");
        }
        
else
{
   user=(String)session.getAttribute("username");
    lid=(int)session.getAttribute("loginid"); 


%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>CERTIFICATE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/selector.css">
        <link rel="stylesheet" href="CFstylesheets/certificatecss.css">
        <style>
            .printdiv {
  width:100%;
 
  display:flex;
  flex-direction:column;
  align-items:center;
  justify-content:center;
}
        </style>
        
             <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
          <script>
             
    
    
    $(document).ready(function(){
   
        $("#theModal").on('hidden.bs.modal', function () {
             $(this).removeData('bs.modal');
           
    });
});
         
             
    
    
    $(document).ready(function(){
   
        $("#theModal").on('hidden.bs.modal', function () {
             $(this).removeData('bs.modal');
           
    });
});




function PrintElem()
{
    var elem='print';
    var mywindow = window.open('', 'PRINT', 'height=400,width=600');
    mywindow.document.write('<html><head>');
    mywindow.document.write('<title>' + document.title  + '</title>');
    mywindow.document.write('</head><body >');
    mywindow.document.write(document.getElementById(elem).innerHTML);
    mywindow.document.write('</body></html>');
    mywindow.document.close();
    mywindow.focus(); 
    mywindow.print();
    mywindow.close();
    return true;
}






            </script>
      
    </head>
    
    
    <body>
        <%
          
            String str="select * from studentdetails where loginid="+lid;    
            
            int id=0;
            int pin=0;
            long mob=0;
            String name="";
            String hname="";
            String dis="";
            String city="";
            String state="";
            String email="";
            String col="";
            String deg="";
         
            try
            {
            ResultSet rs=stmt.executeQuery(str);

            if(rs.next())
            {
                id=rs.getInt("id");
                name=rs.getString("name");
                hname=rs.getString("housename");
                dis=rs.getString("district");
                city=rs.getString("city");
                state=rs.getString("state");
                pin=rs.getInt("pin");
                mob=rs.getLong("mobile");
                email=rs.getString("email");
                col=rs.getString("college");
                deg=rs.getString("degree");
            
            }
            
            //
            }
            catch(Exception e)
            {
               out.println(str+"    "+e.getMessage());
            }

        
        
        
        %>
         <jsp:include page="userHeader.jsp"/>
   
        <div class="container" >    
            <div class="jumbotron" id="print">
              
                   
                <div align="center" class="col-md-12 col-xs-12 col-sm-12 col-lg-12 head" >
                           <h2>CERTIFICATE OF PARTICIPATION</h2>
                       </div>
                   
                  <div class="row">
                      
                   <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
                       
                        <div class="" style="border-bottom:1px solid black">
                          <ul class=" details">
                              <li><h2><span class="glyphicon glyphicon-user one" style="width:50px;"></span><%=name%></h2></li>
                          </ul>
                        </div>
                            <hr>
                          <div class="col-sm-12 col-md-6 col-lg-6">  
                          <ul class=" details">
                              <li>
                                  <table>
                                      <tr> <td><span class="glyphicon glyphicon-map-marker one" style="width:50px;"></span></td><td><%=hname%></td></tr>
                                      <tr> <td></td><td><%=city%></td></tr>
                                      <tr> <td></td><td><%=dis%></td></tr>
                                      <tr> <td></td><td><%=state%></td></tr>
                                      <tr> <td></td><td>pin:<%=pin%></td></tr>
                                  </table>
                              </li>
                            
                          </ul>
                          </div>
                          <div class="col-sm-12 col-md-6 col-lg-6">  
                             <ul class=" details">
                                 <li><p class="size"><span class="glyphicon glyphicon-earphone one" style="width:50px;"></span><%=mob%></p></li>
                                <li><p><span class="glyphicon glyphicon-envelope one" style="width:50px;"></span><%=email%></p></li>
                            <li>
                                  <table>
                                      <tr> <td><span class="glyphicon glyphicon-education one" style="width:50px;"></span></td><td><%=deg%></td></tr>
                                      <tr> <td></td><td><%=col%></td></tr>
                                  </table>
                            </li>
                          </ul>
                          </div>
                      </div>
                    </div>
                                  
                                  
                      <div class="row">
                      
                   <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
                       
                        <div class="" style="border-bottom:1px solid black">
                          <ul class=" details">
                              <h2 align="center">EXAM RESULTS!!</h2>
                          </ul>
                        </div>
                            <hr>
                          <div class="container row">
              
                       <%
                           int flag=0;

                            try
                             {


                              String str1="SELECT count(*) FROM result where status=1";
                              ResultSet rs=stmt.executeQuery(str1);
                              rs.next();
                              flag=rs.getInt(1);
                             }catch(Exception e)
                             {

                             }
                            if(flag>0)
                            {
                        %>      
             <table class="table table-hover" >
                 <tr>
                     <th class="">Sl.no</th>
                     <th class="">Subject name</th>
                     <th class="">Total Mark(Max:100)</th>
                     <th class="">Grade</th>
                 </tr>
            
            <%
            
   try
    {
     
       
     String str1="SELECT * FROM subject";
     ResultSet rs=stmt.executeQuery(str1);
     String nam;
     Result r=new Result();
     int total,time,mark,subid;
      int i=0;
     while(rs.next())
     {
         nam=rs.getString("sname");
         total=rs.getInt("stotal");
         time=rs.getInt("stime");
         mark=rs.getInt("smark");
         subid=rs.getInt("id");
         r=User.check(lid,subid);
     
 if(r.status==1)
 { i++;
  %>
        
          <tr>
                     <td class=""><%=i%></td>
                     <td class=""><%=nam%></td>
                     <td class=""><%=r.total%></td>
                     <td class=""><%=r.grade%></td>
                 </tr>
           
          
         
         
         
         
         
                <%   }
}
  }
   catch(Exception e)
   {
       out.println(e.getMessage());
   }

                %>
             
               </table>
                <% }else
{
%>
<span style="align-content: center">No Results yet!!!!</span>
<%
}



%>
            
        </div>
                        
                            
                            
                            
                            
                            
                            
                            
                            
                      </div>
                    </div>
                    
                 
<div class="row">
                      
                   <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
                       
                        <div class="" style="border-bottom:1px solid black">
                          <ul class=" details">
                              <h2 align="center">LOGICAL QUESTION RESULTS!!</h2>
                          </ul>
                        </div>
                            <hr>
                          <div class="container row">
              
                       <%
                           flag=0;

                            try
                             {


                              String str1="SELECT count(*) FROM logicalanswer where status='check'";
                              ResultSet rs=stmt.executeQuery(str1);
                              if(rs.next())
                              {
                              flag=rs.getInt(1);
                              }
                             }catch(Exception e)
                             {

                             }
                            if(flag>0)
                            {
                        %>      
             <table class="table table-hover" >
                 <tr>
                     <th class="">Sl.no</th>
                     <th class="">Logic Question</th>
                     <th class="">Total Mark(Max:50)</th>
                 </tr>
            
            <%
            
   try
    {
     
       
     String str1="SELECT * FROM logical";
     ResultSet rs=stmt.executeQuery(str1);
     String nam;
     LogicResult r=new LogicResult();
     int qid;
      int i=0;
     while(rs.next())
     {
         qid=rs.getInt("id");
         r=User.checkLogical(lid,qid);
     
 if(r.status.equals("check"))
 { i++;
  %>
        
          <tr>
                     <td class=""><%=i %></td>
                     <td class=""><a href="questionModal.jsp?qid=<%=qid%>" data-toggle="modal" data-target="#theModal">logical Question <%=i%></a></td>
                     <td class=""><%=r.mark %></td>
                 </tr>
           
      <div id="theModal" class="modal fade text-center">
                                                            <div class="modal-dialog">
                                                              <div class="modal-content">
                                                              </div>
                                                            </div>
                                                          </div> 
         
         
         
         
                <%   }
}
  }
   catch(Exception e)
   {
       out.println(e.getMessage());
   }

                %>
             
                
                
               </table>
                
                
       
        
                <% }else
{
%>
<span style="align-content: center">No Results yet!!!!</span>
<%
}

}
%>
            
        </div>
                        
                            
                            
                            
                            
                            
                            
                            
                            
                      </div>
                    </div>





             
                    
                    
                    
                    
                    
                </div>
<div class="printdiv">
<button onclick="PrintElem()" class="btn btn-primary">Print</button>
</div>
            </div>

    


                     
    </body>
</html>
