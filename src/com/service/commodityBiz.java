package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.dao.commodity.commodityDao;
import com.entity.commodity;
import com.entity.commodityClass;

public class commodityBiz {
	private commodityDao commoditydao;
	
	
	public void setCommoditydao(commodityDao commoditydao) {
		this.commoditydao = commoditydao;
	}
	public List<commodityClass> commodityClassAll()
	{
		return commoditydao.commodityClassAll();
	}
	public boolean commodityAdd(commodity commoditys)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String intime = df.format(new Date());
		commoditys.setIntime(intime);
		return commoditydao.commodityAdd(commoditys);
	}
	/*public List<commodity> commodityAll() 
	{
		return commoditydao.commodityAll();
	}*/
	public boolean commodityDelete(int productid)
	{
		return commoditydao.commodityDelete(productid);
	}
	/*public int getProductCount()
	{
		return commoditydao.getProductCount();
	}*/
/*	public List<commodity> commodityPage(int currentPageIndex, int countPerPage) 
	{
		return commoditydao.commodityPage(currentPageIndex, countPerPage);
	}*/
	public List<commodity> commoditySelectAll(int supertypeid)
	{
		return commoditydao.commoditySelectAll(supertypeid);
	}
	public List<commodity> commodityPage(int supertypeid, int currentPageIndex,
			int countPerPage) {
		return commoditydao.commodityPage(supertypeid, currentPageIndex, countPerPage);
	}
	public List<commodity> commoditySelectCom(int productid) {
		return commoditydao.commoditySelectCom(productid);
	}
	public List<commodity> selectCommoditys(String name) 
	{
		return commoditydao.selectCommoditys(name);
	}
}
