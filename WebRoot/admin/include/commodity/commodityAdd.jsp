<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=UTF-8"><LINK 
href="<%=basePath %>admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY><BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
<form action="${pageContext.request.contextPath}/servlet/commodityServlet?flag=addComm" method="post" enctype="multipart/form-data">
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TH colSpan=2 height=24>【新增商品】</TH> 
   </TR>
  <TR>
    <TD class=forumrow width="30%" height=24><div align="right">商品名称：</div></TD>
  <TD class=forumrowhighlight width="70%" 
      height=24><input type="text" name="commodityName"></TD></TR>
  <TR>
    <TD class=forumrow height=24><div align="right">商品分类：</div></TD>
    <TD class=forumrowhighlight 
      height=24>
      <select name="commodityClassID">
      
       <c:forEach items="${requestScope.commodityClass}" var="commodityClass">
         <option value="${commodityClass.supertypeid}">
      		 ${commodityClass.typename}
      		</option>
 			</c:forEach>
       
      </select>
      </TD>
  </TR>
  <TR>
    <TD class=forumrow height=24><div align="right">生产厂家：</div></TD>
    <TD class=forumrowhighlight 
      height=24><input type="text" name="manufacturer"></TD>
  </TR>
  <TR>
    <TD class=forumrow height=24><div align="right">商品图片：</div></TD>
    <TD class=forumrowhighlight 
      height=24><input type="file" name="uploadImage"></TD>
  </TR>
  <TR>
    <TD class=forumrow height=24><div align="right">商品描述：</div></TD>
    <TD class=forumrowhighlight 
      height=24><textarea name="commodityDepict" cols="50" rows="5"></textarea></TD>
  </TR>
  <TR>
    <TD class=forumrow height=24><div align="right">商品价格：</div></TD>
    <TD class=forumrowhighlight 
      height=24><input type="text" name="commodityPrice"></TD>
  </TR>
  <TR>
    <TD class=forumrow height=24><div align="right">商品网价格：</div></TD>
    <TD class=forumrowhighlight 
      height=24><input type="text" name="fcPrice"></TD>
  </TR>
  <TR>
    <TD class=forumrow height=24><div align="right">商品总数量：</div></TD>
    <TD class=forumrowhighlight 
      height=24><input type="text" name="commodityAmount"></TD>
  </TR>
  <TR>
    <TD class=forumrow height=24>&nbsp;</TD>
    <TD class=forumrowhighlight 
      height=24><input type="submit" value="提交">
      <input type="reset" value="重置"><font color="red" style="font-size: 12px">${requestScope.msg}</font></TD>
  </TR>
  </TBODY></TABLE>
</form>  
<BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
</BODY></HTML>

