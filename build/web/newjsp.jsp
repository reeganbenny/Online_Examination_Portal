<%-- 
    Document   : newjsp
    Created on : 10 Sep, 2017, 11:18:05 PM
    Author     : Reegan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="CFbootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="CFstylesheets/form-elements.css">
        <link rel="stylesheet" href="CFstylesheets/style.css">

        
             <!-- Javascript -->
        
        <script src="js/scripts.js"></script>
        
        
        <style>
            @import url(https://fonts.googleapis.com/css?family=Open+Sans);

	/* body	*/
	html, body {
		margin: 0;
		padding: 0;
		height: 100%;
		font-family: "Open Sans", Helvetica, sans-serif;
		background-color: #404040;
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
@media screen and (max-width: 800px) {
	#responsive-admin-menu #menu a span {
		display: none;
	}
	#responsive-admin-menu {
		float: left;
		width: 40px;
		position: relative;
	}
	#responsive-admin-menu {
		height: 100%;
	}
	#content-wrapper {
		margin-left: 40px;
	}
	#responsive-admin-menu #menu a.submenu:before {
		font-size: 6px;
		right: 5px;
	}
	#responsive-admin-menu #logo {
		background: url('../images/logo.png');
		background-position: -0px -0px;
		width: 29px;
		height: 26px;
		margin: 10px 10px 10px 5px;
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



        </style>
        <script>
            eval(function(p,a,c,k,e,r){e=function(c){return c.toString(a)};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('$(o).i(4(){$("p").q(\'<r t="u" m="9/3-6-0.9"/>\');s a="";$("#3-0").c(4(){$("#3-6-0 #0").g()});$(h).f(4(){$("#3-6-0 #0").j("k")});$("#0 a.l").c(4(){d(a!=""){$("#"+a).n("a").e("7");$("#"+a).b("8")};d(a==$(1).5("2")){$("#"+$(1).5("2")).b("8");$(1).e("7");a=""}v{$("#"+$(1).5("2")).w("8");a=$(1).5("2");$(1).x("7")};y z})});',36,36,'menu|this|name|responsive|function|attr|admin|downarrow|fast|css||slideUp|click|if|removeClass|resize|slideToggle|window|ready|removeAttr|style|submenu|href|prev|document|head|append|link|var|rel|stylesheet|else|slideDown|addClass|return|false'.split('|'),0,{}))
            </script>
    </head>
    <body>
        <div id="responsive-admin-menu">
	<div id="responsive-menu">
		<div class="menuicon">≡</div>
	</div>
	
	<div id="logo"></div>

	<!--Menu-->
	<div id="menu">
			<a href="" title="Dashboard"><i class="icon-dashboard"></i><span> 
			Dashboard</span></a>
			<a href="" title="News"><i class="icon-bullhorn"></i><span> News</span></a>
			<a href="" title="Pages"><i class="icon-file-alt"></i><span> Pages</span></a>
			<a href="" title="Media" class="submenu" name="media-sub"><i class="icon-eye-open"></i><span>  
			Media</span></a>
			<!-- Media Sub Menu -->
				<div id="media-sub" style="display: none;">
					<a href="" title="Video Gallery"><i class="icon-film"></i><span>  
					Video Gallery</span></a>
					<a href="" title="Photo Gallery"><i class="icon-picture"></i><span>  
					Photo Gallery</span></a>
				</div>
			<!-- Media Sub Menu -->
			
			<a href="" title="Graph &amp; Charts"><i class="icon-bar-chart"></i><span>  
			Graph &amp; Charts</span></a>
			<a href="" title="Events"><i class="icon-calendar"></i><span>  
			Events</span></a>

			<a href="" class="submenu" name="other-sub" title="Other Contents"><i class="icon-book"></i><span> 
			Other Contents</span></a>
			<!-- Other Contents Sub Menu -->
				<div id="other-sub" style="display: none;">
					<a href="" title="Forms"><i class="icon-list"></i><span>  
					Forms</span></a>
					<a href="" title="Mail Lists"><i class="icon-list-ul"></i><span>  
					Mail Lists</span></a>
					<a href="" title="Maps"><i class="icon-map-marker"></i><span>  
					Maps</span></a>
				</div>
			<!-- Other Contents Sub Menu -->
			<a href="" title="Admin Tools"><i class="icon-cogs"></i><span>  
			Admin Tools</span></a>
	</div>
	<!--Menu-->


</div>

<div id="content-wrapper">

	<div style="border:1px #e8e8e8 solid;margin:0px 0px 10px 0px">
		<div style="border-bottom:1px #e8e8e8 solid;background-color:#f3f3f3;padding:8px;font-size:13px;font-weight:700;color:#45484d;">
			Admin Menu Content</div>
		<div style="padding:8px;font-size:13px;">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do 
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim 
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut 
			aliquip ex ea commodo consequat. Duis aute irure dolor in 
			reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
			culpa qui officia deserunt mollit anim id est laborum.		</div>
	</div>

	<div style="border:1px #e8e8e8 solid;width:49%;float:left;margin:10px 0px 10px 0px">
		<div style="border-bottom:1px #e8e8e8 solid;background-color:#f3f3f3;padding:8px;font-size:13px;font-weight:700;color:#45484d;">
			Admin Menu Content</div>
		<div style="padding:8px;font-size:13px;">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do 
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim 
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut 
			aliquip ex ea commodo consequat. Duis aute irure dolor in 
			reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
			culpa qui officia deserunt mollit anim id est laborum.		</div>
	</div>

	<div style="border:1px #e8e8e8 solid;width:49%;float:right;margin:10px 0px 10px 0px">
		<div style="border-bottom:1px #e8e8e8 solid;background-color:#f3f3f3;padding:8px;font-size:13px;font-weight:700;color:#45484d;">
			Admin Menu Content</div>
		<div style="padding:8px;font-size:13px;">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do 
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim 
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut 
			aliquip ex ea commodo consequat. Duis aute irure dolor in 
			reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
			culpa qui officia deserunt mollit anim id est laborum.		</div>
	</div>



</div>

    </body>
</html>
