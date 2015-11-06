package com.entity;

public class ShoppingItem implements java.io.Serializable{
	private commodity product;
	private int buyNum;
	private float totalPrice;
	public commodity getProduct() {
		return product;
	}
	public void setProduct(commodity product) {
		this.product = product;
	}
	
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
