package com.service;

import java.util.List;

import com.dao.commodity.commodityDao;
import com.entity.commodity;
import com.entity.commodityClass;

public class commodityTypeBiz {
	private commodityDao commoditydao;

	public void setCommoditydao(commodityDao commoditydao) {
		this.commoditydao = commoditydao;
	}
	public List<commodityClass> commodityClassAll()
	{
		return commoditydao.commodityClassAll();
	}
	public List<commodity> commoditySelectAll(int supertypeid)
	{
		return commoditydao.commoditySelectAll(supertypeid);
	}
	public List<commodity> commoditySelectCom(int productid)
	{
		return commoditydao.commoditySelectCom(productid);
	}
	public List<commodity> commodityShowAll(int supertypeid)
	{
		return commoditydao.commodityShowAll(supertypeid);
	}
	public List<commodity> commoditysTopFive() 
	{
		return commoditydao.commoditysTopFive();
	}
	public List<commodity> commoditysTopTen() 
	{
		return commoditydao.commoditysTopTen();
	}
}
