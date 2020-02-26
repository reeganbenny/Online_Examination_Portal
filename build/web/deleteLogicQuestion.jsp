<%-- 
    Document   : deletequestion
    Created on : 11 Oct, 2017, 4:31:40 PM
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
    String status="false";
    int qid=Integer.parseInt(request.getParameter("qid"));
  
    try
    {
        sql="update logical set status=0 where id="+qid;
        int row=stmt.executeUpdate(sql);
        if(row>0)
        {
            status="delete";
        }
      }
    catch(Exception e)
    {
        
    }
    finally
    {
  response.sendRedirect("LogicQuestionAdd.jsp?&status="+status);

    }
    %>