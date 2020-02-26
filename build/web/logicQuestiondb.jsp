<%-- 
    Document   : logicQuestiondb
    Created on : 18 Sep, 2017, 3:13:04 PM
    Author     : HP
--%>

<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.Part" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
    InputStream answer=null;
    int r=0;
    String query="";
    try
    {
        
        int qid=Integer.parseInt(request.getParameter("qid"));
        int lid=Integer.parseInt(request.getParameter("lid"));
        //Part filepart=request.getPart("logicanswer");
        String filepath=request.getParameter("logicanswer");
        //
            out.println("Haii  "+filepath);
            File fis=null;
        PreparedStatement pstmt=null;
        if(filepath!=null)
        {
            out.println("filepart  \n\n");
         //   answer=filepart.getInputStream();
        }
        
        pstmt=con.prepareStatement("insert into logicalaswers(logicid,loginid,answer) values(?,?,?)");
        pstmt.setInt(1,qid);
         pstmt.setInt(2,lid);
          pstmt.setBinaryStream(3,answer);
         out.println("Haii  "+query);
        r=stmt.executeUpdate(query);
       
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
   /*  if(r>0)
        {
            response.sendRedirect("logic.jsp?status='true'");
        }
        else
     {
         response.sendRedirect("logic.jsp?status='false'&message="+inputstream);
     }
*/

    %>