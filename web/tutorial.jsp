<%-- 
    Document   : examSelector
    Created on : 12 Aug, 2017, 12:51:04 AM
    Author     : Reegan
--%>

<%@page import="java.util.Map"%>
<%@page import="org.apache.catalina.tribes.group.interceptors.TwoPhaseCommitInterceptor.MapEntry"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.com.User" %>
<%@page import="java.com.Result" %>

<%@include file="connection.jsp" %>

<%
     response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
       if(session.getAttribute("examStart")!=null)
{
    response.sendRedirect("test.jsp");
}
if (session.getAttribute("username") != null)
{
    response.sendRedirect("examSelector.jsp");
}else if(session.getAttribute("adminname")!=null)
        {
            response.sendRedirect("adminHome.jsp");
        }


    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/style.css">
        <link rel="stylesheet" href="CFstylesheets/selector.css">
        
             <!-- Javascript -->
       <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
       
        <script src="js/tutorialjs.js"></script>
        
        <title>Tutorial</title>
        
        <style>
       /* body	*/
	html, body {
		margin: 0;
		padding: 0;
		height: 100%;
		font-family: "Open Sans", Helvetica, sans-serif;
		
	}
	/* body	*/


#responsive-admin-menu {
	float: left;
	width: 200px;
	background-color: #404040;
	height: 100%;
	position: relative;
	overflow: hidden;
	left: 0px;
	min-height: 500px;

}

#content-wrapper {
	width: auto;
	margin-left: 200px;
	background-color: #ffffff;
	height: 1200px;
	padding: 15px;
}

#responsive-admin-menu #responsive-menu {
	height: 50px;
	display: none;
	line-height: 50px;
	cursor: pointer;
	color: #ffffff;
	text-indent: 10px;
}


#responsive-admin-menu #responsive-menu .menuicon {
	color: #ffffff;
	font-size: 24px;
	position: absolute;
	right: 10px;
	top: 0px;
}
#responsive-admin-menu #logo {
	background-position: -0px -36px;
	width: 174px;
	height: 40px;
	margin: 10px;
  background: url('https://assets.codepen.io/assets/footer/codepen-logo-midgray.svg') no-repeat;
  -webkit-background-size: 146.66667px 25.83333px;
  background-size: 146.66667px 25.83333px;
}

/* Menu Styles */
#responsive-admin-menu #menu {
	width: 100%;
}
#responsive-admin-menu #menu a {
	border-bottom: 1px dotted #52535a;
	font-size: 14px;
	text-decoration: none;
	display: block;
	padding: 12px;
	color: #FFFFFF;
	position: relative;
	font-weight: 400;
	overflow: hidden;
}
#responsive-admin-menu #menu a:hover {
	color: #52535a;
	background-color:#fcfcfc;
}
#responsive-admin-menu #menu i {
	width: 16px;
	padding-right: 4px;
}
#responsive-admin-menu #menu div {
	display: none;
	width: 100%;
	background-color: #5c5d64;
	overflow: hidden;
}
#responsive-admin-menu #menu div a {
	color: #c0c0c0;
}
#responsive-admin-menu #menu div a:hover {
	color: #888888;
}
#responsive-admin-menu #menu a.submenu:before {
	font-family: FontAwesome;
	content: "\f054";
}
#responsive-admin-menu #menu a.downarrow:before {
	font-family: FontAwesome;
	content: "\f078";
}
#responsive-admin-menu #menu a.submenu:before {
	font-size: 14px;
	position: absolute;
	right: 15px;
	top: 17px;
}
/* Menu Styles */

@media screen and (max-width: 960px) {
	#responsive-admin-menu #responsive-menu {
		display: none;
	}
	#responsive-admin-menu #menu a span {
		display: inline-block;
	}
}

@media screen and (max-width: 480px) {
	#responsive-admin-menu {
		min-height: 50px;
		float: left;
		width: 100%;
		background-color: #404040;
		height: auto;
		position: static;
		top: 0;
	}
	#responsive-admin-menu #logo {
		display: none;
	}
	#responsive-admin-menu #menu a span {
		display: inline-block;
	}
	#content-wrapper {
		margin-left: 0;
		padding-top: 60px;
	}
	#responsive-admin-menu #responsive-menu {
		display: block;
	}
	#responsive-admin-menu #menu {
		display: none;
	}
	#responsive-admin-menu #menu a {
		color: #FFFFFF;
	}
	#responsive-admin-menu #menu a.submenu:before {
		font-size: 14px;
		right: 15px;
	}
}

