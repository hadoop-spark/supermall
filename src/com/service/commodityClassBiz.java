package com.service;

import java.util.List;

import com.dao.commodityClass.commodityClassDao;
import com.entity.commodityClass;

public class commodityClassBiz {
	private commodityClassDao commodityclassdao;
	
	public void setCommodityclassdao(commodityClassDao commodityclassdao) {
		this.commodityclassdao = commodityclassdao;
	}

	public boolean commodityClassAdd(commodityClass commodity)
	{
		return commodityclassdao.commodityClassAdd(commodity);
	}
	
	public boolean commodityClassIsRepeat(commodityClass commodity)
	{
		return commodityclassdao.commodityClassIsRepeat(commodity);
	}
	/*public List<commodityClass> commodityClassSelectAll()
	{
		return commodityclassdao.commodityClassSelectAll();
	}*/
	public boolean commodityClassDelete(int supertypeid)
	{
		return commodityclassdao.commodityClassDelete(supertypeid);
	}
	public List<commodityClass> commodityClassPage(int currentPageIndex,int countPerPage) 
	{
		return commodityclassdao.commodityClassPage(currentPageIndex, countPerPage);
	}
	public int getSupertypeCount()
	{
		return commodityclassdao.getSupertypeCount();
	}
}
