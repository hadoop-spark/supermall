package com.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.user.UserDaoImpl;
import com.entity.OrderInfo;
import com.entity.OrderItem;
import com.entity.ShoppingItem;
import com.entity.UserInfo;
import com.service.UserBiz;

public class UserServlet extends HttpServlet {
	
	private UserBiz userBiz = null;
	public UserServlet() {
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
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String webRootPath = request.getContextPath();
		
		String flag = request.getParameter("flag");
		
		if(flag.equals("exit"))
		{
			session.invalidate();
			response.sendRedirect(webRootPath+"/index.jsp");
		}
		
		if(flag.equals("buyOver"))
		{
			String realname = request.getParameter("realname");
			String address = request.getParameter("address");
			String postcode = request.getParameter("postcode");
			String phone = request.getParameter("phone");
			String totalPrice = request.getParameter("totalPrice");
			String username = (String) session.getAttribute("user");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String orderdate = df.format(new Date());
			
			OrderInfo orderInfo = new OrderInfo();
			orderInfo.setUsername(username.trim());
			orderInfo.setRealname(realname.trim());
			orderInfo.setAddress(address.trim());
			orderInfo.setPostcode(postcode.trim());
			orderInfo.setPhone(phone.trim());
			orderInfo.setOrderdate(orderdate.trim());
			orderInfo.setTotalPrice(Integer.parseInt(totalPrice.trim()));
			
			boolean addOrder = userBiz.placeOrder(orderInfo);
						
			Map<Integer,ShoppingItem> cart = (Map<Integer,ShoppingItem>)session.getAttribute("s_cart");
			Iterator it = cart.values().iterator();
			
			int orderid = userBiz.selectSeq();
			boolean addItem = true;
			while(it.hasNext())
			{
				 ShoppingItem shoppingItem = (ShoppingItem)it.next();
				 int productid = shoppingItem.getProduct().getProductid();
				 String productname = shoppingItem.getProduct().getProductname();
				 int nowprice = shoppingItem.getProduct().getNowprice();
				 int productnum = shoppingItem.getBuyNum();
				 
				 OrderItem orderItem = new OrderItem();
				 orderItem.setOrderid(orderid);
				 orderItem.setProductid(productid);
				 orderItem.setProductname(productname);
				 orderItem.setNowprice(nowprice);
				 orderItem.setProductnum(productnum);
				 
				 addItem = userBiz.addOrderItem(orderItem);
				 int stock = userBiz.selectcounts(productid);
				 int newstock = stock - productnum;
				 userBiz.UpdateStock(productid, newstock);
			}
			if(addOrder && addItem)
			{
				session.setAttribute("s_cart", "");
				session.setAttribute("mycart", "");
				session.setAttribute("cart", "");
				session.setAttribute("totalPrice", "");
//				response.sendRedirect(webRootPath+"/servlet/OrderInfoServlet?flag=ShowOrders");
				response.sendRedirect(webRootPath+"/shop/page/user/myOrders.jsp");
			}
		}
		
		if(flag.equals("login"))
		{
			String name = request.getParameter("loginname");
			String password = request.getParameter("loginpwd");
			if(userBiz.loginUser(name, password))
			{
				session.setAttribute("user", name);
				response.sendRedirect(webRootPath+"/index.jsp");
			}
			else
			{
				request.setAttribute("msg","ÓÃ»§Ãû»òÃÜÂë´íÎó£¬µÇÂ¼Ê§°Ü£¡");
				request.getRequestDispatcher("/shop/page/user/login.jsp").forward(request, response);
			}
		}
		
		if(flag.equals("logincode"))
		{
			String code = request.getParameter("LoginCode");
			String randomValidateCode = (String)session.getAttribute("rand");
			if(code.equalsIgnoreCase(randomValidateCode))
			{
				out.print(true);
			}
			else
			{
				out.print(false);
			}
		}
		
		if(flag.equals("reg"))
		{
			String name = request.getParameter("username");
			String password = request.getParameter("pwd");
			String email = request.getParameter("mail");
			UserInfo userInfo = new UserInfo();
			userInfo.setName(name.trim());
			userInfo.setPassword(password.trim());
			userInfo.setEmail(email.trim());
			if(userBiz.regUser(userInfo))
			{
				response.sendRedirect(webRootPath+"/shop/page/user/login.jsp");
			}
			else
			{
				request.setAttribute("msg","×¢²áÊ§°Ü£¡");
				request.getRequestDispatcher("/shop/page/user/regist.jsp").forward(request, response);
			}
		}
		
		if(flag.equals("nameIsExist"))
		{
			String name = request.getParameter("name");
			boolean isExist = userBiz.isExistence(name);
			out.print(isExist);
		}
		
		if(flag.equals("codeIsRight"))
		{
			String code = request.getParameter("code");
			String randomValidateCode = (String)session.getAttribute("rand");
			if(code.equalsIgnoreCase(randomValidateCode))
			{
				out.print(true);
			}
			else
			{
				out.print(false);
			}
		}
	}

	public void init() throws ServletException {
		userBiz = new UserBiz();
		userBiz.setUserDao(new UserDaoImpl());
	}
}
