package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.project.bean.Adminbean;
import com.project.bean.RegisterBean;
import com.project.db.DBConnect;

public class AdminDao {
	
	Connection connection=DBConnect.getConnection();
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement psmt;
	ResultSet rs;
	
	public boolean checkAdmin(Adminbean bean)
	{
		
		try {
			String sql="Select * from tbl_admin where admin_email=? and admin_password=?";
			psmt = connection.prepareStatement(sql);
			
			psmt.setString(1,bean.getEmail());
			psmt.setString(2,bean.getPassword());
			ResultSet rs=psmt.executeQuery();
			resultStatus=rs.next();
		    System.out.println("resultStatus= "+resultStatus);
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	
		return resultStatus;
	}

	
}
