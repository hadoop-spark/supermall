package com.dao.commodityClass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.getConnectionFactory;
import com.entity.commodityClass;

public class commodityClassDaoImpl implements commodityClassDao{
	
	public boolean commodityClassAdd(commodityClass commodity) {
		try
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("insert into supertype values(seq_n.nextval,?)");
			proc.setString(1, commodity.getTypename());
			int count = proc.executeUpdate();
			if(count>=1)
			{
				return true;
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
	public boolean commodityClassIsRepeat(commodityClass commodity) {
		
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select count(*) from supertype where typename=?");
			proc.setString(1, commodity.getTypename());
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
	
	/*public List<commodityClass> commodityClassSelectAll() {
		
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from supertype");
			ResultSet rs = proc.executeQuery();
			List<commodityClass> list = new ArrayList<commodityClass>();
			while(rs.next())
			{
				commodityClass commodity = new commodityClass();
				commodity.setSupertypeid(rs.getInt("supertypeid"));
				commodity.setTypename(rs.getString("typename").trim());
				list.add(commodity);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}*/
	
	public boolean commodityClassDelete(int supertypeid)
	{
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("delete from supertype where supertypeid=?");
			proc.setInt(1,supertypeid);
			int count = proc.executeUpdate();
			if(count>=1)
			{
				return true;
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
	
	public List<commodityClass> commodityClassPage(int currentPageIndex,
			int countPerPage) {
		
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			String sql = "select supertypeid,typename from" +
					"(select rownum as ÐÐºÅ,supertypeid,typename from supertype)" +
					"where ÐÐºÅ>? and ÐÐºÅ<=?";
			PreparedStatement proc = conn.prepareStatement(sql);
			proc.setInt(1,(currentPageIndex-1)*countPerPage);
			proc.setInt(2, currentPageIndex*countPerPage);
			ResultSet rs = proc.executeQuery();
			List<commodityClass> list = new ArrayList<commodityClass>();
			while(rs.next())
			{
				commodityClass commodity = new commodityClass();
				commodity.setSupertypeid(rs.getInt("supertypeid"));
				commodity.setTypename(rs.getString("typename").trim());
				list.add(commodity);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
		
	}

	public int getSupertypeCount() {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select count(*) from supertype");
			ResultSet rs = proc.executeQuery();
			rs.next();
			int pageCount = rs.getInt(1);
			return pageCount;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
}
