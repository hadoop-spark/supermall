package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.OrderInfo.OrderInfoDaoImpl;
import com.entity.OrderInfo;
import com.entity.OrderInfoItem;
import com.entity.OrderItem;
import com.entity.ShoppingItem;
import com.service.OrderInfoBiz;

public class OrderInfoServlet extends HttpServlet {
	
	private OrderInfoBiz orderInfoBiz=null;
	public OrderInfoServlet() {       
		super();
	}
	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String webRootPath = request.getContextPath();
		PrintWriter out = response.getWriter();
		
		String flag = request.getParameter("flag");
			
		if(flag.equals("ShowOrders"))
		{
			String name = (String) session.getAttribute("user");
			List orderids = orderInfoBiz.selectOrderids(name);
			Iterator it = orderids.iterator();
			Map<Integer,OrderInfoItem> orders = null;
			List list = new ArrayList();
			
			while(it.hasNext())
			{
				orders = new HashMap<Integer,OrderInfoItem>();
				int orderid = (int) it.next();
				OrderInfoItem item = orders.get(orderid);
				if(item==null)
				{
					item = new OrderInfoItem();
					OrderInfo oio = orderInfoBiz.selectOrderInfo(orderid);
					item.setOrderInfo(oio);
					List<OrderItem> listOrderItems = orderInfoBiz.selectOrderItems(orderid);
					item.setOrderItem(listOrderItems);
					orders.put(orderid,item);
				}
				list.add(orders);
			}
			
			out.println("<table border='1' width='800px' align='center'>");
			out.println("<tr>");
			out.println("<td align='center' valign='middle' width='10%'>¶©µ¥±àºÅ</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÉÌÆ·ID</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÉÌÆ·Ãû</td>");
			out.println("<td align='center' valign='middle' width='10%'>µ¥¼Û</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÊýÁ¿</td>");
			out.println("<td align='center' valign='middle' width='10%'>×Ü¼Û</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÏÂµ¥Ê±¼ä</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÊÕ¼þÈËÐÅÏ¢</td>");
			out.println("<td align='center' valign='middle' width='10%'>¶©µ¥×´Ì¬</td>");
			out.println("<td align='center' valign='middle' width='10%'>²Ù×÷</td>");
			out.println("</tr>");
			
			Iterator itor = list.iterator();
			
			while(itor.hasNext())
			{
				Map<Integer,OrderInfoItem> m = (Map<Integer, OrderInfoItem>) itor.next();
				
				Iterator x = m.values().iterator();
				

				while(x.hasNext())
				{
					OrderInfoItem oo = (OrderInfoItem) x.next();
					
					out.println("<tr>");
					out.println("<td align='center'>");
					out.println(oo.getOrderInfo().getOrderid());
					out.println("</td>");
					out.println("<td colspan='4'>");
					out.println("<table border='0' width='100%' align='center'>");
									
					Iterator o = oo.getOrderItem().iterator();
					while(o.hasNext())
					{
						OrderItem hh = (OrderItem) o.next();
						
						out.println("<tr>"); 	
						out.println("<td width='10%' align='center'>");
						out.println(hh.getProductid());
						out.println("</td>");
						out.println("<td width='70%' align='center'>");
						out.println(hh.getProductname());
						out.println("</td>");
						out.println("<td width='10%' align='center'>");
						out.println(hh.getNowprice());
						out.println("</td>");
						out.println("<td width='10%' align='center'>");
						out.println(hh.getProductnum());
						out.println("</td>");
						out.println("</tr>");	
						
					}
					out.println("</table>");
					
					out.println("</td>");
					out.println("<td align='center'>");
					out.println(oo.getOrderInfo().getTotalPrice());
					out.println("</td>");
					out.println("<td align='center'>");
					out.println(oo.getOrderInfo().getOrderdate());
					out.println("</td>");
					out.println("<td>");
					out.println("<font color='red' style='font-size: 12px'>");
					out.println(oo.getOrderInfo().getRealname()+","+oo.getOrderInfo().getAddress()+","+oo.getOrderInfo().getPhone()+","+oo.getOrderInfo().getPostcode()+","+"»áÔ±Ãû£º"+oo.getOrderInfo().getUsername());
					out.println("</font>");
					out.println("</td>");
					out.println("<c:choose>");
					out.println("<c:when test='${"+ oo.getOrderInfo().getFlag() == 0 +"}'>");
					out.println("<td align='center'>");
					out.println("Î´·¢»õ");
					out.println("</td>");
					out.println("</c:when>");
		
					out.println("</c:choose>");
					out.println("<td align='center'>&nbsp;</td>");
				}
			}
			out.println("</tr>");
			out.println("</table>");
//			session.setAttribute("ordersList",list);
//			response.sendRedirect(webRootPath+"/shop/page/user/myOrders.jsp");
		}
		
