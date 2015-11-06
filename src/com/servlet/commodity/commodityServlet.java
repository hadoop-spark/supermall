package com.servlet.commodity;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.commodity.commodityDaoImpl;
import com.entity.commodity;
import com.entity.commodityClass;
import com.service.commodityBiz;

public class commodityServlet extends HttpServlet {

	private commodityBiz commoditybiz=null;
	
	public commodityServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		doPost(request,response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String webRootPath = request.getContextPath();
		
		String flag = request.getParameter("flag");
		
		if(flag.equals("selectProc"))
		{
			String proName =request.getParameter("selectProduct");
			List<commodity> list = commoditybiz.selectCommoditys(proName.trim());
			int size = list.size();
			request.setAttribute("showcommoditys", list);
			request.setAttribute("size", size);
			request.getRequestDispatcher("/shop/page/shopping/productlist.jsp").forward(request, response);
		}
		
		if(flag.equals("deleteCom"))
		{
			/*response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/xml;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");*/
			
			String productid =request.getParameter("commodityId");
			commoditybiz.commodityDelete(Integer.parseInt(productid));
			
		/*	PrintWriter out = response.getWriter();
			out.println("<?xml version='1.0' encoding='UTF-8'?>");
			out.println("<msgs>");
			out.println("<msg>");
			out.println("ok");
			out.println("</msg>");
			out.println("</msgs>");*/
		}
		
		if(flag.equals("selectCom"))
		{
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/xml;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			String productid =request.getParameter("productid");
			
			List<commodity> list = commoditybiz.commoditySelectCom(Integer.parseInt(productid.trim()));
			PrintWriter out = response.getWriter();
			out.println("<?xml version='1.0' encoding='UTF-8'?>");
			out.println("<commoditys>");
			for(int i=0;i<list.size();i++)
			{
				commodity commoditys = (commodity)list.get(i);
				out.println("<commodity>");
				
				out.println("<productid>");
				out.println(commoditys.getProductid());
				out.println("</productid>");
				
				out.println("<productname>");
				out.println(commoditys.getProductname());
				out.println("</productname>");
				
				out.println("<supertypeid>");
				out.println(commoditys.getSupertypeid());
				out.println("</supertypeid>");
				
				out.println("<brand>");
				out.println(commoditys.getBrand());
				out.println("</brand>");
				
				out.println("<picture>");
				out.println(commoditys.getPicture());
				out.println("</picture>");
				
				out.println("<introduce>");
				out.println(commoditys.getIntroduce());
				out.println("</introduce>");
				
				out.println("<price>");
				out.println(commoditys.getPrice());
				out.println("</price>");
				
				out.println("<nowprice>");
				out.println(commoditys.getNowprice());
				out.println("</nowprice>");
				
				out.println("<producNum>");
				out.println(commoditys.getProducNum());
				out.println("</producNum>");
				
				out.println("<intime>");
				out.println(commoditys.getIntime());
				out.println("</intime>");
				
				out.println("<stock>");
				out.println(commoditys.getStock());
				out.println("</stock>");
				
				out.println("</commodity>");
			}
			out.println("</commoditys>");
		}
		
		if(flag.equals("selectComAll"))
		{
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/xml;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			String supertypeid = request.getParameter("supertypeid");
			int countPerPage=5;
			int currentPageIndex=1;
			List<commodity> list = commoditybiz.commodityPage(Integer.parseInt(supertypeid.trim()), currentPageIndex, countPerPage);
			PrintWriter out = response.getWriter();
			out.println("<?xml version='1.0' encoding='UTF-8'?>");
			out.println("<commoditys>");
			for(int i=0;i<list.size();i++)
			{
				commodity commoditys = (commodity)list.get(i);
				out.println("<commodity>");
				
				out.println("<productid>");
				out.println(commoditys.getProductid());
				out.println("</productid>");
				
				out.println("<productname>");
				out.println(commoditys.getProductname());
				out.println("</productname>");
				
				out.println("<supertypeid>");
				out.println(commoditys.getSupertypeid());
				out.println("</supertypeid>");
				
				out.println("<brand>");
				out.println(commoditys.getBrand());
				out.println("</brand>");
				
				out.println("<picture>");
				out.println(commoditys.getPicture());
				out.println("</picture>");
				
				out.println("<introduce>");
				out.println(commoditys.getIntroduce());
				out.println("</introduce>");
				
				out.println("<price>");
				out.println(commoditys.getPrice());
				out.println("</price>");
				
				out.println("<nowprice>");
				out.println(commoditys.getNowprice());
				out.println("</nowprice>");
				
				out.println("<producNum>");
				out.println(commoditys.getProducNum());
				out.println("</producNum>");
				
				out.println("<intime>");
				out.println(commoditys.getIntime());
				out.println("</intime>");
				
				out.println("<stock>");
				out.println(commoditys.getStock());
				out.println("</stock>");
				
				out.println("</commodity>");
			}
			out.println("</commoditys>");
		}
		
		if(flag.equals("bigClass"))
		{
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/xml;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			String supertypeid = request.getParameter("supertypeid");
			List<commodity> list = commoditybiz.commoditySelectAll(Integer.parseInt(supertypeid));
			PrintWriter out = response.getWriter();
			out.println("<?xml version='1.0' encoding='UTF-8'?>");
			out.println("<commoditys>");
			for(int i=0;i<list.size();i++)
			{
				commodity commoditys = (commodity)list.get(i);
				out.println("<commodity>");
				
				out.println("<commodityId>");
				out.println(commoditys.getProductid());
				out.println("</commodityId>");
				
				out.println("<commodityName>");
				out.println(commoditys.getProductname());
				out.println("</commodityName>");
				
				out.println("</commodity>");
			}
			out.println("</commoditys>");
		}
		if(flag.equals("comAll"))
		{
			List<commodityClass> list = commoditybiz.commodityClassAll();
			request.setAttribute("commodityClass", list);
			/*int countPerPage=3;
			int ProductCount = commoditybiz.getProductCount();
			int pageCount;
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex==null)
			{
				pageIndex="1";
			}
			int currentPageIndex = Integer.parseInt(pageIndex);
			List<commodity> commodityList = commoditybiz.commodityPage(currentPageIndex, countPerPage);
			
			if(ProductCount%countPerPage==0)
			{
				pageCount=ProductCount/countPerPage;
			}
			else
			{
				pageCount=ProductCount/countPerPage+1;
			}
			
			request.setAttribute("ProductCount", ProductCount);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("commodityList", commodityList);
			request.setAttribute("currentPageIndex", currentPageIndex);*/
			
			request.getRequestDispatcher("/admin/include/commodity/commodityList.jsp").forward(request, response);
			
			
			/*List<commodity> commodityList = commoditybiz.commodityAll();
			request.setAttribute("commodityList", commodityList);
			request.getRequestDispatcher("/admin/include/commodity/commodityList.jsp").forward(request, response);*/
		}
		if(flag.equals("add"))
		{
			List<commodityClass> list = commoditybiz.commodityClassAll();
			request.setAttribute("commodityClass", list);
			request.getRequestDispatcher("/admin/include/commodity/commodityAdd.jsp").forward(request, response);
		}
		/*if(flag.equals("comDelete"))
		{
			String productid = request.getParameter("commodityId");
			commoditybiz.commodityDelete(Integer.parseInt(productid));
			response.sendRedirect(webRootPath+"/servlet/commodityServlet?flag=comAll");
		}*/
		if(flag.equals("addComm"))
		{
			String productname = null;
			int supertypeid = 0;
			String brand = null;
			String introduce = null;
			int price = 0;
			int nowprice = 0;
			int producNum = 0;
			String picture = null;
			
			DiskFileItemFactory factory=new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
//			upload.setSizeMax(100*1024*1024);
			
			try 
			{
				List items=upload.parseRequest(request);
				Iterator it=items.iterator();
				while(it.hasNext())
				{
					FileItem item=(FileItem) it.next();
					if(item.isFormField())
					{
						if(item.getFieldName().equals("commodityName"))
						{
							productname=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}
						if(item.getFieldName().equals("commodityClassID"))
						{
							String commodityClassID=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
							supertypeid = Integer.parseInt(commodityClassID);
						}
						if(item.getFieldName().equals("manufacturer"))
						{
							brand = new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}
						if(item.getFieldName().equals("commodityDepict"))
						{
							introduce=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
						}
						if(item.getFieldName().equals("commodityPrice"))
						{
							String commodityPrice=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
							price = Integer.parseInt(commodityPrice);
						}
						if(item.getFieldName().equals("fcPrice"))
						{
							String fcPrice=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
							nowprice = Integer.parseInt(fcPrice);
						}
						if(item.getFieldName().equals("commodityAmount"))
						{
							String commodityAmount = new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
							producNum = Integer.parseInt(commodityAmount);
						}
					}
					else
					{
//						item.write(new File(this.getServletConfig().getServletContext().getRealPath("/")+"upload\\"+item.getName()));
						item.write(new File(this.getServletConfig().getServletContext().getRealPath("/")+"upload\\"+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+item.getName()));
						picture = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+item.getName();
					}
				}
				
				commodity commoditys=new commodity();
				commoditys.setProductname(productname);
				commoditys.setSupertypeid(supertypeid);
				commoditys.setBrand(brand);
				commoditys.setIntroduce(introduce);
				commoditys.setPrice(price);
				commoditys.setNowprice(nowprice);
				commoditys.setProducNum(producNum);
				commoditys.setStock(producNum);
				commoditys.setPicture(picture);
				
				if(commoditybiz.commodityAdd(commoditys))
				{
					request.setAttribute("msg", "添加成功！");
					request.getRequestDispatcher("/servlet/commodityServlet?flag=add").forward(request, response);
				}
				else
				{
					request.setAttribute("msg", "添加失败！");
					request.getRequestDispatcher("/servlet/commodityServlet?flag=add").forward(request, response);
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		commoditybiz = new commodityBiz();
		commoditybiz.setCommoditydao(new commodityDaoImpl());
	}

}
