<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Leaf Disease  | UserHome</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" />	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <![endif]-->
	  <!-- Bootstrap core CSS -->
  <!--  <link href="css1/bootstrap.css" rel="stylesheet"> -->
    <!--external css-->
    <link href="css1/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="css1/style.css" rel="stylesheet">
    <link href="css1/style-responsive.css" rel="stylesheet">
    
    
    <style type=text/css> 
         .leftdiv 
         { 
         float: left;
         width: 40%;  
         } 
         .middlediv 
         { 
         float: left; 
         background-color:gray 
         } 
         .rightdiv 
         { 
         float: left; 
         width: 50%; 
         } 
        list  p {
    font: arial;
    font-size: 14px;
    background-color: yellow ;
}
      </style>
<%--  <%
       response.setHeader("Cache-Control", "no-cache, no-store");
       response.setHeader("Pragma", "no-cache");
       response.setHeader("Expires","0");
     
       String uemail=(String)session.getAttribute("email");
       if(uemail!=null)
        {
   %>
  <%
}
else
{
  response.sendRedirect("user_login.jsp");	
}
%>
	  --%>
	  
  </head>
  <body>
	<header>		
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navigation">
				<div class="container">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href="index.jsp"><h1><span>Leaf</span>Disease </h1></a>
						</div>
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="user_home.jsp" >Home</a></li>								
								<li role="presentation"><a href="LogoutServlet">LogOut</a></li>						
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		</nav>		
	</header>
	
	
	<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">							
				<li><a href="index.jsp"></a></li>
						
			</div>		
		</div>	
	</div>
	
	<div class="container">
	
	 <div id="section" style="height:650px;">
	   <div class="row">
	    <div class="col-sm-12">
	    <div class="panel-body">
	    
       
                        <%
                            HttpSession basicPath=request.getSession();
                            String originalImgPath=(String)basicPath.getAttribute("originalImgPath_1");
                            System.out.println("originalImgPath= "+originalImgPath);
                            
                            String resizedImgPath=(String)basicPath.getAttribute("resizedImgPath_1");
                            System.out.println("resizedImgPath= "+resizedImgPath);
                            
                            String filterImgPath=(String)basicPath.getAttribute("filterImgPath_1");
                            System.out.println("filterImgPath= "+filterImgPath);
                            
                            String test_featurefile=(String)basicPath.getAttribute("test_featurefile_1");
                            System.out.println("test_featurefile= "+test_featurefile);
                            
                            String message=(String)basicPath.getAttribute("message_1");
                            System.out.println("Message= "+message);
                            
                            String disease=(String)basicPath.getAttribute("cotton_disease_1");
                            System.out.println("disease= "+message);
                            
                            String path="";
                         %>
                            
                         <div class="col-md-12 col-md-offset-4">
                         <div class="col-md-12">
		                       
		                       <p align="center">
		                       <br><br><br><br><br>
		                           <h1 style="color: purple;">CLASSIFICATION RESULT</h1><br>
		                       </p>
		                      
		                 </div>
		                 </div>
                         <div class="col-md-12 col-md-offset-3">
                         <div class="col-md-12">
		                       
		                       <p align="center">
		                       
		                       <h1 style="color: green;"><%=message%></h1>
		                       <div class="col-md-10">
		                     
		                       <script type="text/javascript" language="javascript">
		                       var msg=<%=message%>
		                       alert(var);
		                       </script>
		                 </div>
		                 </div>
                         
		    
	     </div>
	   </div>
	 </div>
   </div>
</div>

	<br><br>
	
	<footer>
		<div class="footer">
			<div class="container">
				<div class="social-icon">
					<div class="col-md-4">
						<ul class="social-network">
							<li><a href="#" class="fb tool-tip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter tool-tip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="gplus tool-tip" title="Google Plus"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#" class="linkedin tool-tip" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#" class="ytube tool-tip" title="You Tube"><i class="fa fa-youtube-play"></i></a></li>
						</ul>	
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-4">
					
                  
				</div>						
			</div>
			
			<div class="pull-right">
				<a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
			</div>		
		</div>
	</footer>


	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.1.1.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>  
	<script src="js/wow.min.js"></script>
	<script src="js/functions.js"></script>
	


  </body>
</html>