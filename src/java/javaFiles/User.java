/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaFiles;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author Reegan
 */
public class User 
{
    
    public static Result check(int id,int subid)
    {
        Result r=new Result();
        int status=0;
        Connection con=null;
          
try{
 Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
     Statement stmt=con.createStatement();
     
String query="select * from result where lid ="+id+" and subid="+subid;
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
    
    r.grade=rs.getString("grade");
    r.id=rs.getInt("id");
    r.loginid=rs.getInt("lid");
    r.subid=rs.getInt("subid");
    r.total=rs.getInt("total");
    r.status=rs.getInt("status");
  
}
}
catch(Exception e)
{
    
    System.out.println("ERROR IN CHECK "+e.getMessage());
}
        return r;
    }
    
    
    
    public static String checkStatus(int lid,int logicid)
    {
        String str="not submitted";
        Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            Statement stmt=con.createStatement();
            String query="select status from logicalanswer where logicid ="+logicid+" and loginid="+lid;
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {
            str=rs.getString("status");
            }
        }
        catch(Exception e)
        {
            System.out.println("error in checkStatus="+e.getMessage());
        }
        return str;
    }
    
    
    
    
    public static ArrayList questionSet(int total,int sid)
    {
        ArrayList al = new ArrayList(); 
        
        Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            Statement stmt=con.createStatement();
            String query="select id from question where subid ="+sid;
            ResultSet rs=stmt.executeQuery(query); 
            int j;
            while(rs.next())
            {
                j=rs.getInt("id");
                al.add(j);
            }
            Collections.shuffle(al);
            if(al.size()>total)
            {
                al.subList(total, al.size()).clear();
            }
                    
            
        }
        catch(Exception e)
        {
            
            
        }
        
        return al;
    }
    
    
    
    
    public static LogicResult checkLogical(int lid,int qid)
    {
        LogicResult r=new LogicResult();
         Connection con=null;
        String query="";
         try
         {
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            Statement stmt=con.createStatement();
           query ="SELECT * from logicalanswer where logicid="+qid+" and loginid="+lid ; 
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {
                r.mark=rs.getInt("mark");
                r.status=rs.getString("status");
            }
         }
         catch(Exception e)
         {
              System.out.println("Error:"+e.getMessage()+" "+query);
         }
        
        return r;
        
        
        
        
        
    }
    
    public static ArrayList getLogic(int loginid)
    {
        ArrayList<Integer> logic=new ArrayList<Integer>();
        Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            Statement stmt=con.createStatement();
            String query="select logicid from logicalanswer where loginid="+loginid;
            ResultSet rs=stmt.executeQuery(query);
            int logicid;
            while(rs.next())
            {
                logicid=rs.getInt("logicid");
                logic.add(logicid);
            }
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e.getMessage());
        }
        return logic;
    }
    
    public static ArrayList getExam(int status,int lid)
    {
        ArrayList<String> lst=new ArrayList<String>();
        String sname="";
        String name="";
        Connection con=null;
         try
         {
         Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            Statement stmt=con.createStatement();
            String query="SELECT subject.sname FROM subject INNER JOIN result ON result.subid = subject.id where result.lid="+lid ; 
            ResultSet rs=stmt.executeQuery(query); 
            while(rs.next())
            {
                sname=rs.getString("sname");
                lst.add(sname);
            }
            if(status==0)
            {
                
                String query1="select sname from subject where status=1"  ; 
                ResultSet rs1=stmt.executeQuery(query1);
               
                while(rs1.next())
                { 
                    name=rs1.getString("sname");
                    
                    if(lst.contains(name))
                    {
                        
                        lst.remove(name);
                    }
                    else
                    {
                        
                        lst.add(name);
                    }
                }
                
            }
            
         }
         catch(Exception e)
         {
             System.out.println("Error in exam details"+e.getMessage());
         }
        
        
        
        
        
        
        return lst;
    }
    
    
    
    
    
    
    
    
    public static studentDetails getDetails(int id,int sid)
    {
        studentDetails stud=new studentDetails();
        Connection con=null;
         try
         {
         Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            Statement stmt=con.createStatement();
            String query="select * from studentdetails where loginid="+id; 
            ResultSet rs=stmt.executeQuery(query); 
           

            if(rs.next())
            {
                stud.id=rs.getInt("id");
                stud.name=rs.getString("name");
                stud.hname=rs.getString("housename");
                stud.dis=rs.getString("district");
                stud.city=rs.getString("city");
                stud.state=rs.getString("state");
                stud.pin=rs.getInt("pin");
                stud.mob=rs.getLong("mobile");
                stud.email=rs.getString("email");
                stud.col=rs.getString("college");
                stud.deg=rs.getString("degree");
            
            }
             String query1="select sname from subject where id="+sid; 
            ResultSet r=stmt.executeQuery(query1); 
            r.next();
            stud.subname=r.getString("sname");
           
            //
         }
            catch(Exception e)
            {
               System.out.println("    "+e.getMessage());
            }
         return stud;
    }
         
    public static int result(LinkedHashMap<Integer, String> ansLink,int sid,int lid)
    {
        int res=0,qno;
        Integer keycor,keycheck;
        String anscor,anscheck,ans;
        Connection con=null;
        LinkedHashMap<Integer,String> value=new LinkedHashMap<Integer,String>();
        System.out.println("Haiii");
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            Statement stmt=con.createStatement();
            String query="select id,answer from question where subid ="+sid;
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {
                qno=rs.getInt("id");
                ans=rs.getString("answer");
                value.put(qno, ans);
                
            }
            int n=ansLink.size();
            System.out.println("Size"+n);
            Iterator it = ansLink.entrySet().iterator();
            while(it.hasNext()) 
            {
                
                n++;
                Map.Entry pair = (Map.Entry)it.next();
                keycheck=(Integer)pair.getKey();
                anscheck=(String)pair.getValue();
                 System.out.println("Result = "+anscheck);
               String query2="insert into answers (lid,subid,question,answer) values("+lid+","+sid+","+keycheck+",'"+anscheck+"')";
                stmt.executeUpdate(query2);
                anscor=value.get(keycheck);
                if(anscor.equals(anscheck))
                {
                    res=res+20;
                    System.out.println(n+"answer to check11: "+anscheck);
                    System.out.println("answer correct11: "+anscor);
                    System.out.println("Result = "+res);
                    
                        
                    
                }
              
            }
            String grade=calcGrade(res);
            String query1="insert into result(lid,subid,total,grade)values("+lid+","+sid+","+res+",'"+grade+"')";
            stmt.executeUpdate(query1);
        }
        catch(Exception e)
        {
            
            System.out.println("error in result.java "+e.getMessage());
        }
        
        
        return res;
    }

    public static HashMap tutorial(int res) 
    {
        HashMap<Integer,String> hm=new HashMap<Integer,String>();
        Connection con=null;
        Statement stmt=null;
        try
        {
            String str=new String();
            int id;
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
            stmt=con.createStatement();  
            String query="select id,header from tutorial where sid="+res;
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {
                id=rs.getInt("id");
                str=rs.getString("header");
                System.out.println(id+" "+str);
                hm.put(id,str);
            }
        }
        catch(Exception e)
        {
                System.out.println("error");
        }
        return hm;
        
    }
    
    private static String calcGrade(int res) 
    {
        String grade;
        if(res>90)
            grade="A+";
        else if(res>80)
            grade="A";
        else if(res>70)
            grade="B+";
        else if(res>60)
            grade="B";
        else if(res>50)
            grade="C+";
        else
            grade="Fail";
        
        
        return grade;
        
    }
    
    
    public static Question answer(int qid)
    {
        String block="";
        Question ques=new Question();
          Connection con=null;
            try
            {
                
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
    Statement stmt=con.createStatement();
      String str="select * from question where id="+qid; 
      ResultSet rs=stmt.executeQuery(str);
      while(rs.next())
      {
          ques.question=rs.getString("question");
          ques.Aoption=rs.getString("Aoption");
          ques.Boption=rs.getString("Boption");
          ques.Coption=rs.getString("Coption");
          ques.Doption=rs.getString("Doption");
          ques.Answer=rs.getString("answer");
          //block="";
      }
            }
            catch(Exception e)
            {
                
            }
        
        return ques;
    }
    
    public static int getCount(String table,int id)
    {
        int count=0;
         Connection con=null;
            try
            {
                
                Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","");
                Statement stmt=con.createStatement();
                String str="select count(*) from "+table+" where subid="+id+" and status=1"; 
                ResultSet rs=stmt.executeQuery(str);
                rs.next();
                count=rs.getInt(1);
            }
            catch(Exception e)
            {
                System.out.println("Error :- "+e.getMessage());
            }
        
        return count;
    }
    
}
