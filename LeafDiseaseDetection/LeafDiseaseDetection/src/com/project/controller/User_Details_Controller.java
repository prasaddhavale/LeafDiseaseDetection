package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.bean.RegisterBean;
import com.project.dao.UserDao;

/**
 * Servlet implementation class UserDetailsController
 */
@WebServlet("/User_Details_Controller")
public class User_Details_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Details_Controller() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
        UserDao dao=new UserDao();
		
		ArrayList<RegisterBean> user_details=new ArrayList<RegisterBean>();
		
		user_details=dao.userDetails();
		
		if(user_details.size()!=0)
		{
			HttpSession session = request.getSession();
			session.setAttribute("user_details", user_details);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('User Details Success!!!');");
			out.println("location='admin_view_users_details.jsp';");
			out.println("</script>");
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Records are not found!!!');");
			out.println("location='admin_home.jsp';");
			out.println("</script>");
		}
		
	
	}

}
