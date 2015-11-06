package com.dao.commodityClass;

import java.util.List;

import com.entity.commodityClass;

public interface commodityClassDao {
	public boolean commodityClassAdd(commodityClass commodity);
	public boolean commodityClassIsRepeat(commodityClass commodity);
	//public List<commodityClass> commodityClassSelectAll();
	public boolean commodityClassDelete(int supertypeid);
	public List<commodityClass> commodityClassPage(int currentPageIndex,int countPerPage);
	public int getSupertypeCount();
}
