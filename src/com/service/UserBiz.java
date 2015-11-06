package com.service;

import com.dao.user.UserDao;
import com.entity.OrderInfo;
import com.entity.OrderItem;
import com.entity.UserInfo;

public class UserBiz {
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public boolean isExistence(String name)
	{
		return userDao.isExistence(name);
	}
	public boolean regUser(UserInfo userInfo) 
	{
		return userDao.regUser(userInfo);
	}
	public boolean loginUser(String name, String password) 
	{
		return userDao.loginUser(name, password);
	}
	public boolean placeOrder(OrderInfo orderInfo) 
	{
		return userDao.placeOrder(orderInfo);
	}
	public int selectSeq() 
	{
		return userDao.selectSeq();
	}
	public boolean addOrderItem(OrderItem orderItem)
	{
		return userDao.addOrderItem(orderItem);
	}
	public int selectcounts(int productid) 
	{
		return userDao.selectcounts(productid);
	}
	public boolean UpdateStock(int productid, int stock) 
	{
		return userDao.UpdateStock(productid, stock);
	}
}
