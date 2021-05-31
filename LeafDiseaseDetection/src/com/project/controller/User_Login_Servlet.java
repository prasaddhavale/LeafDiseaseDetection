package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.bean.RegisterBean;
import com.project.dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/User_Login_Servlet")
public class User_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Boolean resultStatus=Boolean.FALSE; 
	int id=0;
	public String mainPath="D:/Inputs/CottonTrainData";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter(); 
		String uemail=request.getParameter("useremail");
		String upassword=request.getParameter("password");
		
		
		RegisterBean bean=new RegisterBean();
		bean.setUemail(uemail);
		bean.setUpassword(upassword);
		
		UserDao ud=new UserDao();
		
		ResultSet rs=ud.getUserDetails(uemail,upassword);
		
		   try 
		   {
			  id=rs.getInt(1);
			  System.out.println("Id===="+id);
		   } 
		  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   }
	
		
			if(resultStatus=ud.checkUser(bean))
			{
				HttpSession session=request.getSession();  
		        session.setAttribute("email",uemail);
		        session.setAttribute("email",uemail);
		        session.setAttribute("mainPath", mainPath);
		        out.println("<script type=\"text/javascript\">");
				out.println("alert('Login Success!!!');");
				out.println("location='user_home.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Incorrect Username/Password!!!');");
				out.println("location='user_login.jsp';");
				out.println("</script>");
				
			} 
		
	}

}
