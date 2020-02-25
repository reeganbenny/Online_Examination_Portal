<%-- 
    Document   : getDetails
    Created on : 12 Sep, 2017, 3:51:21 AM
    Author     : Reegan
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.com.User"%>
<%@page import="java.com.Result"%>

<%@include file="connection.jsp" %>
 <%
     String em=request.getParameter("email");
   
                String str="select id,loginid,name,email from studentdetails where email like '"+em+"%'";    
               String result="";
               int flag=0;
                try
                { 
                    int slno=0,id,lid;
                    String name="";
                    String email="";
                    ResultSet rs=stmt.executeQuery(str);
                    ArrayList<String> exam=new ArrayList<String>();
                    ArrayList<String> notexam=new ArrayList<String>();
                     ArrayList<Integer> logic=new ArrayList<Integer>();
                    int count=0;
                    while(rs.next())
                    {
                        flag=1;
                        slno++;
                        id=rs.getInt("id");
                        lid=rs.getInt("loginid");
                        name=rs.getString("name");
                        email=rs.getString("email");
                        exam=User.getExam(1,lid);
                        notexam=User.getExam(0,lid);
                        logic=User.getLogic(lid);
                        count=logic.size();
                        
                         
          result=result+"<tr><td>"+slno+"</td><td>"+name+"</td><td>"+email+"</td><td>";
                  
                      for(String st:exam){
                             
                             
                             result=result+st+"<br>";
                       }
                                 
                    result=result+"</td><td>";
                             for(String st:notexam)
                           {result=result+st+"<br>";
                       }
                            result=result+" </td><td>"+count+"</td><td><a href="+"details.jsp?lid="+lid+"  ><span class=\"fa fa-2x fa-eye\" ></span></a></td></tr>";
           
           }
                    
                   rs.close();
                }
                catch(Exception e)
                {
                    out.print("Unable to connect the Server");
                }
                finally
                {
                    con.close();
                    stmt.close();
                    
                }
                
                        if(flag!=0)
                        {
                             out.print(result);
                        }else
                        {
                            out.print("Sorry!!! No student with email="+em);
                        }


            %>