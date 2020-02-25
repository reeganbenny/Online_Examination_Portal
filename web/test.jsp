
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.com.User" %>
<%
    int s=0;
     response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
    String stat=(String)session.getAttribute("examStart");
    if (session.getAttribute("username") == null)
{
    response.sendRedirect("index.jsp");
}
   else if(session.getAttribute("examStart")==null)
    {
        response.sendRedirect("examSelector.jsp");
    }
    else
    {
        
    
    String uname;
     int total=0;
     int mark;
     int time;
     int id=0;
     String name;/*
    try
    {
        uname=(String)session.getAttribute("username");
        name=(String)session.getAttribute("subname");
        time=(int)session.getAttribute("stime");
        mark=(int)session.getAttribute("smark");
        total=(int)session.getAttribute("stotal");
        id=(int)session.getAttribute("subid");
        session.setAttribute("examStart", "true");
        if(uname==null||name==null)
        {
                response.sendRedirect("index.jsp");
        }
        
    }catch(Exception e)
    {
        out.println("error "+e.getMessage());
    }
    ArrayList lst=User.questionSet(total,id);
    LinkedHashMap<Integer, String> lst1 = new LinkedHashMap<Integer, String>();
    session.setAttribute("set",lst);
    session.setAttribute("Allanswers",lst1);*/
    
%>

   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Test</title>
         
          <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/style.css">
         <link rel="stylesheet" href="CFstylesheets/exam.css">
        
             <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
      
        <!-- Favicon and touch icons 
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
-->


 
 <script type="text/javascript">
             
   
    
    
    
    
   
    
    var questionid=0;
    var max_questions=5;
    var min=0;
    var sec=0;
    
    function startTimer()
    {
        if(localStorage.getItem("timer"))
        {
            var timer = localStorage.getItem("timer");
           // timer=parseInt(timer)*60;
            //alert(timer);
        }
        else
        {
            //var timer = <%=(int)session.getAttribute("stime")%>*60;
            var timer=1*60;
           // alert(timer);
            localStorage.setItem("timer", timer);
        }
       
        
        min=parseInt(timer/60);
    	sec=parseInt(timer%60);
       // alert(timer+" "+min+" "+sec);
        if(timer==0)
        {
            alert("Time has finished");
            
            var answer=$('input[name=answer]:checked').val();
            var s=$('input[name=answer]:checked').size();

                questionid++;
            localStorage.removeItem("timer");

            if(s===0)
            {
                window.location="getQuestion.jsp?id="+questionid+"&answer=undefined&req=timefinished";
            }
            else
            {
                 window.location="getQuestion.jsp?id="+questionid+"&answer="+answer+"&req=timefinished";
            }
                   

          
        }
    	else
        {
            document.getElementById("timer").innerHTML = "<b>Time Left: </b>"+min.toString()+":"+sec.toString();
            timer--;
             localStorage.setItem("timer", timer);
        }
    	setTimeout(function(){ startTimer(); }, 1000);
    }
    
    var request=new XMLHttpRequest();
         
                  
    
    
 

$('#test').ready(function()
{
    questionid++;
    var url="getQuestion.jsp?id="+questionid+"&req=first";
    
    try
    {
        request.onreadystatechange=function(){
        if(request.readyState===4){
        var val=request.responseText;
        document.getElementById('test').innerHTML=val;
        }
        };//end of function
        request.open("GET",url,true);
        request.send();
    }
    catch(e)
    {
        alert("Unable to connect to server");
    }
      if(questionid===max_questions)
    {
        $('#next').hide();
    }
    else
    {
        $('#next').show();
    }
        
    if(questionid!==max_questions)
    {
        $('#submit').hide();
    }
    else
    {
        $('#submit').show();
    }
});
   
       
function nextQuestion()
{
 
   var answer=$('input[name=answer]:checked').val();
   var s=$('input[name=answer]:checked').size();
  // alert(answer+" "+s);
   
    if(s===0)
    {
        answer="undefined";
    }
    questionid++;
        var url="getQuestion.jsp?id="+questionid+"&answer="+answer+"&req=next";
        
        //alert(url);
      try
        {
            request.onreadystatechange=function()
            {
                if(request.readyState===4)
                {
                    var val=request.responseText;
                    document.getElementById('test').innerHTML=val;
                }
            };
            request.open("GET",url,true);
            request.send();
        }
        catch(e)
        {
            alert("Unable to connect to server");
        }
         if(questionid===max_questions)
        {
            $('#next').hide();
        }
        else
        {
            $('#next').show();
        }
        if(questionid !== max_questions)
        {
            $('#submit').hide();
        }
         else
        {
            $('#submit').show();
        }
       if(questionid == 1)
        {
            $('#back').hide();
        }
        else
        {
            $('#back').show();
        }
    
}
  

function backQuestion()
 {
    
    var answer=$('input[name=answer]:checked').val();
     var s=$('input[name=answer]:checked').size();
     if(s===0)
     {
         answer="undefined";
     }
   
        questionid--;
    var url="getQuestion.jsp?id="+questionid+"&answer="+answer+"&req=back";
    
    try
    {
        request.onreadystatechange=function()
        {
            if(request.readyState===4)
            {
                var val=request.responseText;
                document.getElementById('test').innerHTML=val;
                
            }
        };
        request.open("GET",url,true);
        request.send();
    }
    catch(e)
    {
        alert("Unable to connect to server");
    }
    if(questionid===1)
    {
        $('#back').hide();
    }
    else
    {
        $('#back').show();
    }
    if(questionid===max_questions)
    {
        $('#next').hide();
    }
    else
    {
        $('#next').show();
    }
    if(questionid!==max_questions)
    {
        $('#submit').hide();
    }
    else
    {
        $('#submit').show();
    }
   
}
        
function submitQuestion()
{
    var answer=$('input[name=answer]:checked').val();
    var s=$('input[name=answer]:checked').size();
    if(s===0)
    {
           questionid++;
     localStorage.removeItem("timer");
       window.location="getQuestion.jsp?id="+questionid+"&answer=undefined&req=last";
    }
    else
    {
        questionid++;
     localStorage.removeItem("timer");
       window.location="getQuestion.jsp?id="+questionid+"&answer="+answer+"&req=last";
            
    }
}
             
</script>
    

    </head>
    <body onload="startTimer()">
         
    
    <!--Selector content-->

    <div class="exam-container" align="center">
            <h1 class="well">WELCOME TO CF EXAMINATION PORTAL</h1>
	<div class="col-lg-12 well">
            <div class="row" id="name" >
     

       
        
    <div id="section">
        <p id="timer"></p>
        <p id="test"></p>
        <br/>
        <a role="button" id="back" class="btn btn-primary" hidden="hidden" onclick="backQuestion()">Back</a>&nbsp;
        <a role="button" id="next" class="btn btn-primary" onclick="nextQuestion()" >Next</a>&nbsp;
        <a role="button" id="submit" class="btn btn-success" hidden="hidden" onclick="submitQuestion()">Submit</a>
    </div>
            
            </div>
        </div>
    </div>
    </body>
</html>

<% 

    }


%>