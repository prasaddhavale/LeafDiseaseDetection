<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="javax.servlet.http.*" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%

            int byteRead;
            byte[] buffer = new byte[1024*1024*50];
            
            String path=request.getParameter("imagepath");
            
            System.out.println("path= "+path);
		
		    File f=new File(path);
		
		    InputStream is=new FileInputStream(f);
		    if(is!=null)
			  {
				  while ((byteRead =is.read(buffer)) != -1)
			  
				{
			    	response.reset();
					response.setContentType("image/jpg");
					response.setHeader("Content-disposition","attachment; filename=" );
			        response.getOutputStream().write(buffer, 0, byteRead);
			        response.getOutputStream().flush(); 
			        response.getOutputStream().close();
			        out.clear();
					out = pageContext.pushBody();
			 	}
				 
			  }
		 	
		
%>
