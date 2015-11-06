package com.dao.OrderInfo;

import java.util.List;

import com.entity.OrderInfo;
import com.entity.OrderItem;

public interface OrderInfoDao {
	public List selectOrderids(String name);
	public List<OrderItem> selectOrderItems(int orderid);
	public OrderInfo selectOrderInfo(int orderid);
	public List selectAllOrderids();
	public boolean change(int x,int y);
}
