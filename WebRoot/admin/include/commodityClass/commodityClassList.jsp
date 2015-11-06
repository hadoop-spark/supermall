<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TH colSpan=2 height=24>【商品种类列表】</TH>  </TR>
  <TR>
    <TD class=forumrow width="30%" height=24><div align="center">商品种类编号</div></TD>
  <TD class=forumrowhighlight width="70%" 
      height=24><div align="center">商品种类名称</div></TD>
  </TR>
  <c:forEach items="${commodityClassList}" var="cList">
  <TR>
    <TD class=forumrow height=24><div align="center">${cList.supertypeid}</div></TD>
    <TD class=forumrowhighlight 
      height=24><div align="center">${cList.typename}</div></TD>
    <TD ><a href="${pageContext.request.contextPath}/servlet/commodityClassServlet?flag=cdelete&commodityClassId=${cList.supertypeid}">删除</a> </TD>
  </TR>
 </c:forEach>
  
    <TR>
    <TD class=forumrow height=24 colspan="2" align="center">
             共${requestScope.SupertypeCount}条记录   共${requestScope.pageCount}页  当前${requestScope.currentPageIndex}页
      <c:if test="${requestScope.currentPageIndex==1&&requestScope.pageCount==1}">
      		首页
      </c:if>
      					 <c:if test="${requestScope.currentPageIndex==1&&requestScope.pageCount!=1}"> 
                    首页
                                             
          <a href="${pageContext.request.contextPath}/servlet/commodityClassServlet?flag=selectAll&pageIndex=${requestScope.currentPageIndex+1}"><img src="../admin/images/next.gif" border="0"></a>
     		</c:if>
     		<c:if test="${requestScope.currentPageIndex!=1&&requestScope.currentPageIndex!=requestScope.pageCount}">
     		<a href="${pageContext.request.contextPath}/servlet/commodityClassServlet?flag=selectAll&pageIndex=${requestScope.currentPageIndex-1}"><img src="../admin/images/back.gif" border="0"></a>
     		<a href="${pageContext.request.contextPath}/servlet/commodityClassServlet?flag=selectAll&pageIndex=${requestScope.currentPageIndex+1}"><img src="../admin/images/next.gif" border="0"></a>
     		</c:if>
     		<c:if test="${requestScope.currentPageIndex==requestScope.pageCount&&requestScope.currentPageIndex!=1}">  
         <a href="${pageContext.request.contextPath}/servlet/commodityClassServlet?flag=selectAll&pageIndex=${requestScope.currentPageIndex-1}"><img src="../admin/images/back.gif" border="0"></a>
         	尾页
         </c:if>                     
                
     
                         <%-- <a href="/eShop201388/CommodityClassServlet?flag=list&currpages=${requestScope.currpages-1}"><img src="../admin/images/back.gif" border="0"></a>        
     <a href="/eShop201388/CommodityClassServlet?flag=list&currpages=${requestScope.currpages+1}"><img src="../admin/images/next.gif" border="0"></a> --%>
     
       
    </TD>
  </TR>
  <%-- 
  <TR>
    <TD class=forumrow height=24 colspan="2" align="center">
    
		<a href="findAllCommodityClass.action?currentPage=1">首页</a>
		<a href="findAllCommodityClass.action?currentPage=${currentPage - 1}">上一页</a>
 
	 
		<EM>首页</EM>
		<EM>上一页</EM>
	</s:else>
	 
		<a href=" ">下一页</a>
		<a href=" ">尾页</a>
 
 
		<EM>下一页</EM>
		<EM>尾页</EM>
 
    </TD>
  </TR>
--%>
  </TBODY></TABLE>
<BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
</BODY></HTML>