		if(flag.equals("ShowAllOrders"))
		{
			List orderidss = orderInfoBiz.selectAllOrderids();
			Iterator it = orderidss.iterator();
			Map<Integer,OrderInfoItem> orderss = null;
			List list = new ArrayList();
			
			while(it.hasNext())
			{
				orderss = new HashMap<Integer,OrderInfoItem>();
				int orderid = (int) it.next();
				OrderInfoItem item = orderss.get(orderid);
				if(item==null)
				{
					item = new OrderInfoItem();
					OrderInfo oio = orderInfoBiz.selectOrderInfo(orderid);
					item.setOrderInfo(oio);
					List<OrderItem> listOrderItems = orderInfoBiz.selectOrderItems(orderid);
					item.setOrderItem(listOrderItems);
					orderss.put(orderid,item);
				}
				list.add(orderss);
			}
			
			out.println("<table border='1' width='800px' align='center'>");
			out.println("<tr>");
			out.println("<td align='center' valign='middle' width='10%'>¶©µ¥±àºÅ</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÉÌÆ·ID</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÉÌÆ·Ãû</td>");
			out.println("<td align='center' valign='middle' width='10%'>µ¥¼Û</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÊýÁ¿</td>");
			out.println("<td align='center' valign='middle' width='10%'>×Ü¼Û</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÏÂµ¥Ê±¼ä</td>");
			out.println("<td align='center' valign='middle' width='10%'>ÊÕ¼þÈËÐÅÏ¢</td>");
			out.println("<td align='center' valign='middle' width='10%'>¶©µ¥×´Ì¬</td>");
			out.println("<td align='center' valign='middle' width='10%'>²Ù×÷</td>");
			out.println("</tr>");
			
			Iterator itor = list.iterator();
			
			while(itor.hasNext())
			{
				Map<Integer,OrderInfoItem> m = (Map<Integer, OrderInfoItem>) itor.next();
				
				Iterator x = m.values().iterator();
				

				while(x.hasNext())
				{
					OrderInfoItem oo = (OrderInfoItem) x.next();
					
					out.println("<tr>");
					out.println("<td align='center'>");
					out.println(oo.getOrderInfo().getOrderid());
					out.println("</td>");
					out.println("<td colspan='4'>");
					out.println("<table border='0' width='100%' align='center'>");
									
					Iterator o = oo.getOrderItem().iterator();
					while(o.hasNext())
					{
						OrderItem hh = (OrderItem) o.next();
						
						out.println("<tr>"); 	
						out.println("<td width='10%' align='center'>");
						out.println(hh.getProductid());
						out.println("</td>");
						out.println("<td width='70%' align='center'>");
						out.println(hh.getProductname());
						out.println("</td>");
						out.println("<td width='10%' align='center'>");
						out.println(hh.getNowprice());
						out.println("</td>");
						out.println("<td width='10%' align='center'>");
						out.println(hh.getProductnum());
						out.println("</td>");
						out.println("</tr>");	
						
					}
					out.println("</table>");
					
					out.println("</td>");
					out.println("<td align='center'>");
					out.println(oo.getOrderInfo().getTotalPrice());
					out.println("</td>");
					out.println("<td align='center'>");
					out.println(oo.getOrderInfo().getOrderdate());
					out.println("</td>");
					out.println("<td>");
					out.println("<font color='red' style='font-size: 12px'>");
					out.println(oo.getOrderInfo().getRealname()+","+oo.getOrderInfo().getAddress()+","+oo.getOrderInfo().getPhone()+","+oo.getOrderInfo().getPostcode()+","+"»áÔ±Ãû£º"+oo.getOrderInfo().getUsername());
					out.println("</font>");
					out.println("</td>");
					out.println("<c:choose>");
					out.println("<c:when test='${"+ oo.getOrderInfo().getFlag() == 0 +"}'>");
					out.println("<td align='center'>");
					out.println("Î´·¢»õ");
					out.println("</td>");
					out.println("</c:when>");kb
					out.println("</c:choose>");
					out.println("<td align='center'><a href='javascript:' onclick='send("+oo.getOrderInfo().getOrderid()+")'>µã»÷·¢»õ</></td>");
				}
			}
			out.println("</tr>");
			out.println("</table>");
//			session.setAttribute("ordersList",list);
//			response.sendRedirect(webRootPath+"/shop/page/user/myOrders.jsp");
		}
		/*if(flag.equals("changeO"))
		{
			String id = request.getParameter("id");
			orderInfoBiz.change(1,Integer.parseInt(id));
		}*/
	}

	public void init() throws ServletException {
		orderInfoBiz = new OrderInfoBiz();
		orderInfoBiz.setOrderInfoDao(new OrderInfoDaoImpl());
	}
}
