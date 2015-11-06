package com.dao.commodity;

import java.util.List;

import com.entity.commodity;
import com.entity.commodityClass;

public interface commodityDao {
	public List<commodity> selectCommoditys(String name);
	public List<commodity> commodityShowAll(int supertypeid);
	public List<commodityClass> commodityClassAll();
	public boolean commodityAdd(commodity commoditys);
//	public List<commodity> commodityAll();
	public boolean commodityDelete(int productid);
//	public List<commodity> commodityPage(int currentPageIndex,int countPerPage);
//	public int getProductCount();
	public List<commodity> commoditySelectAll(int supertypeid);
	public List<commodity> commoditySelectCom(int productid);
	public List<commodity> commodityPage(int supertypeid,int currentPageIndex,int countPerPage);
	public List<commodity> commoditysTopTen();
	public List<commodity> commoditysTopFive();
}
