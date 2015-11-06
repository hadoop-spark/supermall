<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<link href="/supermall/style/common.css" rel="stylesheet" type="text/css" />
<link href="/supermall/style/details.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
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
<div class="root61">
<div class="w">
	<div id="product-intro" >
		<div id="name">
			<h1>${requestScope.commodityF.productname}</h1>
		</div><!--name end-->
		<div class="clearfix">
			<ul id="summary">
				<li id="summary-market"><div class="dt">商品编号：</div><div class="dd"><span>${requestScope.commodityF.productid}</span></div></li>
				<li id="summary-grade">
					<div class="dt">品&nbsp;&nbsp;牌：</div>
					<div class="dd">
						<span class="sa0">${requestScope.commodityF.brand}</span>
					</div>
					
				</li><!-- 商品品牌-->
				<li id="summary-grade">
					<div class="dt">库&nbsp;&nbsp;存：</div>
					<div class="dd">
						<span class="sa0">${requestScope.commodityF.stock}</span>
					</div></li>
                 <li id="summary-price">
					<div class="dt">定&nbsp;&nbsp;价：</div>
					<div class="dd">
						<font style="font-size:14px; color:#666; text-decoration:line-through;">￥${requestScope.commodityF.price}</font>					
					</div>
				</li>	
                 <li id="summary-price">
					<div class="dt">极&nbsp;目&nbsp;价：</div>
					<div class="dd">
						<strong class="p-price" style="font-size:22px;">￥${requestScope.commodityF.nowprice}</strong>					
					</div>
				</li>	
                <li id="summary-price">
					<div class="dt">为您节省：</div>
					<div class="dd">
						<font class="p-price" style="font-size:14px;">￥${requestScope.commodityF.price-requestScope.commodityF.nowprice}</font>					
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
 				<img width="350" height="350" src="http://img14.360buyimg.com/n1/g8/M03/09/0C/rBEHaFCA-4sIAAAAAAMH8gGkhTQAAB1cwC_URwAAwgK794.jpg" alt="夏普(SHARP) LCD-32NX115A 32英寸 LED液晶电视（黑色）"/> 
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
           
               <ul class="detail-list">
                        <li>商品名称：${requestScope.commodityF.productname}</li>
                        <li>商品编号：${requestScope.commodityF.productid}</li>
                        <li>品牌：${requestScope.commodityF.brand}</li>
                        <li>上架时间：${requestScope.commodityF.intime}</li>
                </ul> 
               	  商品描述：${requestScope.commodityF.introduce}
        	</div>
            <div class="float-nav-wrap" style="height:31px; margin-top:10px;">
                <div class="mt" style="height: 31px;">
                    <ul class="tab">
                        <li class="curr"><div href="javascript:;" class="title">全部评价</div></li>
                    </ul>				
                </div>
       	    </div><!--float-nav-wrap end-->
            <div class="d_comment">
            	<div class="d_comment_title"><span class="fl user">小乖乖说：</span><span class="content">这个产品还不错喔。</span><span class="fr date">2012-12-23&nbsp;&nbsp;56:45</span></div>
                
            </div>
		</div><!--product-detail end-->
        
        
</div>
</div>
</body>
</html>