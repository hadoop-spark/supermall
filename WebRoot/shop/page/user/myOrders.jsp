<%@ page language="java" import="java.util.*,java.text.*,java.math.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<link href="style/OrderInfo.css" rel="stylesheet" type="text/css" />
	<link href="style/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function(){
		var param = "flag="+"ShowOrders";
			$.ajax({
  			type:'POST',
  			dataType:'html',
  			url:'/supermall/servlet/OrderInfoServlet',
  			data:param,
  			success:function(data){
  			$("#orderInfos").html(data);
  			}
  		});	
		});
	</script>
  </head>
  
  <body>
    <%@ include file="../common/top.jsp" %>
    <div class="l_w">
    	<%@ include file="../common/myJM_left.jsp" %>
    	<div class="OrderInfo_right">
			<div class="o-mt">
		    	<h2>我的订单</h2>
		    </div>
		   
		    <div id="baseinfo">
		    	<div id="orderInfos">
		    	
		        	<%-- <table width="100%" cellpadding="0" cellspacing="0">
		        		<tr>
		        			<th width="8%">订单编号</th>
				            <th width="22%">订单商品</th>
				            <th width="10%">收货人</th>
				            <th width="10%">单价</th>
				            <th width="10%">数量</th>
				            <th width="10%">订单金额</th>
				            <th width="10%">下单时间</th>
				            <th width="10%">订单状态</th>
				            <th width="10%">操作</th>
		        		</tr>
		        		<c:if test="${requestScope.orders != null }">
		        		<c:forEach items="${requestScope.orders }" var="order">
		        		<tr>
		        			<td rowspan="${fn:length(order.items) }">${order.orderid }</td>
		        			<c:forEach items="${order.items }" var="item" varStatus="i_index">
		        			<c:if test="${i_index.count > 1 }">
		        				</tr><tr>
		        			</c:if>
		        			<td><a href="page/shopping/productDetail.jsp?proid=${item.productid }">${item.productname }</a></td>
		        			<td>${order.realname }</td>
		        			<td><span style="color:rgb(204,0,0); font-weight: bold;">￥</span></td>
		        			<td><span style="color:rgb(204,0,0); font-weight: bold;">${item.productnum }</span>个</td>
		        			<td><span style="color:rgb(204,0,0); font-weight: bold;">￥</span></td>
		        			<td><fmt:formatDate value="${order.orderdate }" pattern="yyyy-MM-dd"/></td>
		        			<c:choose>
		        				<c:when test="${order.flag == 0 }">
		        				<td>未发货</td>
		        				</c:when>
		        				<c:when test="${order.flag == 1 }">
		        				<td>处理中</td>
		        				</c:when>
		        				<c:when test="${order.flag == 2 }">
		        				<td>成功</td>
		        				</c:when>
		        				<c:when test="${order.flag == 3 }">
		        				<td>失败</td>
		        				</c:when>
		        			</c:choose>
		        			<td>
		        				<c:if test="${order.flag == 2 }"><a href="page/user/comment.jsp?proid=${item.productid }">发表评论</a></c:if>
		        				<c:if test="${order.flag != 2 }">交易成功后才允许评论</c:if>
		        			</td>
		        			</c:forEach>
		        		</tr>
		        		</c:forEach>
		        		</c:if>
		        	</table> --%>
		        </div>
		    </div>
		</div>
    	<div class="clr"></div>
    </div>
    <%@ include file="../common/foot.jsp" %>
  </body>
</html>
