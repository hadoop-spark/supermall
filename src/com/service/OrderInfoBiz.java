package com.service;

import java.util.ArrayList;
import java.util.List;

import com.dao.OrderInfo.OrderInfoDao;
import com.entity.OrderInfo;
import com.entity.OrderItem;

public class OrderInfoBiz {
	private OrderInfoDao orderInfoDao;

	public void setOrderInfoDao(OrderInfoDao orderInfoDao) {
		this.orderInfoDao = orderInfoDao;
	}
	public List selectOrderids(String name) 
	{
		return orderInfoDao.selectOrderids(name);
	}
	public List<OrderItem> selectOrderItems(int orderid) 
	{
		return orderInfoDao.selectOrderItems(orderid);
	}
	public OrderInfo selectOrderInfo(int orderid) 
	{
		return orderInfoDao.selectOrderInfo(orderid);
	}
	public List selectAllOrderids()
	{
		return orderInfoDao.selectAllOrderids();
	}
	public boolean change(int x,int y) 
	{
		return orderInfoDao.change(x, y);
	}
}
