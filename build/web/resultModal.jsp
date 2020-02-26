<%-- 
    Document   : resultModal
    Created on : 11 Sep, 2017, 11:45:24 PM
    Author     : Reegan
--%>
<%@include file="connection.jsp" %>
<%
    response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
if (session.getAttribute("username") == null)
{
    response.sendRedirect("index.jsp");
}
    String sql="";
    int subid=Integer.parseInt(request.getParameter("subid"));
    int qtotal=Integer.parseInt(request.getParameter("stotal"));
    int maxmark=Integer.parseInt(request.getParameter("smark"));
    int id=(int)session.getAttribute("loginid");
    int mark;
    try
    {
        sql="select * from result where subid="+subid+" and lid="+id;
        ResultSet rs=stmt.executeQuery(sql);
        String grade="";
        while(rs.next())
        {
            grade=rs.getString("grade");
            mark=rs.getInt("total");
            %>
          
            
            
            
            
            
<div class="modal-open">
		
    
        <div class="col-sm-12">
            <%
            if(!grade.equals("Fail"))
            {
                %>
            <span id="con">
                Congragulations!!!!
            </span>
                    <%
            }else
            {
                %> 
                <span id="sorry">
                Bad Luck!!!
            </span>
                 <%
            }
                %>
             
                            <p style="font-family: cursive"><b>Your Grade:</b></p>
                             <b><span id="grade"><%=grade %></span></b>
                            
                           
                       
        </div>
        <div class="col-xs-12 divider text-center">
            
            <div class="col-xs-12 col-sm-4">
                    <h2><strong><%=qtotal %></strong></h2>                    
                    <p><small>Total Questions</small></p>
                    
                </div>
                    <div class="col-xs-12 col-sm-4">
                    <h2><strong><%=maxmark %></strong></h2>                    
                    <p><small>Max Mark</small></p>
                    
                </div>
                      <div class="col-xs-12 col-sm-4">
                    <h2><strong><%=mark %></strong></h2>                    
                    <p><small>Your Mark</small></p>
                    
                </div>
        </div>
                    <div class="col-xs-12 modal-footer" style="align-content:center">
        
        <a role="button" class="btn-lg btn-danger" data-dismiss="modal">close</a>
        <a role="button" href="resultShow.jsp?subid=<%=subid%>" class="btn-lg btn-info" >View Result</a>
        
      </div>
        
    
 </div>
              <%
        }
    }
    catch(Exception e)
    {
        
    }
    
%>