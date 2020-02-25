<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registration</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/style.css">
        <link rel="stylesheet" href="CFstylesheets/regcss.css">
        
             <!-- Javascript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="CFbootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
       <script src="js/regvalidation.js"></script>
        <script type="text/javascript">
            
            
    function validate()
    {
        var email = document.getElementById("emailid").value;
        var url="validate.jsp?email="+email;
        var obj=new XMLHttpRequest();
        
        try
        {
            obj.onreadystatechange=function()
            {
                if(obj.readyState===4)
                {
                    val=this.responseText;
                    document.getElementById("pl").innerHTML=val
                    $('#emailval').val(val);
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
        
        <!--[if lt IE 10]>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons 
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
-->
    </head>

    <body>
           <% 
            response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
        //String status=(String)session.getAttribute("examStart");
        if(session.getAttribute("examStart")!=null)
        {
            response.sendRedirect("test.jsp");
        }
        else if(session.getAttribute("username")!=null)
        {
            response.sendRedirect("examSelector.jsp");
        } else if(session.getAttribute("adminname")!=null)
        {
            response.sendRedirect("adminHome.jsp");
        }
      
     /*  response.setHeader("Cache-control","no-cache");
       response.setHeader("Cache-control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
       */
            %>
        <script>
            
jQuery(document).ready(function() {

    $.backstretch("img/backgrounds/1.jpg");
});
   
            </script>
            
            

<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">CF EXAMINATION PORTAL</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling  -->
				<div class="collapse navbar-collapse " id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right ">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="Registration.jsp">Register</a></li>
                                               <li><a href="tutorial.jsp">Tutorial</a></li>
                                                <li><a href="#">About</a></li>
					
					</ul>
				</div>
			</div>
		</nav>
   
        

        
        <div class="reg-container" align="center">
            <h1 class="well">Registration Form</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form action="registrationInsert.jsp" method="post" onsubmit="return validateForm()"  >
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input type="text" placeholder="Enter First Name Here.." id="fname" name="fname" class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input type="text" placeholder="Enter Last Name Here.." id="lname" name="lname" class="form-control">
							</div>
						</div>					
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>House Name</label>
								<input type="text" placeholder="Enter House Name Here.." id="hname" name="hname" class="form-control">
							</div>	
								
							<div class="col-sm-6 form-group">
								<label>District</label>
								<input type="text" placeholder="Enter your District Here.." id="dist" name="dist" class="form-control">
							</div>		
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label>
								<input type="text" placeholder="Enter City Name Here.." id="city" name="city" class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>State</label>
								<input type="text" placeholder="Enter State Name Here.." id="state" name="state" class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Pin</label>
								<input type="text" placeholder="Enter Pin Code Here.." id="pin" name="pin" class="form-control">
							</div>		
						</div>
												
					<div class="col-sm-6 form-group">
						<label>Phone Number</label>
						<input type="text" placeholder="Enter Phone Number Here.." id="mob" name="mob" class="form-control">
					</div>		
					<div class="col-sm-6 form-group">
						<label>Degree</label>
                                                <input type="text" placeholder="Enter your Degree Here.." id="deg"  name="deg" class="form-control">  
					</div>	
					<div class="form-group">
						<label>College</label>
						<input type="text" placeholder="Enter College Name Here.." id="col" name="col" class="form-control">
					</div>
                                            <div class="well">
                                            <h1 class="well"> Login Information</h1>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" placeholder="Enter your Email as Username......" id="emailid" name="emailid" onchange="validate()" onkeyup="validate()" class="form-control"><p id="pl" style="color:red"></p>
                                                    <input type="hidden" value="" name="emailval" id="emailval" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" placeholder="Enter your Password to login......" id="upass" name="upass" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm Password</label>
                                                    <input type="password" placeholder="Enter your Password again to confirm....." id="cpass" name="cpass" class="form-control">
                                                </div>
                                            </div>
                                            <button type="submit" class="btn">Submit</button>
					<!--<input type="submit" value="submit" class="btn btn-lg btn-info">-->				
					</div>
				</form> 
				</div>
	</div>
</div>
       
    </body>
</html>