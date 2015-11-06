package com.servlet.commodityClass;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.commodity.commodityDaoImpl;
import com.dao.commodityClass.commodityClassDaoImpl;
import com.entity.commodityClass;
import com.service.commodityBiz;
import com.service.commodityClassBiz;

public class commodityClassServlet extends HttpServlet {
	
	private commodityClassBiz commodityclassbiz = null;
	
	/**
	 * Constructor of the object.
	 */
	public commodityClassServlet() {
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
	 * @param commodityclassbiz 
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
//		HttpSession session = request.getSession();
		String typename = request.getParameter("commodityClassName");
		String webRootPath = request.getContextPath();
		
		String flag = request.getParameter("flag");
		if(flag.equals("add"))
		{
			commodityClass commodity=new commodityClass();
			commodity.setTypename(typename);
			if(commodityclassbiz.commodityClassIsRepeat(commodity))
			{
				request.setAttribute("msg", "种类名已存在，添加失败！");
				request.getRequestDispatcher("/admin/include/commodityClass/commodityClassAdd.jsp").forward(request, response);
			}
			else
			{
				if(commodityclassbiz.commodityClassAdd(commodity))
				{
					request.setAttribute("msg", "添加成功！");
					request.getRequestDispatcher("/admin/include/commodityClass/commodityClassAdd.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("msg", "添加失败！");
					request.getRequestDispatcher("/admin/include/commodityClass/commodityClassAdd.jsp").forward(request, response);
				}
			}
		}
		if(flag.equals("selectAll"))
		{
			int countPerPage=5;
			int SupertypeCount = commodityclassbiz.getSupertypeCount();
			int pageCount;
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex==null)
			{
				pageIndex="1";
			}
			int currentPageIndex = Integer.parseInt(pageIndex);
			List<commodityClass> commodityClassList = commodityclassbiz.commodityClassPage(currentPageIndex, countPerPage);
			
			if(SupertypeCount%countPerPage==0)
			{
				pageCount=SupertypeCount/countPerPage;
			}
			else
			{
				pageCount=SupertypeCount/countPerPage+1;
			}
			
			request.setAttribute("SupertypeCount", SupertypeCount);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("commodityClassList", commodityClassList);
			request.setAttribute("currentPageIndex", currentPageIndex);
			
			request.getRequestDispatcher("/admin/include/commodityClass/commodityClassList.jsp").forward(request, response);
			
			/*List<commodityClass> commodityClassList = commodityclassbiz.commodityClassSelectAll();
			request.setAttribute("commodityClassList",commodityClassList);
			request.getRequestDispatcher("/admin/include/commodityClass/commodityClassList.jsp").forward(request, response);*/
		}
		if(flag.equals("cdelete"))
		{
			String supertypeid = request.getParameter("commodityClassId");
			commodityclassbiz.commodityClassDelete(Integer.parseInt(supertypeid));
			response.sendRedirect(webRootPath+"/servlet/commodityClassServlet?flag=selectAll");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		commodityclassbiz = new commodityClassBiz();
		commodityclassbiz.setCommodityclassdao(new commodityClassDaoImpl());
	}
}
