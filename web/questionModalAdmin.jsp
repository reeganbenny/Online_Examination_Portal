<%-- 
    Document   : questionModal
    Created on : 8 Oct, 2017, 6:15:06 PM
    Author     : HP
--%>

<%@include file="connection.jsp" %>
     <%
String user;

 response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
if (session.getAttribute("adminname") == null)
{
    response.sendRedirect("index.jsp");
}     
    String sql="";
    int qid=Integer.parseInt(request.getParameter("qid"));
   
    
    try
    {
        sql="select question from logical where id="+qid;
        ResultSet rs=stmt.executeQuery(sql);
        
        rs.next();
        
   %>
            
 <div class="modal-open">
		
     <div class="col-sm-12 modal-header">
         
         <p>LOGIC QUESTION</p>
     </div>
         <div class=" col-xs-12 divider text-center " >
             <p><%=rs.getString("question")%></p>
         </div>
       
   
          <div class="col-xs-12 modal-footer" style="align-content:center">
        
        <a role="button" class="btn-lg btn-danger" data-dismiss="modal">close</a>
       
        
      </div>
        
    
 </div>
      
      
      
      
      
      
      
            
                      <%
        
    }
    catch(Exception e)
    {
        
    }
    
%>