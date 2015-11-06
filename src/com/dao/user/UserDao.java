package com.dao.user;

import com.entity.OrderInfo;
import com.entity.OrderItem;
import com.entity.UserInfo;

public interface UserDao {
	public boolean isExistence(String name);
	public boolean regUser(UserInfo userInfo);
	public boolean loginUser(String name,String password);
	public boolean placeOrder(OrderInfo orderInfo);
	public int selectSeq();
	public boolean addOrderItem(OrderItem orderItem);
	public int selectcounts(int productid);
	public boolean UpdateStock(int productid,int stock);
}
