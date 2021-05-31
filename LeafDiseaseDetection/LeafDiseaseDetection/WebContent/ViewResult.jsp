<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.project.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Leaf Disease  | View Results</title>

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
							<a href="index.jsp"><h1><span>Leaf </span>Disease </h1></a>
						</div>
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="user_home.jsp" >Home</a></li>
								<li><a href="User_Profile_Controller">MyProfile</a></li>
								<li role="presentation"><a href="user_upload_image_1.jsp" >Upload Leaf Image</a></li>
								<li role="presentation"><a href="user_upload_image_2.jsp" >Prediction on Weather Data</a></li>								
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
	
	<section id="main-slider" class="no-margin">
        <div class="carousel slide">      
            <div class="carousel-inner">
                <div class="item active" >
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-4">
                            
								
	  <div id="login-page" >
	  	<div class="container" >
	  	
		      <form class="form-login" action="ViewResult.jsp" method="post" style="margin-top:-75;";>
		        <h1 class="form-login-heading" style="margin: 0;
	padding: 25px 20px;
	text-align: center;
	background: #32CD32;
	border-radius: 5px 5px 0 0;
	-webkit-border-radius: 5px 5px 0 0;
	color: #fff;
	font-size: 20px;
	text-transform: uppercase;
	font-weight: 300;">Result</h1>
	<%
	
	String crop=request.getParameter("crop");
	String week=request.getParameter("week");
	
	String pest_value=null;
	String max_temp=null;
	String min_temp=null;
	String rainfall=null;
	String sunshine=null;
	String evaporation=null;
	
	Connection con=DBConnect.getConnection();
	
	String sql="select * from tbl_weather where crop='"+crop+"' and week='"+week+"'";
	
	PreparedStatement ps=con.prepareStatement(sql);
	
	ResultSet rs=ps.executeQuery();
	
	while(rs.next())
	{
		pest_value=rs.getString(4);
		max_temp=rs.getString(5);
		min_temp=rs.getString(6);
		rainfall=rs.getString(7);
		sunshine=rs.getString(8);
		evaporation=rs.getString(9);
				
	}
	%>
	  
	<%-- <p style="color:red;"><font size="2">${message}</font></p> --%>
		        <div class="login-wrap">
		         <div class="input-group">
		           
		             <h3 style="color: green;">Crop: <%=crop%></h3>
		              <h3 style="color: green;">Crop Weeks: <%=week%></h3>
		               <h3 style="color: green;">Pest Value: <%=pest_value%></h3>
		                <h3 style="color: green;">Maximum Temperature: <%=max_temp%></h3>
		                 <h3 style="color: green;">Minimum Temperature: <%=min_temp%></h3>
		                  <h3 style="color: green;">Rainfall: <%=rainfall%></h3>
		                   <h3 style="color: green;">Sunshine: <%=sunshine%></h3>
		                    <h3 style="color: green;">Evaporation: <%=evaporation%></h3>
		                     
		        	
		        	
		       </div>
		        
		            <br>
		            
		         </div>
		         		
		      </form>	  	
	  	
	  	</div>
	  </div>

								
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->             
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->
	
	
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