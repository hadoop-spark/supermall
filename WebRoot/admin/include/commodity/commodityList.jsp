<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK 
href="<%=basePath %>admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>
<script type="text/javascript" src="/supermall/js/jquery-1.8.2.js"></script>
<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>
<script type="text/javascript">
  function getcommodityClass()
  {		
    	var supertypeid = document.getElementById("commodityClassId").value;
    	createXHR(supertypeid);
     	cleanNode();
/*    		document.queryForm.action="${pageContext.request.contextPath}/servlet/commodityServlet?flag=bigClass";
   		document.queryForm.submit(); */
  }
  var req;
  function createXHR(supertypeid)
  {
  		if(window.ActiveXObject)
  		{
  			req = new ActiveXObject("Microsoft.XMLHTTP");
  		}
  		else if(window.XMLHttpRequest)
  		{
  			req = new XMLHttpRequest();
  		}
  		req.open("post","${pageContext.request.contextPath}/servlet/commodityServlet?flag=bigClass&supertypeid="+supertypeid,true);
  		req.send();
  		req.onreadystatechange=backfun;
  }
  function backfun()
  {
  		if(req.readyState==4)
  		{
  			if(req.status==200)
  			{
  				var xmlDom = req.responseXML;
  				var product = xmlDom.getElementsByTagName("commodity");
  				var commodity = document.getElementById("commodityId");		
  				for(var i=0;i<product.length;i++)
  				{
  					var productIds = product[i].getElementsByTagName("commodityId");	
  					var productId = productIds[0].childNodes[0].nodeValue;
  					var productNames = product[i].getElementsByTagName("commodityName");	
  					var productName = productNames[0].childNodes[0].nodeValue;
  					var op = document.createElement("option");
  					op.setAttribute("value",productId);
  					var txt = document.createTextNode(productName);
  					op.appendChild(txt);
  					commodity.appendChild(op);
  					commodity.style.width="auto";
  				}
  			}
  		}
  }
  function cleanNode()
  {
  		var commodity = document.getElementById("commodityId");
  		commodity.options.length=1;
  		/* while(commodity.childNodes.length>0)
  		{
  			commodity.removeChild(commodity.childNodes[0]);
  		} */
  }
  function del()
  {
  		var mytable = document.getElementById("tableID");
  		var count = mytable.rows.length;
  		if(count>2)
  		{
  			for(var i=0;i<count-2;i++)
  			{
  				mytable.deleteRow(2);
  			}
  		}
  }
  function findallBycommodityClass()
  {
  		del();
  		var commodityClassId = $("#commodityClassId").val();
  		var param = "flag="+"selectComAll"+"&supertypeid="+commodityClassId;
  		$.ajax({
  			type:'POST',
  			dataType:'xml',
  			url:'/supermall/servlet/commodityServlet',
  			data:param,
  			success:function(xml){
  				   $(xml).find("commodity").each(
  				function(i){  
  				
  					var productid = $(this).children("productid").text();
  					var productname = $(this).children("productname").text();
  					var supertypeid = $(this).children("supertypeid").text();
  					var brand = $(this).children("brand").text();
  					var picture = $(this).children("picture").text();
  					var introduce = $(this).children("introduce").text();
  					var price = $(this).children("price").text();
  					var nowprice = $(this).children("nowprice").text();
  					var producNum = $(this).children("producNum").text();
  					var intime = $(this).children("intime").text();
  					var stock = $(this).children("stock").text();

					$("#tableID").append(
						"<tr align='center'>"+
						"<td class=forumrow>"+productid+"</td>"+
						"<td class=forumrow>"+productname+"</td>"+
						"<td class=forumrow>"+supertypeid+"</td>"+
						"<td class=forumrow>"+brand+"</td>"+
						"<td class=forumrow>"+price+"</td>"+
						"<td class=forumrow>"+nowprice+"</td>"+
						"<td class=forumrow>"+producNum+"</td>"+
						"<td class=forumrow>"+stock+"</td>"+
						"<td class=forumrow>"+"<img src='${pageContext.request.contextPath}/upload/"+picture+"' heigth='50px' width='50px'>"+"</td>"+
						"<td class=forumrow>"+intime+"</td>"+
						"<td class=forumrow>"+"<a href='javaScript:void(0)' onclick='deleteCom("+productid+")'>"+"删除"+"</a>"+"</td>"+
						"</tr>"
					);
  				});
  			}
  		});
  }
  function findallBycommodity()
  {
  		del();
  		var commodityId = $("#commodityId").val();
  		var param = "flag="+"selectCom"+"&productid="+commodityId;
  		$.ajax({
  			type:'POST',
  			dataType:'xml',
  			url:'/supermall/servlet/commodityServlet',
  			data:param,
  			success:function(xml){
  				   $(xml).find("commodity").each(
  				function(i){  
  				
  					var productid = $(this).children("productid").text();
  					var productname = $(this).children("productname").text();
  					var supertypeid = $(this).children("supertypeid").text();
  					var brand = $(this).children("brand").text();
  					var picture = $(this).children("picture").text();
  					var introduce = $(this).children("introduce").text();
  					var price = $(this).children("price").text();
  					var nowprice = $(this).children("nowprice").text();
  					var producNum = $(this).children("producNum").text();
  					var intime = $(this).children("intime").text();
  					var stock = $(this).children("stock").text();
  					
					$("#tableID").append(
						"<tr align='center'>"+
						"<td class=forumrow>"+productid+"</td>"+
						"<td class=forumrow>"+productname+"</td>"+
						"<td class=forumrow>"+supertypeid+"</td>"+
						"<td class=forumrow>"+brand+"</td>"+
						"<td class=forumrow>"+price+"</td>"+
						"<td class=forumrow>"+nowprice+"</td>"+
						"<td class=forumrow>"+producNum+"</td>"+
						"<td class=forumrow>"+stock+"</td>"+
						"<td class=forumrow>"+"<img src='${pageContext.request.contextPath}/upload/"+picture+"' heigth='50px' width='50px'>"+"</td>"+
						"<td class=forumrow>"+intime+"</td>"+
						"<td class=forumrow>"+"</td>"+
						"</tr>"
					);
  				});
  			}
  		});
  }
  function deleteCom(productid)
  {
  		var param = "flag="+"deleteCom"+"&commodityId="+productid;
  		$.ajax({
  			type:'POST',
  			url:'/supermall/servlet/commodityServlet',
  			data:param,
  			success:function(){
  				getcommodityClass();
   				findallBycommodityClass();
   			}
  		});
  }
