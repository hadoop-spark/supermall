package com.entity;

public class commodity implements java.io.Serializable{
	
	private int productid;
	private String productname;
	private int supertypeid;
	private String brand;
	private String picture;
	private String introduce;
	private int price;
	private int nowprice;
	private int producNum;
	private String intime;
	private int stock;
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getSupertypeid() {
		return supertypeid;
	}
	public void setSupertypeid(int supertypeid) {
		this.supertypeid = supertypeid;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNowprice() {
		return nowprice;
	}
	public void setNowprice(int nowprice) {
		this.nowprice = nowprice;
	}
	public int getProducNum() {
		return producNum;
	}
	public void setProducNum(int producNum) {
		this.producNum = producNum;
	}
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
}
