<!DOCTYPE html>
<%@page import="java.util.TreeMap"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fingerprint </title>

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
 
 
 <!-- <style type="text/css">
#message{
  margin:10px;
  padding:10px;
}
.info, .success, .warning, .error, .validation {
			border: 1px solid;
			margin: 10px 0px;
			
			background-repeat: no-repeat;
			background-position: 10px center;
		}
		.info, .success, .warning, .error, .validation {
			border: 1px solid;
			margin: 10px 0px;
			padding: 15px 10px 15px 50px;
			background-repeat: no-repeat;
			background-position: 10px center;
		}
		.info {
			color: #00529B;
			background-color: #BDE5F8;
			background-image: url('img/info.png');
		}
		.success {
			color: #4F8A10;
			background-color: #DFF2BF;
			background-image: url('img/success.png');
		}
		.warning {
			color: #9F6000;
			background-color: #FEEFB3;
			background-image: url('img/warning.png');
		}
		.error{
			color: #D8000C;
			background-color: #FFBABA;
			background-image: url('img/error.png');
		}
		.validation{
			color: #D63301;
			background-color: #FFCCBA;
			background-image: url('img/validation.png');
		}
</style> -->

 
 

 
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
							<a href="#"><h1><span>Distorted  </span>Fingerprint</h1></a>
						</div>
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="ClientWelcome.jsp" >Home</a></li>
								<li role="presentation"><a href="ClientWelcome.jsp" class="active">Upload Image</a></li>
															
								<li role="presentation"><a href=LogoutServlet>Signout</a></li>						
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		</nav>		
	</header>
	<div id="breadcrumb" >
		<div class="container">	
			<div class="breadcrumb">							
		
				<li style="margin-top:100px;"> Welcome  <strong>Admin</strong></li>			
			
			</div>		
		</div>	
	</div>
	
	<div id="section" style="height:600px;">
		
		<div class="row">
			<div class="col-lg-12">
	         <div class="well" style="margin-left:300px; width:400px; height:350px; margin-top:50px;">
					  
					<form action="UploadServlet" method="post" enctype="multipart/form-data">
						
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;">
						   </div>
							<div>
								<span class="btn btn-default" > 
									<!--   <span class="fileinput-new">Select image</span>  -->
								<!-- 	  <span class="fileinput-exists">Change</span> -->
								  	 <input type="file" id= "file" name="file" size="50" class="btn btn-success" multiple accept='image/*' />
									



								</span>
								
								  
									
									
							</div>
							&nbsp;
							<div >
							<input type="submit" id="btnUpload" value="Upload" class="btn btn-info" /> &nbsp;&nbsp;
								  <a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Remove</a>
								<div>
							<span id="message"></span>
						</div>
								 </div>
							
						</div>
						
					</form> 




				</div>




			</div>

		</div>
	</div>
	

	
		
	
	
	<br><br>
	
	<footer >
		<div class="footer" style=" margin-top:100px;" >
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
     <script src="js/jquery.min.js"></script>
    <script src="js/jasny-bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>  
	<script src="js/wow.min.js"></script>
	<script src="js/functions.js"></script>
	
	
	
	
<script type="text/javascript">

 $(document).ready(function() {
	 document.oncontextmenu = document.body.oncontextmenu = function() {
		 return false;
		 };
		 
		 $("#file").change(function() {

			    var val = $(this).val();

			    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
			        case 'gif': case 'jpg' :case 'bmp':case 'png':
			        	$('#message').text("correct image").css("color" , "red");
			        	$('#message').addClass("info");
			            
			            break;
			        default:
			            $(this).val('');
			            $('#message').text("Please select only image").css("color" , "red");;
			            $('#message').addClass("warning");
			            
			            break;
			    }
			}); 
    $('#btnUpload').bind("click",function() 
    { 
        var imgVal = $('#file').val(); 
        if(imgVal=='') 
        { 
        	$('#message').text("Please select your  image").css("color" , "red");;
            $('#message').addClass("validation");
            return false; 

        } 
       
        else
        	{
        	
        	
        	$('form').submit();
        	}

    }); 
}); 
</script>
	
	
	
  </body>
</html>