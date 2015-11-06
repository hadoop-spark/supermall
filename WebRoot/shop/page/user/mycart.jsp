<%@ page language="java" import="java.util.*,java.text.*,java.math.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_password.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="/supermall/style/userinfo.css" rel="stylesheet" type="text/css" />
	<link href="/supermall/style/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" language="javascript">
		var totalPrice;
 		totalPrice=${sessionScope.totalPrice};
		/* function del()
		{
			document.getElementById("to_Prices").innerHTML="";
		} */
		function reduce(productid,stock)
		{	
// 			del();
			var buynum;
			buynum = new Number($("#pronum_"+productid).val());
			if(buynum>1&&buynum<=stock)
			{
				$("#pronum_"+productid).val(buynum-1);
				buyNum = new Number($("#pronum_"+productid).val());
				var param = "flag="+"updateCart"+"&buynum="+buyNum+"&commodityid="+productid;
				$.ajax({
  				type:'POST',
  				dataType:'xml',
  				url:'/supermall/servlet/productToCart',
  				data:param,
  					success:function(xml){
  				  totalPrice = new Number($(xml).find("msgs").text());
//   				  document.getElementById("to_Prices").innerHTML="<div class='total fr'><span id='cart_total'>"+totalPrice+".00</span><span>总计￥：</span></div>";
					document.getElementById("cart_total").innerHTML=totalPrice+".00";
  				}
  			});
			}
			else
			{
// 				document.getElementById("to_Prices").innerHTML="<div class='total fr'><span id='cart_total'>"+totalPrice+".00</span><span>总计￥：</span></div>";
				document.getElementById("cart_total").innerHTML=totalPrice+".00";
			}
		}
		function add(productid,stock)
		{	
// 			del();
			var buynum;
			buynum = new Number($("#pronum_"+productid).val());
			if(buynum<stock&&buynum>=1)
			{
				$("#pronum_"+productid).val(buynum+1);
				buyNum = new Number($("#pronum_"+productid).val());
				var param = "flag="+"updateCart"+"&buynum="+buyNum+"&commodityid="+productid;
				$.ajax({
  					type:'POST',
  					dataType:'xml',
  					url:'/supermall/servlet/productToCart',
  					data:param,
  					success:function(xml){
  				  totalPrice = new Number($(xml).find("msgs").text());
//   				  document.getElementById("to_Prices").innerHTML="<div class='total fr'><span id='cart_total'>"+totalPrice+".00</span><span>总计￥：</span></div>";
						document.getElementById("cart_total").innerHTML=totalPrice+".00";
  				 }
  				});
			}
			else
			{
				document.getElementById("cart_total").innerHTML=totalPrice+".00";
// 				document.getElementById("to_Prices").innerHTML="<div class='total fr'><span id='cart_total'>"+totalPrice+".00</span><span>总计￥：</span></div>";
			}
		}
		function deleteC(productid)
		{
// 			del();
			var param = "flag="+"deleteCart"+"&CId="+productid;
			$.ajax({
  					type:'POST',
   					dataType:'xml',
  					url:'/supermall/servlet/productToCart',
  					data:param,
  					success:function(xml){
  					
  				  	totalPrice = new Number($(xml).find("msg").text());
//   				  document.getElementById("to_Prices").innerHTML="<div class='total fr'><span id='cart_total'>"+totalPrice+".00</span><span>总计￥：</span></div>";
 					document.getElementById("cart_total").innerHTML=totalPrice+".00";
  				  var rowid = document.getElementById(productid).rowIndex;
  				  var mytable = document.getElementById("mytable1");
  				  mytable.deleteRow(rowid);
  				 }
  				});
		}
		function buyPro()
		{
  			document.myform1.action="${pageContext.request.contextPath}/servlet/productToCart?flag=buyPro";
   			document.myform1.submit();
		}
	</script>
  </head>
  
  <body>
    <%@ include file="../common/top.jsp" %>
    <div class="l_w">
    	<%@ include file="../common/myJM_left.jsp" %>
    	<div class="userinfo_right">
			<div class="o-mt">
		    	<h2>我的购物车</h2>
		    </div>
		    <div id="baseinfo">
		    	<div><form action="" method="post" name="myform1">
		        	<table width="100%" cellpadding="0" cellspacing="0" id="mytable1">
		        		<tr>
		        			<th width="15%">商品主图</th>
				            <th width="25%">商品名</th>
				            <th width="10%">剩余库存</th>
				            <th width="20%">极目价</th>
				            <th width="20%">购买数量</th>
				            <th width="10%">操作</th>
		        		</tr>
		        		<c:forEach items="${sessionScope.cart}" var="item">
		        		<tr id="${item.product.productid}">
		        		<td><img src="${pageContext.request.contextPath}/upload/${item.product.picture}" width="50px" height="50px" style="border:0"/></td>
		        			<td class="td_pi">${item.product.productname}<input class="txt_pi" type="hidden" id="proid" value="${item.product.productname}" /></td>
		        			<td>${item.product.stock}</td>
		        			<td>￥<fmt:formatNumber value="${item.product.nowprice}" pattern=".00"></fmt:formatNumber></td>
		        			<td class="td_pn">
		        				<div id="jm_numDiv" class="jm_numDiv"><a id="link_reduce" class="link_reduce" href="javaScript:void(0)" onclick="reduce(${item.product.productid},${item.product.stock})">-</a>
		        				<input id="pronum_${item.product.productid}" class="pronum" type="text" value="${item.buyNum}" style=""/>
		        				<a id="link_add" class="link_add" href="javaScript:void(0)" onclick="add(${item.product.productid},${item.product.stock})">+</a></div>
		        			</td>
		        			<td><a class="link_del"  href="javaScript:void(0)" onclick="deleteC(${item.product.productid})">删除</a></td>
		        		</tr>
		        		</c:forEach>
		        	</table>
		        	
		
		        	<div class="cart-total" id="to_Prices">
		        		<div class="total fr" id="to_Price"><span id="cart_total"><fmt:formatNumber value="${sessionScope.totalPrice}" pattern=".00"></fmt:formatNumber></span><span>总计￥：</span></div>
		        		<div class="total fr" id="to_Price2"></div>
		        	</div>		        	
		        	<div class="cart-button">
						<a class="continue" href="index.jsp" id="continue"><span class="btn-text" >继续购物</span></a>
						<div align="center"><font color="red" style="font-size: 12px">${sessionScope.msg}</font></div>
						<a class="checkout" href="javaScript:void(0)" id="toSettlement" onclick="buyPro()">去结算</a>
					</div>
					</form>
		        </div>
		    </div>
		</div>
    	<div class="clr"></div>
    </div>
    <%@ include file="../common/foot.jsp" %>
  </body>
</html>
