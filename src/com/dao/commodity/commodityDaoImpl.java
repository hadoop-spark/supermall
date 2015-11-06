package com.dao.commodity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.getConnectionFactory;
import com.entity.commodity;
import com.entity.commodityClass;

public class commodityDaoImpl implements commodityDao{

	public List<commodityClass> commodityClassAll() {
		
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from supertype");
			ResultSet rs = proc.executeQuery();
			List<commodityClass> list = new ArrayList<commodityClass>();
			while(rs.next())
			{
				commodityClass commodity = new commodityClass();
				commodity.setSupertypeid(rs.getInt("supertypeid"));
				commodity.setTypename(rs.getString("typename").trim());
				list.add(commodity);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}

	public boolean commodityAdd(commodity commoditys) {
		
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("insert into product values(seq_p.nextval,?,?,?,?,?,?,?,?,?,?)");
			proc.setString(1, commoditys.getProductname());
			proc.setInt(2, commoditys.getSupertypeid());
			proc.setString(3, commoditys.getBrand());
			proc.setString(4, commoditys.getPicture());
			proc.setString(5, commoditys.getIntroduce());
			proc.setInt(6, commoditys.getPrice());
			proc.setInt(7, commoditys.getNowprice());
			proc.setInt(8, commoditys.getProducNum());
			proc.setString(9, commoditys.getIntime());
			proc.setInt(10, commoditys.getStock());
			int count = proc.executeUpdate();
			if(count>=1)
			{
				return true;
			}
			else
			{
				return false;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
	}

	/*public List<commodity> commodityAll() {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from product");
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}*/

	public boolean commodityDelete(int productid) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("delete from product where productid=?");
			proc.setInt(1,productid);
			int count = proc.executeUpdate();
			if(count>=1)
			{
				return true;
			}
			else
			{
				return false;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
	}


	/*public int getProductCount() {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select count(*) from product");
			ResultSet rs = proc.executeQuery();
			rs.next();
			int pageCount = rs.getInt(1);
			return pageCount;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}*/

	/*public List<commodity> commodityPage(int currentPageIndex, int countPerPage) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			String sql = "select productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from" +
					"(select rownum as 行号,productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from product)" +
					"where 行号>? and 行号<=?";
			PreparedStatement proc = conn.prepareStatement(sql);
			proc.setInt(1,(currentPageIndex-1)*countPerPage);
			proc.setInt(2, currentPageIndex*countPerPage);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}
*/
	public List<commodity> commoditySelectAll(int supertypeid) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from product where supertypeid=?");
			proc.setInt(1, supertypeid);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				/*commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));*/
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}	
	}

	public List<commodity> commodityPage(int supertypeid, int currentPageIndex,
			int countPerPage) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			String sql = "select productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from" +
					"(select rownum as 行号,productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from product where supertypeid=?)" +
					"where 行号>? and 行号<=?";
			PreparedStatement proc = conn.prepareStatement(sql);
			proc.setInt(1, supertypeid);
			proc.setInt(2,(currentPageIndex-1)*countPerPage);
			proc.setInt(3, currentPageIndex*countPerPage);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}	
	}

	public List<commodity> commoditySelectCom(int productid) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from product where productid=?");
			proc.setInt(1, productid);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			rs.next();
			commodity commoditys = new commodity();
			commoditys.setProductid(rs.getInt("productid"));
			commoditys.setProductname(rs.getString("productname").trim());
			commoditys.setSupertypeid(rs.getInt("supertypeid"));
			commoditys.setBrand(rs.getString("brand").trim());
			commoditys.setPicture(rs.getString("picture").trim());
			commoditys.setIntroduce(rs.getString("introduce").trim());
			commoditys.setPrice(rs.getInt("price"));
			commoditys.setNowprice(rs.getInt("nowprice"));
			commoditys.setProducNum(rs.getInt("producNum"));
			commoditys.setIntime(rs.getString("intime").trim());
			commoditys.setStock(rs.getInt("stock"));
			list.add(commoditys);
			return list;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}	
	}

	public List<commodity> commodityShowAll(int supertypeid) {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement("select * from product where supertypeid=?");
			proc.setInt(1, supertypeid);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}	
	}

	public List<commodity> selectCommoditys(String name) {
		try 
		{
			String str="select * from product where productname like '%"+name+"%'";
			Connection conn = getConnectionFactory.getConnection();
			PreparedStatement proc = conn.prepareStatement(str);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}	
	}

	public List<commodity> commoditysTopTen() {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			String sql = "select productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from" +
					"(select rownum as 行号,productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from product order by intime)" +
					"where 行号>0 and 行号<=10";
			PreparedStatement proc = conn.prepareStatement(sql);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}	
	}

	public List<commodity> commoditysTopFive() {
		try 
		{
			Connection conn = getConnectionFactory.getConnection();
			String sql = "select productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from" +
					"(select rownum as 行号,productid,productname,supertypeid,brand,picture,introduce,price,nowprice,producNum,intime,stock from product order by nowprice)" +
					"where 行号>0 and 行号<=5";
			PreparedStatement proc = conn.prepareStatement(sql);
			ResultSet rs = proc.executeQuery();
			List<commodity> list = new ArrayList<commodity>();
			while(rs.next())
			{
				commodity commoditys = new commodity();
				commoditys.setProductid(rs.getInt("productid"));
				commoditys.setProductname(rs.getString("productname").trim());
				commoditys.setSupertypeid(rs.getInt("supertypeid"));
				commoditys.setBrand(rs.getString("brand").trim());
				commoditys.setPicture(rs.getString("picture").trim());
				commoditys.setIntroduce(rs.getString("introduce").trim());
				commoditys.setPrice(rs.getInt("price"));
				commoditys.setNowprice(rs.getInt("nowprice"));
				commoditys.setProducNum(rs.getInt("producNum"));
				commoditys.setIntime(rs.getString("intime").trim());
				commoditys.setStock(rs.getInt("stock"));
				list.add(commoditys);
			}
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}	
	}
}
