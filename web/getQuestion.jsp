<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%   
    Connection con=null;
    try
{
int id=Integer.parseInt(request.getParameter("id"));
String req=request.getParameter("req");
String answer=request.getParameter("answer");
String name=(String)session.getAttribute("subname");
int time=(int)session.getAttribute("stime");
int sid=(int)session.getAttribute("subid");
int mark=(int)session.getAttribute("smark");
ArrayList set=(ArrayList)session.getAttribute("set");
LinkedHashMap<Integer, String> ansLink=(LinkedHashMap)session.getAttribute("Allanswers");
int question,ans_id;
  int size=set.size();  


    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","root");
    Statement stmt=con.createStatement();
    if(req.equals("first"))
    {
        question=(int)set.get(id-1);
        String str="select * from question where subid="+sid+" and id="+question;
        
        ResultSet rs=stmt.executeQuery(str);
        while(rs.next())
        {
          //  out.println(set.get(0)+" "+set.get(1)+" "+set.get(2)+" "+set.get(3)+" "+set.get(4));
               if(ansLink.containsKey(question))
            {
               String an=ansLink.get(question);
               if(an.equals("A"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+" checked>"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("B"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+" checked>"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("C"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+" checked>"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("D"))
                     out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+" >"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+" >"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+" checked>"+rs.getString("Doption")+"</p>");
                  else if(an.equals("undefined"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>"); 
               
            }
            else
            {
               out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>"); 
            }
        }
    }
    else if(req.equals("next"))
    {
        ans_id=(int)set.get(id-2);
        question=(int)set.get(id-1);
        String str="select * from question where subid="+sid+" and id="+question;
        ansLink.put(ans_id,answer);
        session.setAttribute("Allanswers", ansLink);
	ResultSet rs=stmt.executeQuery(str);
        while(rs.next())
        {
            if(ansLink.containsKey(question))
            {
               String an=ansLink.get(question);
               if(an.equals("A"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+" checked>"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("B"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+" checked>"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("C"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+" checked>"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("D"))
                     out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+" >"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+" >"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+" checked>"+rs.getString("Doption")+"</p>");
                   else if(an.equals("undefined"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>"); 
              
            }
            else
            {
               out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>"); 
            }
        }
      
    }
    else if(req.equals("back"))
    {
        ans_id=(int)set.get(id);
        question=(int)set.get(id-1);
        ansLink.put(ans_id,answer);
        session.setAttribute("Allanswers", ansLink);
        String str="select * from question where subid="+sid+" and id="+question;
        ResultSet rs=stmt.executeQuery(str);
        while(rs.next())
        {
            if(ansLink.containsKey(question))
            {
               String an=ansLink.get(question);
               if(an.equals("A"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+" checked>"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("B"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+" checked>"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("C"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+" checked>"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>");
               else if(an.equals("D"))
                     out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+" >"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+" >"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+" checked>"+rs.getString("Doption")+"</p>");
               else if(an.equals("undefined"))
                   out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>"); 
            }else
            {
               out.print("<p align="+"right"+"><b>ques:"+id+"/"+size+"</b></p>"+"<p align="+"left"+"><b>Question no:-"+id+"."+rs.getString("question")+"</b></p><p align="+"left"+"><b>A:</b><input type="+"radio"+" name="+"answer"+" id="+"A"+" value="+"A"+">"+rs.getString("Aoption")+"</p><p align="+"left"+"><b>B:</b><input type="+"radio"+" name="+"answer"+" id="+"B"+" value="+"B"+">"+rs.getString("Boption")+"</p><p align="+"left"+"><b>C:</b><input type="+"radio"+" name="+"answer"+" id="+"C"+" value="+"C"+">"+rs.getString("Coption")+"</p><p align="+"left"+"><b>D:</b><input type="+"radio"+" name="+"answer"+" id="+"D"+" value="+"D"+">"+rs.getString("Doption")+"</p>"); 
            }
        }
        ansLink.put(ans_id,answer);
        session.setAttribute("Allanswers", ansLink);
	
    }
    else if(req.equals("last"))
    {
        ans_id=(int)set.get(id-2);
        ansLink.put(ans_id,answer);
        session.setAttribute("Allanswers", ansLink);
        session.removeAttribute("examStart");
        response.sendRedirect("result.jsp");
    }
    else if(req.equals("timefinished"))
    {
        int qid=id-2;
        ans_id=(int)set.get(qid);
        ansLink.put(ans_id,answer);
        int size1=ansLink.size()-1;
        out.println(answer);
        for(int k=size1;k<size;k++)
        {out.println(k);
            ans_id=(int)set.get(k);
            ansLink.put(ans_id,"undefined"); 
        }
        session.setAttribute("Allanswers", ansLink);
        session.removeAttribute("examStart");
        response.sendRedirect("result.jsp");
    }
    
}
catch(Exception e)
{
    out.print(e);
}
finally
{
    con.close();
}


%>