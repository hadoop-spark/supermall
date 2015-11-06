package com.dao.OrderInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.getConnectionFactory;
import com.entity.OrderInfo;
import com.entity.OrderInfoItem;
import com.entity.OrderItem;
import com.entity.commodity;

public class OrderInfoDaoImpl implements OrderInfoDao{

	public List selectOrderids(String name) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select orderid from orderInfo where username=?");
			proc.setString(1, name.trim());
			ResultSet rs = proc.executeQuery();
			List list = new ArrayList();
			while(rs.next())
			{
				list.add(rs.getInt(1));
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}

	public List<OrderItem> selectOrderItems(int orderid) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from orderItem where orderid=?");
			proc.setInt(1, orderid);
			ResultSet rs = proc.executeQuery();
			List<OrderItem> list = new ArrayList<OrderItem>();
			while(rs.next())
			{
				OrderItem orderItems = new OrderItem();
				orderItems.setOrderid(rs.getInt("orderid"));
				orderItems.setProductid(rs.getInt("productid"));
				orderItems.setProductname(rs.getString("productname"));
				orderItems.setNowprice(rs.getInt("nowprice"));
				orderItems.setProductnum(rs.getInt("productnum"));
				list.add(orderItems);
			} 
			return list;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}	
	}

	public OrderInfo selectOrderInfo(int orderid) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from orderInfo where orderid=?");
			proc.setInt(1, orderid);
			ResultSet rs = proc.executeQuery();
			rs.next();
			OrderInfo orderInfo = new OrderInfo();
			orderInfo.setOrderid(rs.getInt("orderid"));
			orderInfo.setUsername(rs.getString("username"));
			orderInfo.setRealname(rs.getString("realname"));
			orderInfo.setAddress(rs.getString("address"));
			orderInfo.setPostcode(rs.getString("postcode"));
			orderInfo.setPhone(rs.getString("phone"));
			orderInfo.setOrderdate(rs.getString("orderdate"));
			orderInfo.setFlag(rs.getInt("flag"));
			orderInfo.setTotalPrice(rs.getInt("totalPrice"));
			return orderInfo;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return null;	
		}
	}

	public List selectAllOrderids() {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select orderid from orderInfo");
			ResultSet rs = proc.executeQuery();
			List list = new ArrayList();
			while(rs.next())
			{
				list.add(rs.getInt(1));
			}
			return list;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return null;	
		}
	}


	public boolean change(int x,int y) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("update orderInfo set flag = ? where orderid = ?");
			proc.setInt(1, x);
			proc.setInt(2, y);
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