.navbar-toggle .icon-bar {
  display: block;
  width: 22px;
  height: 2px;
  background-color: #cccccc;
  border-radius: 1px;
}

.menu a {
    display: block;
    text-align: center;
    padding: 16px;
    transition: all 0.3s ease;
    color: white;
    font-size: 36px;
}

#first {
    width: 100%; /*can be in percentage also.*/
    height: auto;
    margin: 0 auto;
    position: relative;
}

.active {
    background-color: #4CAF50 !important;
}


div #exp1{
        border:1px #e8e8e8 solid;
        margin:0px 0px 10px 0px;
        }
div #exp2{
        border-bottom:1px #e8e8e8 solid;
        background-color:#f3f3f3;
        padding:8px;
        font-size:40px;
        font-weight:700;
        color:#45484d;
        }
div #exp3
        {
        padding:8px;
        font-size:20px;
        }
        </style>
        
        <script>
           
            function getExplanation(id,subname,subid)
            {
               
                
        
        var url="getExplanation.jsp?id="+id+"&sub="+subname+"&subid="+subid;
        
        var obj=new XMLHttpRequest();
        var val="haii";
        try
        {
            obj.onreadystatechange=function()
            {
                if(obj.readyState===4)
                {
                     
                    val1=this.responseText;
                    
                    document.getElementById("content-wrapper").innerHTML=val1;
                    
                }
            };//end of function
            
            obj.open("GET",url,true);
            obj.send();
        }
        catch(e)
        {
            alert("Unable to connect to server");
        }
            }
       
            
            
            </script>
        
        
        
        
        
    </head>
    
    
    
    <body>
   
       
   
    <!--Selector content-->
    
    <div id="responsive-admin-menu">
	<div id="responsive-menu">
            <div class="menuicon">
              
                <div class="navbar-toggle" >		
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
						
                                </div>
                
            </div>
	</div>
	
	

	<!--Menu-->
	<div id="menu">
                        
			<a class="active" id="home" title="Home Page" href="index.jsp"><i class="fa fa-home fa-3x" ></i></a>
                        <label for="languages">Select Topic</label>
                        
                        <%
                            HashMap<Integer,String> hm=new HashMap<Integer,String>();
                            int size,id;
                            String subname;
                            try
                            {
                               
                                String sql="select id,sname from subject";
                                ResultSet rs=stmt.executeQuery(sql);
                                while(rs.next())
                                {
                                    id=rs.getInt("id");
                                    subname=rs.getString("sname");
                                    hm=User.tutorial(id);
                                    size=hm.size();
                                    if(size>0)
                                    {
                                    %>
                                    <a href=""  title="<%=subname%>" class="submenu" name="sub<%=id%>">
                                        <span ><%=subname%></span>
                                    </a>
                                    <div id="sub<%=id%>" style="display: none;">
                                        <%
                                            for(Map.Entry<Integer,String> entry:hm.entrySet())
                                            {
                                                %>
                                                
                                                
                                                    <a  onclick="getExplanation(<%=entry.getKey()%>,'<%=entry.getValue()%>','<%=id%>')" title="<%=entry.getValue()%>">
                                                       
                                                        <span id="sub"><%=entry.getValue()%></span>
                                                    </a>
                                                
                                                <%
                                            }
                                            %>
                                            </div>
                                            <%
					}else
                                        {
                                        %>
                                        
                                            <a href=""  title="<%=subname%>"  name="<%=subname%>">
                                            <span><%=subname%></span>
                                            </a>
                                        
                                        <%
                                        }
                                    }

                                
                            }
                            catch(Exception e)
                            {
                                
                            }
                            
                            %>
	</div>
</div>

<div id="content-wrapper" style="padding-top:100px">

    <div id="first">
        <b>Please Select your topic!!</b>
    </div>

</div>
            
  </body>
</html>
