package com.entity;

import java.util.List;

public class OrderInfoItem implements java.io.Serializable{
	
	private List<OrderItem> orderItem;
	private OrderInfo orderInfo;
	public List<OrderItem> getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
}
