<%-- 
    Document   : markModal
    Created on : 9 Oct, 2017, 12:31:51 PM
    Author     : HP
--%>

<%-- 
    Document   : questionModal
    Created on : 8 Oct, 2017, 6:15:06 PM
    Author     : HP
--%>


     <%


 response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
if (session.getAttribute("adminname") == null)
{
    response.sendRedirect("index.jsp");
}     
    int qid=Integer.parseInt(request.getParameter("qid"));
    int lid=Integer.parseInt(request.getParameter("lid"));
    try
    {
   
        
   %>
           
   <script>
        $(document).ready(function(){
       $("form").submit(function () {

    var mark=document.getElementById("mark").value;
    var lid=document.getElementById("lid").value;
    var qid=document.getElementById("qid").value;
     if(mark==="")
    {
        alert('Field Required');
    }
    else if(isNaN(mark))
    {
        alert('Inavlid mark');
    }
    else if(mark%1!=0)
    {
        alert('Inavlid mark(May be You use Decimal value)');
    }
    else if(mark<0)
    {
        alert('Minimum mark is 0');
    }
    else if(mark>50)
    {
        alert('Maximum mark is 50');
    }
    else
    {
    //alert(mark+" "+lid+" "+qid);
        window.location.href="addMark.jsp?mark="+mark+"&lid="+lid+"&qid="+qid;
    }
    return false;
       }); 
    
    }); 
       </script>
   
   
   
<div class="modal-open">
		
     <div class="col-sm-12 modal-header">
         
         <p>Enter Mark</p>
     </div>
     <form id="login-form" >
         <div class=" col-xs-12 divider text-center " >
             
                 <input type="hidden" name="lid" id="lid" value="<%=lid%>">
                 <input type="hidden" name="qid" id="qid" value="<%=qid%>">
                 <div>
                 <input type="text" name="mark" id="mark" class="form-control" placeholder="Enter Mark" >
                 </div>
             
         </div>
       
   
          <div class="col-xs-12 modal-footer" style="align-content:center">
                  <button type="submit" class="btn btn-primary">Save</button>
             
        <a role="button" class="btn-lg btn-danger" data-dismiss="modal">close</a>
       
        
      </div>
        </form>
    
 </div>
      
      
      
      
      
      
            
                      <%
        
    }
    catch(Exception e)
    {
        
    }
    
%>