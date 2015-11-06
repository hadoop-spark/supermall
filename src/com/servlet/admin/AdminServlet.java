package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.admin.AdminDaoImpl;
import com.service.AdminBiz;

public class AdminServlet extends HttpServlet {

	private AdminBiz adminBiz = null;
	public AdminServlet() {
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
		
		if(flag.equals("AdminLogin"))
		{
			String name = request.getParameter("username");
			String password = request.getParameter("password");
			if(adminBiz.loginAdmin(name.trim(), password.trim()))
			{
				session.setAttribute("admin", name);
				response.sendRedirect(webRootPath+"/admin/index.jsp");
			}
			else
			{
				response.sendRedirect(webRootPath+"/error.jsp");
			}
		}
		
		if(flag.equals("exit"))
		{
			session.invalidate();
			response.sendRedirect(webRootPath+"/index.jsp");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		adminBiz = new AdminBiz();
		adminBiz.setAdminDao(new AdminDaoImpl());
	}

}
