<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.InputStream,java.sql.*"%>
<%@page import="com.project.db.*" %>
<%
try
{    
	    int byteRead=0;
        byte[] bytearray = new byte[1048576];
        //InputStream is=org.apache.commons.io.IOUtils.toInputStream(source, "UTF-8");
        
        DBConnect db=new DBConnect();
        Connection connection=DBConnect.getConnection();
        
        String path=request.getParameter("file_path");
        System.out.println("Test Feature file path in show_features.jsp= "+path);
        
    	if(path!=null)
    	{	
    	  
    	  InputStream is = new FileInputStream(new File(path));
          
    	  if(is!=null)
  	      {
        
           String contentType = "application/msword"; //doc
           String contentType1 = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"; //docx                     
         
           while((byteRead =is.read(bytearray))!= -1 )
           {
        	 response.reset();
             response.setContentType(contentType);
             response.getOutputStream().write(bytearray,0,byteRead);
             response.getOutputStream().write(bytearray, 0, byteRead);
 	         response.getOutputStream().flush(); 
 	         response.getOutputStream().close();
 	         out.clear();
 			 out = pageContext.pushBody();
           }
  	      }
         else
          {
        	out.println("<script type=\"text/javascript\">");
			out.println("alert('Features not found!!!');");
			out.println("location='main_page.jsp';");
			out.println("</script>");
          }
    	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
