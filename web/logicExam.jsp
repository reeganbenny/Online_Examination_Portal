<%-- 
    Document   : logicExam
    Created on : 8 Oct, 2017, 9:10:30 PM
    Author     : HP
--%>


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
 

if(session.getAttribute("examStart")!=null)
{
    response.sendRedirect("test.jsp");
}
session.setAttribute("logicExam", "true");
int slno=Integer.parseInt(request.getParameter("slno"));
int qid=Integer.parseInt(request.getParameter("id"));
response.sendRedirect("logicQuestion.jsp?slno="+slno+"&id="+qid);
}
         }
catch(Exception e)
  {
        
  }
%>
    %>