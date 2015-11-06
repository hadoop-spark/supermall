package com.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.getConnectionFactory;

public class AdminDaoImpl implements AdminDao{

	public boolean loginAdmin(String name, String password) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select count(*) from adminInfo where name=? and password=?");
			proc.setString(1, name.trim());
			proc.setString(2, password.trim());
			ResultSet rs = proc.executeQuery();
			if(rs.next())
			{
				int count = rs.getInt(1);
				if(count>=1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				return false;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
	}

}
