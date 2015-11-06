package com.entity;

public class commodityClass implements java.io.Serializable{
	private int supertypeid;
	private String typename;
	public int getSupertypeid() {
		return supertypeid;
	}
	public void setSupertypeid(int supertypeid) {
		this.supertypeid = supertypeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
}
