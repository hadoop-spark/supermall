package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.commodity.commodityDaoImpl;
import com.entity.OrderInfo;
import com.entity.ShoppingItem;
import com.entity.commodity;
import com.service.commodityTypeBiz;

public class productToCart extends HttpServlet {

	private commodityTypeBiz commoditytypebiz=null;
	public productToCart() {
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
		HttpSession session = request.getSession();
		String webRootPath = request.getContextPath();
		
		String flag = request.getParameter("flag");
		
		if(flag.equals("buyPro"))
		{
			Map<Integer,ShoppingItem> cart = (Map<Integer,ShoppingItem>)request.getSession().getAttribute("s_cart");
			if(cart.size()==0)
			{
				response.sendRedirect(webRootPath+"/shop/page/user/mycart.jsp");
//				request.setAttribute("msg", "很抱歉哦亲，您的购物车内还没有添加商品，请先添加商品后再结算！");
//				request.getRequestDispatcher("/shop/page/user/mycart.jsp").forward(request, response);
			}
			else
			{
				float totalPrice = 0;
				Iterator it = cart.values().iterator();
				while(it.hasNext())
				{
					 ShoppingItem shoppingItem = (ShoppingItem)it.next();
					 int buyNum = shoppingItem.getBuyNum();
					 totalPrice += shoppingItem.getProduct().getNowprice()*buyNum;
				}
				session.setAttribute("mycart", cart.values());
				session.setAttribute("totalPrice", totalPrice);
				response.sendRedirect(webRootPath+"/shop/page/shopping/settle_accounts.jsp");
				
//				request.setAttribute("mycart", cart.values());
//				request.setAttribute("totalprice", totalPrice);
//				request.getRequestDispatcher("/shop/page/shopping/settle_accounts.jsp").forward(request, response);
			}
		}
		
		if(flag.equals("deleteCart"))
		{
			String productid = request.getParameter("CId");
			Map<Integer,ShoppingItem> cart = (Map<Integer,ShoppingItem>)request.getSession().getAttribute("s_cart");
//			ShoppingItem item = cart.get(Integer.parseInt(productid));
//			item.setBuyNum(0);
//			cart.remove(item);
			float totalPrice = 0;
			Iterator it = cart.values().iterator();
			while(it.hasNext())
			{
				 ShoppingItem shoppingItem = (ShoppingItem)it.next();
				 if(shoppingItem.getProduct().getProductid()==Integer.parseInt(productid))
				 {
					 cart.get(Integer.parseInt(productid)).setBuyNum(0);
					 it.remove();
				 }
				 int buyNum = shoppingItem.getBuyNum();
				 totalPrice += shoppingItem.getProduct().getNowprice()*buyNum;
			}
			session.setAttribute("totalPrice", totalPrice);
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/xml;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<?xml version='1.0' encoding='UTF-8'?>");
			out.println("<msg>");
			out.println(totalPrice);
			out.println("</msg>");
		}
		
		if(flag.equals("updateCart"))
		{
			String productid = request.getParameter("commodityid");
			String buynum = request.getParameter("buynum");
			Map<Integer,ShoppingItem> cart = (Map<Integer,ShoppingItem>)request.getSession().getAttribute("s_cart");
			ShoppingItem item = cart.get(Integer.parseInt(productid));
			item.setBuyNum(Integer.parseInt(buynum));
			cart.put(Integer.parseInt(productid), item);
			float totalPrice = 0;
			Iterator it = cart.values().iterator();
			while(it.hasNext())
			{
				 ShoppingItem shoppingItem = (ShoppingItem)it.next();
				 int buyNum = shoppingItem.getBuyNum();
				 totalPrice += shoppingItem.getProduct().getNowprice()*buyNum;
			}
			session.setAttribute("totalPrice", totalPrice);
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/xml;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<?xml version='1.0' encoding='UTF-8'?>");
			out.println("<msgs>");
			out.println(totalPrice);
			out.println("</msgs>");
		}
		
		if(flag.equals("buyCommodity"))
		{
			String productid = request.getParameter("comId");
			String buynum = request.getParameter("buyNum");
			Map<Integer,ShoppingItem> cart = (Map<Integer,ShoppingItem>)request.getSession().getAttribute("s_cart");
			if(cart==null)
			{
				cart = new HashMap<Integer,ShoppingItem>();
				session.setAttribute("s_cart", cart);
			}
			ShoppingItem item = cart.get(Integer.parseInt(productid));
			if(item==null)
			{
				List<commodity> list = commoditytypebiz.commoditySelectCom(Integer.parseInt(productid));
				commodity pro = list.get(0);
				
				item = new ShoppingItem();
				item.setProduct(pro);
				item.setBuyNum(Integer.parseInt(buynum));
				
				cart.put(pro.getProductid(), item);
			}
			else
			{
				item.setBuyNum(item.getBuyNum()+Integer.parseInt(buynum));
			}
			
			float totalPrice = 0;
			Iterator it = cart.values().iterator();
			while(it.hasNext())
			{
				 ShoppingItem shoppingItem = (ShoppingItem)it.next();
				 int buyNum = shoppingItem.getBuyNum();
				 totalPrice += shoppingItem.getProduct().getNowprice()*buyNum;
			}
			
			session.setAttribute("cart", cart.values());
			session.setAttribute("totalPrice", totalPrice);
			response.sendRedirect(webRootPath+"/shop/page/user/mycart.jsp");
			
//			request.setAttribute("cart", cart.values());
//			request.setAttribute("totalPrice", totalPrice);
//			request.getRequestDispatcher("/shop/page/user/mycart.jsp").forward(request, response);
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
