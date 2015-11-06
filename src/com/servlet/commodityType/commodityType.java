package com.servlet.commodityType;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.commodity.commodityDaoImpl;
import com.entity.commodity;
import com.entity.commodityClass;
import com.service.commodityBiz;
import com.service.commodityTypeBiz;

public class commodityType extends HttpServlet {

	private commodityTypeBiz commoditytypebiz=null;
	public commodityType() {
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
		
		String flag = request.getParameter("flag");
		
		if(flag.equals("showComs"))
		{
			String supertypeid = request.getParameter("typeid");
			List<commodity> list = commoditytypebiz.commodityShowAll(Integer.parseInt(supertypeid.trim()));
			int size = list.size();
			request.setAttribute("showcommoditys", list);
			request.setAttribute("size", size);
			request.getRequestDispatcher("/shop/page/shopping/productlist.jsp").forward(request, response);
		}
		
		if(flag.equals("selectCom"))
		{
			String productid = request.getParameter("commodityID");
			List<commodity> commoditylist = commoditytypebiz.commoditySelectCom(Integer.parseInt(productid));
			commodity commodityf = commoditylist.get(0);
			request.setAttribute("commodityF", commodityf);
			request.getRequestDispatcher("/shop/page/shopping/productDetail.jsp").forward(request, response);
		}
		if(flag.equals("ctype"))
		{
			List<commodityClass> list = commoditytypebiz.commodityClassAll();
			request.setAttribute("commodityClass", list);
			List<commodity> listTopFive = commoditytypebiz.commoditysTopFive();
			request.setAttribute("listTopFive", listTopFive);
			List<commodity> listTopTen = commoditytypebiz.commoditysTopTen();
			request.setAttribute("listTopTen", listTopTen);
			request.getRequestDispatcher("/shop/home.jsp").forward(request, response);
			
		}
		if(flag.equals("selectComAll"))
		{
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/xml;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			String supertypeid = request.getParameter("supertypeid");
			List<commodity> list = commoditytypebiz.commoditySelectAll(Integer.parseInt(supertypeid));
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
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		commoditytypebiz = new commodityTypeBiz();
		commoditytypebiz.setCommoditydao(new commodityDaoImpl());
	}

}
