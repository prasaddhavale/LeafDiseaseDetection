package com.project.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.project.bean.RegisterBean;
import com.project.dao.UserDao;


/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/User_Registration_Servlet")
@MultipartConfig(maxFileSize=1024*1024*1024)
public class User_Registration_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Registration_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		InputStream inputStream = null; 
		
		String uname=request.getParameter("username");
		String uaddress=request.getParameter("useraddress");
		String uemail=request.getParameter("useremail");
		String umobno=request.getParameter("usermobno");
		String upassword=request.getParameter("userpassword");
		
		RegisterBean bean=new RegisterBean();
		
		bean.setUname(uname);
		bean.setUaddress(uaddress);
		bean.setUemail(uemail);
		bean.setUmobno(umobno);
		bean.setUpassword(upassword);
		
		UserDao ud=new UserDao();
		
		
		if(ud.registerUser(bean))
		{
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('User Registraction Success!!!');");
			out.println("location='user_login.jsp';");
			out.println("</script>");
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registration Failed!!!');");
			out.println("location='user_register.jsp';");
			out.println("</script>");
			//response.sendRedirect("userregister.jsp");
		}
	}

}
