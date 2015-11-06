package com.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.getConnectionFactory;
import com.entity.OrderInfo;
import com.entity.OrderItem;
import com.entity.UserInfo;

public class UserDaoImpl implements UserDao{

	public boolean isExistence(String name) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select count(*) from userInfo where name=?");
			proc.setString(1, name);
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

	public boolean regUser(UserInfo userInfo) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("insert into userInfo(name,password,email) values(?,?,?)");
			proc.setString(1, userInfo.getName());
			proc.setString(2, userInfo.getPassword());
			proc.setString(3, userInfo.getEmail());
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

	public boolean loginUser(String name, String password) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select count(*) from userInfo where name=? and password=?");
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

	public boolean placeOrder(OrderInfo orderInfo) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("insert into orderInfo values(seq_orderid.nextval,?,?,?,?,?,?,?,?)");
			proc.setString(1, orderInfo.getUsername());
			proc.setString(2, orderInfo.getRealname());
			proc.setString(3, orderInfo.getAddress());
			proc.setString(4, orderInfo.getPostcode());
			proc.setString(5, orderInfo.getPhone());
			proc.setString(6, orderInfo.getOrderdate());
			proc.setInt(7, 0);
			proc.setInt(8, orderInfo.getTotalPrice());
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

	public int selectSeq() {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select seq_orderid.currval from dual");
			ResultSet rs = proc.executeQuery();
			if(rs.next())
			{
				int orderid = rs.getInt(1);
				return orderid;
			}
			else
			{
				return 0;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return 0;
		}
	}

	public boolean addOrderItem(OrderItem orderItem) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("insert into orderItem values(seq_orderitemid.nextval,?,?,?,?,?)");
			proc.setInt(1, orderItem.getOrderid());
			proc.setInt(2, orderItem.getProductid());
			proc.setString(3, orderItem.getProductname());
			proc.setInt(4, orderItem.getNowprice());
			proc.setInt(5, orderItem.getProductnum());
			
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

	public int selectcounts(int productid) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select stock from product where productid=?");
			proc.setInt(1, productid);
			ResultSet rs = proc.executeQuery();
			if(rs.next())
			{
				int stock = rs.getInt(1);
				return stock;
			}
			else
			{
				return 0;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return 0;
		}
	}

	public boolean UpdateStock(int productid, int stock) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("update product set stock = ? where productid = ?");
			proc.setInt(1, stock);
			proc.setInt(2, productid);
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
}