</script>
<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY><BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
<form id="queryForm" action=""  method="post" name="queryForm">

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 border=0>

  <TBODY>
  <TR>
    <td>选择商品类别:</td>
    	<td>商品类别<select id="commodityClassId" name="commodityClassId" onchange="getcommodityClass()">
							<option value="0">--商品类别--</option>
						  <c:forEach items="${requestScope.commodityClass}" var="commodityClass">
								<option value="${commodityClass.supertypeid}"> ${commodityClass.typename}</option>
						 </c:forEach>
							</select>
	  </td>
	   <td>
	   <input type="button" value="查询商品种类" onclick="findallBycommodityClass()">  
	  </td>
	  <td>
		  商品<select id="commodityId" name="commodityId">
			  <option value="0">--选择商品--</option>
			</select>
	</td>
	 <td>
	   <input type="button" value="查询商品" onclick="findallBycommodity()">  
	</td>
   </TR>
 </table>
  </form>
<TABLE id="tableID" cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 border=0>

   <TR>
    <TH colSpan=10 height=24>【商品列表】</TH> 
   </TR>
    <TR align="center">
    <TD class=forumrow>商品编号</TD>
    <TD class=forumrow>商品名称</TD>
    <TD class=forumrow>商品分类</TD>
    <TD class=forumrow >生产厂家</TD>
    <TD class=forumrow>商品价格</TD>
    <TD class=forumrow>网价格</TD>
    <TD class=forumrow>商品总数量</TD>
     <TD class=forumrow>剩余数量</TD>
    <TD class=forumrow>商品主图</TD>
    <TD class=forumrow>商品上架时间</TD>
    <TD class=forumrow>操作</TD>
  </TR>
<%--   <c:forEach items="${requestScope.commodityList}" var="commoditylist">
  <tr align="center">
  <td class=forumrow>${commoditylist.productid}</td>
  <td class=forumrow>${commoditylist.productname}</td>
  <td class=forumrow>${commoditylist.supertypeid}</td>
  <td class=forumrow>${commoditylist.brand}</td>
  <td class=forumrow>${commoditylist.price}</td>
  <td class=forumrow>${commoditylist.nowprice}</td>
  <td class=forumrow>${commoditylist.producNum}</td>
  <td class=forumrow>${commoditylist.stock}</td>
  <td class=forumrow><img src="${pageContext.request.contextPath}/upload/${commoditylist.picture}" heigth="50px" width="50px"></td>
  <td class=forumrow>${commoditylist.intime}</td>
  <td class=forumrow><font color="red"><a href="${pageContext.request.contextPath}/servlet/commodityServlet?flag=comDelete&commodityId=${commoditylist.productid}">删除</a></font></td>
  </tr>
 </c:forEach>
    <TR>
    <TD class=forumrow height=24 colspan="11" align="center" >
    
    共${requestScope.ProductCount}条记录   共${requestScope.pageCount}页  当前${requestScope.currentPageIndex}页
      
      <c:if test="${requestScope.currentPageIndex==1&&requestScope.pageCount==1}">
      		首页
      </c:if>
      	<c:if test="${requestScope.currentPageIndex==1&&requestScope.pageCount!=1}"> 
                    首页
                                             
          <a href="${pageContext.request.contextPath}/servlet/commodityServlet?flag=comAll&pageIndex=${requestScope.currentPageIndex+1}">下一页</a>
     		</c:if>
     		<c:if test="${requestScope.currentPageIndex!=1&&requestScope.currentPageIndex!=requestScope.pageCount}">
     		<a href="${pageContext.request.contextPath}/servlet/commodityServlet?flag=comAll&pageIndex=${requestScope.currentPageIndex-1}">上一页</a>
     		<a href="${pageContext.request.contextPath}/servlet/commodityServlet?flag=comAll&pageIndex=${requestScope.currentPageIndex+1}">下一页</a>
     		</c:if>
     		<c:if test="${requestScope.currentPageIndex==requestScope.pageCount&&requestScope.currentPageIndex!=1}">  
         <a href="${pageContext.request.contextPath}/servlet/commodityServlet?flag=comAll&pageIndex=${requestScope.currentPageIndex-1}">上一页</a>
         	尾页
         </c:if>       
    
    </TD>
   
  </TR> --%>
  
  </TBODY>
  </TABLE>
 </div>
<BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>


</BODY></HTML>
