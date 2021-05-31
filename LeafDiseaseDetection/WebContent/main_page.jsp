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
							<a href="index.jsp"><h1><span>Leaf </span>Disease </h1></a>
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
	<div class="row">
	</div>
	 <div id="section" style="height:650px;">
	   <div class="row">
	    <div class="col-sm-12">
	    <div class="panel-body">
	      <div class="leftdiv"> 
	         <div class="col-md-12 col-md-offset-2">
                    <a id="tab1" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Original</a><br><br>
                    <a id="tab2" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Resize</a><br><br>
                    <a id="tab3" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Filter</a><br><br>
                     <a id="tab4" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Gray Scale Conversion</a><br><br>
                    <a id="tab5" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">FeatureExtraction</a><br><br>
                    <a id="tab6" class="btn btn-primary waves-effect" onclick="changeTab(this.id);" style="width:40%;">Classification</a><br><br>
             </div>
          </div>
       
          <div class="rightdiv"> 
       
       
                        <%
                            HttpSession basicPath=request.getSession();
                            String originalImgPath=(String)basicPath.getAttribute("originalImgPath");
                            System.out.println("originalImgPath= "+originalImgPath);
                            
                            String resizedImgPath=(String)basicPath.getAttribute("resizedImgPath");
                            System.out.println("resizedImgPath= "+resizedImgPath);
                            
                            String filterImgPath=(String)basicPath.getAttribute("filterImgPath");
                            System.out.println("filterImgPath= "+filterImgPath);
                            
                            String grayedImg=(String)basicPath.getAttribute("grayedImg");
                            System.out.println("grayedImg= "+grayedImg);
                            
                            
                            String test_featurefile=(String)basicPath.getAttribute("test_featurefile");
                            System.out.println("test_featurefile= "+test_featurefile);
                            
                            String message=(String)basicPath.getAttribute("message");
                            System.out.println("Message= "+message);
                            
                            String disease=(String)basicPath.getAttribute("cotton_disease");
                            System.out.println("disease= "+message);
                            
                            String path="";
                         %>
                            
                          <div id="innerData">
                              <img  src="postImage.jsp?imagepath=<%=originalImgPath%>" width="80%">
                          </div> 
                                              
                          <div id="org" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=originalImgPath%>" width="80%">
		                       <%
		                       path=originalImgPath;
		                       %>
		                  </div>
		                  
		                  <div id="resize" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=resizedImgPath%>" width="80%">
		                       <%
		                       path=resizedImgPath;
		                       %>
		                  </div>
		                  <div id="filter" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=filterImgPath%>" width="80%">
		                       <%
		                       path=filterImgPath;
		                       %>
		                  </div>
		                   <div id="grayscale" style="display: none; margin-left: 2cm;">
		                       <img  src="postImage.jsp?imagepath=<%=grayedImg%>" width="80%">
		                       <%
		                       path=grayedImg;
		                       %>
		                  </div>
		                  <div class="list" id="feature" style="display: none; margin-left: 2cm;">
		                      
		                      <%
		                      
		                      String txtFilePath = test_featurefile;
		                      BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
		                      //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
		                      StringBuilder sb = new StringBuilder();
		                      String line;

		                      while((line = reader.readLine())!= null){
		                          sb.append(line+"\n");
		                      }
		                      /* out.println(sb.toString());  */
		                      %>
		                      <textarea style="width:400px; height: 350px;" type="text/plain"  border="1"><%=sb%></textarea>
		                      
                         </div>
                         
                          <div id="classification" style="display: none; margin-left: 2cm;">
		                       
		                       <p align="center">
		                       <br><br><br><br><br>
		                          <h2 style="color: Red;"><%=message%></h2><br>
		                        <h3 style="color: purple;">Fertilizer Recommendation</h3>
		                          <%
		                          if(disease.equals("blackmeasles"))
		                          {
		                          %>
		                          <h3>Higher Yield:
AgroLiquid fertilizer for grapes are designed for efficiency, giving vines access to maximum nutrients through every growth stage. This helps the plants optimize bloom, producing more grapes at a faster rate.</h3>
		                          
		                          <%
		                          }
		                          else if(disease.equals("Bacterialleafblight"))
		                          {
		                          %>
		                          <h3>Healthier Vines:
The additional potassium accessible to the plant allows it to regulate water and carbon dioxide more efficiently. This makes it less vulnerable to drought, temperature extremes, disease, and stress.

		                           
		                          </h3>
		                          <%
		                          }
		                          else if(disease.equals("blackrot"))
		                          {
		                          %>
		                          <h3>Better Taste:
Brix levels are directly linked to taste. Higher Brix starts with the nutritional content of the soil. With the ability to process and transport sugars throughout the vine, the plant’s fruit ultimately receives more sugars, resulting in large, crisp, high-quality grapes.

		                          
		                         </h3>
		                          <%
		                          }
		                          %>
		                       </p> 
		                       <script type="text/javascript" language="javascript">
		                       var msg=<%=message%>
		                      
		                       </script>
		                  </div>
                         
		                  <%-- <div id="feature" style="display: none; margin-left: 2cm;">
		                       <h2><a  href="show_features.jsp?file_path=<%=test_featurefile%>">ViewFeatures</a></h2>
		                       <%
		                       path=test_featurefile;
		                       %>
		                  </div> --%>
		                  
     
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
	
	
	
<script type="text/javascript">

 $(document).ready(function() {
	 document.oncontextmenu = document.body.oncontextmenu = function() {
		 return false;
		 };
		 
		 $("#file").change(function() {

			    var val = $(this).val();

			    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
			        case 'gif': case 'jpg' :case 'jpeg':case 'png':
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


<script type="text/javascript" language="javascript">

function changeTab(getTab)
{
	
	var chkTab;
	
	switch(getTab)
	{
	 case 'tab1':
		 document.getElementById('innerData').innerHTML=document.getElementById("org").innerHTML; 
		 alert("Image Stored Successfully!!!")
		break;
	 case 'tab2':
		 document.getElementById('innerData').innerHTML=document.getElementById("resize").innerHTML; 
		 alert("Resized Successfully!!!")
		break;
	 case 'tab3':
		 document.getElementById('innerData').innerHTML=document.getElementById("filter").innerHTML; 
		 alert("Filtered Successfully!!!")
		break;
	 case 'tab4':
		 document.getElementById('innerData').innerHTML=document.getElementById("grayscale").innerHTML; 
		 alert("Grayscale Conversion Successfully!!!")
		break;
	 case 'tab5':
		 document.getElementById('innerData').innerHTML=document.getElementById("feature").innerHTML; 
		 alert("Feature Extraction Completed!!!")
		break;
	 case 'tab6':
		 document.getElementById('innerData').innerHTML=document.getElementById("classification").innerHTML; 
		 alert("Classification Completed!!!")
		break;
	 
	}
}
</script>  

  </body>
</html>