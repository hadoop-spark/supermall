package com.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class getConnectionFactory {
	private static ThreadLocal<Connection> connThread= new ThreadLocal<Connection>();
	public static Connection getConnection()
	{
		Connection conn = connThread.get();
		if(conn==null)
		{
			try 
			{
				Context ctx = new InitialContext();
				DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
				conn=ds.getConnection();
				connThread.set(conn);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		return conn;
	}
	
	/*public static Connection getConnection()
	{
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "Oracle12c");
			return conn;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}	
	}*/
}
