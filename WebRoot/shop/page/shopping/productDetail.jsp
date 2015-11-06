<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'productlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" type="text/css" href="style/base.css" />
	-->
 <link href="/supermall/style/cloud-zoom.css" rel="stylesheet" type="text/css" /> 
	<link href="/supermall/style/common.css" rel="stylesheet" type="text/css" />
	<link href="/supermall/style/details.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
	<script type="text/JavaScript" src="/supermall/js/cloud-zoom.1.0.2.min.js"></script>
	<script type="text/javascript" language="javascript">
	function add()
	{	
		var stock = ${requestScope.commodityF.stock};
		var buynum = new Number($("#buynum").val());
		if(buynum<stock&&buynum>=1)
		{
			$("#buynum").val(buynum+1);
		}
	}
	function reduce()
	{
		var stock = ${requestScope.commodityF.stock};
		var buynum = new Number($("#buynum").val());
		if(buynum>1&&buynum<=stock)
		{
			$("#buynum").val(buynum-1);
		}
	}
	function buyCom(productid)
	{
		var buynum = new Number($("#buynum").val());
		document.myform1.action="${pageContext.request.contextPath}/servlet/productToCart?flag=buyCommodity&comId="+productid+"&buyNum="+buynum;
 		document.myform1.submit();
	}
	</script>
  </head>
  
  <body>
    <%@ include file="../common/o_top.jsp" %>
    <div class="root61">
<div class="w">
	<div id="product-intro" >
		<div id="name">
			<h1>${requestScope.commodityF.productname}</h1>
		</div><!--name end-->
		<div class="clearfix">
			<ul id="summary">
			<li id="summary-grade">
					<div class="dt">商品编号：</div>
					<div class="dd">
						<span class="sa0">${requestScope.commodityF.productid}</span>
					</div>
				</li>
				<li id="summary-grade">
					<div class="dt">品&nbsp;&nbsp;&nbsp;&nbsp;牌：</div>
					<div class="dd">
						<span class="sa0">${requestScope.commodityF.brand}</span>
					</div>
				</li> <!-- 商品品牌-->
				
				<li id="summary-grade">
					<div class="dt">库&nbsp;&nbsp;&nbsp;&nbsp;存：</div>
					<div class="dd">
						<span class="sa0">${requestScope.commodityF.stock}</span>
					</div></li>
                 <li id="summary-price">
					<div class="dt">定&nbsp;&nbsp;&nbsp;&nbsp;价：</div>
					<div class="dd">
						<font style="font-size:14px; color:#666; text-decoration:line-through;">￥<fmt:formatNumber value="${requestScope.commodityF.price}" pattern=".00" ></fmt:formatNumber></font>					
					</div>
				</li>	
                 <li id="summary-price">
					<div class="dt">极&nbsp;目&nbsp;价：</div>
					<div class="dd">
						<strong class="p-price" style="font-size:22px;">￥<fmt:formatNumber value="${requestScope.commodityF.nowprice}" pattern=".00" /></strong>					
					</div>
				</li>	
                <li id="summary-price">
					<div class="dt">为您节省：</div>
					<div class="dd">
						<font class="p-price" style="font-size:14px;">￥<fmt:formatNumber value="${requestScope.commodityF.price-requestScope.commodityF.nowprice}" pattern=".00" /></font>					
					</div>
				</li>			
				<li id="summary-grade">
					<div class="dt">上架时间：</div>
					<div class="dd">
						${requestScope.commodityF.intime}
					</div>
				</li><!-- 商品评分-->			
			</ul><!--summary end-->	<form action="" method="post" name="myform1">	
			<ul id="choose" clstag="shangpin|keycount|product|choose">
				<input type="hidden" id="proid" value="" />			
				<li id="choose-amount">
					<div class="dt">购买数量：</div>
					<div class="dd">
						<div class="wrap-input">
								<a class="btn-reduce" href="javaScript:void(0)" onclick="reduce()">减少数量</a>
								<a class="btn-add" href="javaScript:void(0)" onclick="add()">增加数量</a>
								<input class="text" id="buynum" value="1" class="text"/>
						</div>
					</div>
				</li>		      
				<li id="choose-btns">
					<div id="choose-btn-append"  class="btn">
							<a class="btn-append " id="InitCartUrl" href="javaScript:void(0)" onclick="buyCom(${requestScope.commodityF.productid})">加入购物车<b></b></a>
					</div>
				</li>
			</ul></form><!--choose end-->
			<span class="clr"></span>
		</div>	<!--clearfix end-->	
		<div id="preview">
			<div id="spec-n1">
			<a href="${pageContext.request.contextPath}/upload/${requestScope.commodityF.picture}" class ="cloud-zoom" id="zoom1"
            rel="adjustX: 10, adjustY:-4"> 
				<img width="350" height="350" src="${pageContext.request.contextPath}/upload/${requestScope.commodityF.picture}" alt="${requestScope.commodityF.productname}" style="border:0"/>
			</a> 
			</div>		
		</div><!--preview end-->
	</div><!--product-intro end-->
</div>

<div class="w">
		<div id="product-detail" class="m m1">
			<div class="float-nav-wrap" style="height:31px;">
                <div class="mt" style="height: 31px;">
                    <ul class="tab">
                        <li class="curr"><div href="javascript:;" class="title">商品介绍</div></li>
                    </ul>				
                </div>
            </div><!--float-nav-wrap end-->
            <div class="mc">
              <br/><br/>
                       <div align="center"><font color="blue" style="font-size: 30px">${requestScope.commodityF.introduce}</font><br/><br/><br/><br/>
                        <img width="750" height="750" src="${pageContext.request.contextPath}/upload/${requestScope.commodityF.picture}" alt="${requestScope.commodityF.productname}" style="border:0"/><br/><br/></div>
                    
        	</div>
            <div class="float-nav-wrap" style="height:31px; margin-top:10px;">
                <div class="mt" style="height: 31px;">
                    <ul class="tab">
                        <li class="curr"><div href="javascript:;" class="title">全部评价</div></li>
                    </ul>				
                </div>
       	    </div><!--float-nav-wrap end-->
       	   
       	    <c:forEach items="${requestScope.proCmt }" var="cmt">
            <div class="d_comment">
            	<div class="d_comment_title"><span class="fl user">${cmt.username }：</span><span class="content">${cmt.ctitle }</span><span class="fr date"><fmt:formatDate value="${cmt.cdate }" pattern="yyyy-MM-dd HH:mm"/></div>
                <div style="clear:both"></div>
                <div class="d_comment_content">${cmt.content }</div>
            </div>
            </c:forEach>
		</div><!--product-detail end-->
        
        
</div>
</div>
    <%@ include file="../common/o_foot.jsp" %>
  </body>
</html>
