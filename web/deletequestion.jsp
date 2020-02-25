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
    int subid=Integer.parseInt(request.getParameter("subid"));
    try
    {
         sql="update question set status=0 where id="+qid;
        int row=stmt.executeUpdate(sql);
        if(row>0)
        {
            status="true";
        }
        sql="select count(*) from question where subid="+subid+" and status=1";
        ResultSet rs=stmt.executeQuery(sql);
        rs.next();
        int count=rs.getInt(1);
        if(count<5)
        {
            sql="update subject set status=0 where id="+subid;
            row=stmt.executeUpdate(sql);
        }
        
            
    }
    catch(Exception e)
    {
        
    }
    finally
    {
  response.sendRedirect("showQuestion.jsp?subid="+subid+"&status="+status);

    }
    %>