package com.project.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.project.bean.Adminbean;
import com.project.bean.RegisterBean;
import com.project.db.DBConnect;

public class UserDao {
	Connection connection=DBConnect.getConnection();
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement psmt;
	ResultSet rs;
	
	public static ResultSet getfile(String filename) {
		ResultSet rs = null;
		try {
			Connection conn = DBConnect.getConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from tbl_testdataset where name='" + filename + "'");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean registerUser(RegisterBean bean)
	   {
		try
		   {
		        String sql="Select * from tbl_user where user_name=? or user_email=?";
				psmt = connection.prepareStatement(sql);
				psmt.setString(1,bean.getUname());
				
				psmt.setString(2,bean.getUemail());
				rs=psmt.executeQuery();
				Boolean b=rs.next();
				
				if(b==true)
				{
				System.out.println("Record already exist");
				
				}
				
				else
				{
				
				    String SQL="insert into tbl_user(user_name, user_address, user_email, user_mobno, user_password) values(?,?,?,?,?)"; 
				
					PreparedStatement pstmt=connection.prepareStatement(SQL);
					pstmt.setString(1, bean.getUname());
					pstmt.setString(2, bean.getUaddress());
					pstmt.setString(3, bean.getUemail());
					pstmt.setString(4, bean.getUmobno());
					pstmt.setString(5, bean.getUpassword());
					
					
					int index=pstmt.executeUpdate();
					
					if(index>0)
					{
						resultStatus=Boolean.TRUE;
					}
					else
					{
						resultStatus=Boolean.FALSE;	
					}
					
			   
	     	    }
		   }
				
				catch (SQLException e) 
				  {
					// TODO Auto-generated catch block
					e.printStackTrace();
				  }
					
		     return resultStatus;
				
		 }
	
	/**********************************************************************************************************************/
	
	public boolean checkUser(RegisterBean bean)
	{
		
		try {
			System.out.println("usercheck");
			String sql="Select * from tbl_user where user_email=? and user_password=?";
			psmt = connection.prepareStatement(sql);
			psmt.setString(1,bean.getUemail());
			psmt.setString(2,bean.getUpassword());
			ResultSet rs=psmt.executeQuery(); 
			resultStatus=rs.next();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		System.out.println(resultStatus);
		return resultStatus;
	}
	
	/**********************************************************************************************************************/
	public boolean deleteUser(int id) {
		boolean flag=false;
		try{
			
		 String query="delete from tbl_user where id='"+id+"'";
		 
		 PreparedStatement ps= connection.prepareStatement(query);
		 
		 int index = ps.executeUpdate();
			if(index>0){
			
				flag=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	/**********************************************************************************************************************/
	
	public ResultSet getUserDetails(String email, String password)
	{
		ResultSet rs=null;
		
		try {
			String sql="Select * from tbl_user where user_email='"+email+"' and user_password='"+password+"'";
			Statement stmt=connection.createStatement();
			System.out.println("In Dao");
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				
				//System.out.println("id"+i);
			}
			    
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	
		return rs;
	}
	
	/**********************************************************************************************************************/
	
	public  ArrayList<RegisterBean> userDetails()
	{
		
	   ResultSet rs=null;
	   
	   ArrayList<RegisterBean> details = new ArrayList<RegisterBean>();
	   
       String sql = "Select * from tbl_user";
		
		try {
			
			Statement stmt=connection.createStatement();
		
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				RegisterBean bean=new RegisterBean();
				bean.setUid(rs.getInt(1));
				bean.setUname(rs.getString(2));
				bean.setUaddress(rs.getString(3));
				bean.setUemail(rs.getString(4));
				bean.setUmobno(rs.getString(5));
				
				details.add(bean);
			}
			
		 } 
		catch (SQLException e) 
		   {
			
			 e.printStackTrace();
		   }
		return details;
		
		
	}
	/**********************************************************************************************************************/
	
	public RegisterBean userSelect(String email)
	{
		RegisterBean bean=new RegisterBean();
		String sql = "Select * from tbl_user where user_email ='"+email.toLowerCase()+"'";
		
		try {
			
			Statement stmt=connection.createStatement();
		
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next())
			{
			    bean.setUname(rs.getString(2));
			    bean.setUpassword(rs.getString(6));
			    bean.setUemail(rs.getString(4));	
			}
		 } 
		catch (SQLException e) 
		   {
			
			 e.printStackTrace();
		   }
		return bean;
	}
	
	/**********************************************************************************************************************/ 
	
	public RegisterBean getDetails(int id)
	{
		
	   ResultSet rs=null;
	   RegisterBean bean=new RegisterBean();
	   
       String sql = "Select * from tbl_user where id='"+id+"'";
		
		try {
			
			Statement stmt=connection.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				bean.setUid(rs.getInt(1));
				bean.setUname(rs.getString(2));
				bean.setUaddress(rs.getString(3));
				bean.setUemail(rs.getString(4));
				bean.setUmobno(rs.getString(5));	
			}
			
		 } 
		catch (SQLException e) 
		   {
			
			 e.printStackTrace();
		   }
		return bean;
		
		
	}
	
	/**********************************************************************************************************************/
	
}
