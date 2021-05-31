package com.project.controller;

import java.io.IOException;
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
 * Servlet implementation class DeleteUserController
 */
@WebServlet("/Delete_User_Controller")
public class Delete_User_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_User_Controller() {
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
		
		   int id = Integer.parseInt(request.getParameter("userid"));
			
		    UserDao d=new UserDao();
			
			ArrayList<RegisterBean> user_details=new ArrayList<RegisterBean>();
			
			
			if(d.deleteUser(id))
			{
				
				user_details=d.userDetails();
				
				if(user_details.size()!=0)
				{
					HttpSession session = request.getSession();
					session.setAttribute("user_details", user_details);
					RequestDispatcher rd = request.getRequestDispatcher("admin_view_users_details.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("ErrMsg", "Records are not found");
					RequestDispatcher rd = request.getRequestDispatcher("admin_home.jsp");
					rd.forward(request, response);
				}	
				
			}
		   
		  else{
			request.setAttribute("ErrMsg", "User Not Removed");
			RequestDispatcher rd = request.getRequestDispatcher("admin_home.jsp");
			rd.forward(request, response);
		    }	
		}
		
	

}
