<%@ page language="java" import="java.util.*,java.text.*,java.math.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		$(document).ready(function(){
			function checkRealname(){
				$("#realname_msg").html("");
				var rn = $("#realname").val();
				if(rn.length == 0){
					$("#realname_msg").html("请输入收件人姓名");
					$("#realname_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}
			}
			$("#realname").blur(checkRealname);
			
			function checkAddress(){
				$("#address_msg").html("");
				var address = $("#address").val();
				if(address.length == 0){
					$("#address_msg").html("请输入收件地址");
					$("#address_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}
			}
			$("#address").blur(checkAddress);
			
			function checkPostcode(){
				$("#postcode_msg").html("");
				var postcode = $("#postcode").val();
				if(postcode.length == 0){
					$("#postcode_msg").html("请输入邮编");
					$("#postcode_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}	
			}
			$("#postcode").blur(checkPostcode);
			
			function checkPhone(){
				$("#phone_msg").html("");
				var phone = $("#phone").val();
				if(phone.length == 0){
					$("#phone_msg").html("请输入手机号");
					$("#phone_msg").css("color","#ff0000");
					return false;
				} 
				var reg = /^1\d{10}$/;
				if(reg.test(phone)){
					return true;
				}
				$("#phone_msg").html("请输入正确的手机号");
				$("#phone_msg").css("color","#ff0000");
				return false;
			}
			$("#phone").blur(checkPhone);
			$(".info_btn").click(function(){
				var b = checkRealname() & checkAddress() & checkPostcode() & checkPhone();
				if (b) {
					$("#orderInfoForm").attr("action","${pageContext.request.contextPath}/servlet/UserServlet?flag=buyOver"+"&totalPrice="+${sessionScope.totalPrice});
					$("#orderInfoForm")[0].submit();
				}
			});
		});
	</script>
  </head>
  
  <body>
    <%@ include file="../common/top.jsp" %>
    <div class="l_w">
    	<%@ include file="../common/myJM_left.jsp" %>
    	<div class="userinfo_right">
			<div class="o-mt">
		    	<h2>购物结算</h2>
		    </div>
		    <div id="baseinfo">
		    	<div>
	        		<table width="100%" cellpadding="0" cellspacing="0">
	        		<tr>
	        			<th width="20%">商品主图</th>
			            <th width="30%">商品名</th>
			            <th width="20%">极目价</th>
			            <th width="20%">购买数量</th>
	        		</tr>
	        		<c:forEach items="${sessionScope.mycart}" var="item">
	        		<tr>
	        			<td><img src="${pageContext.request.contextPath}/upload/${item.product.picture}" width="50px" height="50px" style="border:0"/></td>
	        			<td class="td_pi">${item.product.productname}</td>
	        			<td>￥<fmt:formatNumber value="${item.product.nowprice}" pattern=".00"></fmt:formatNumber></td>
	        			<td class="td_pn">${item.buyNum}</td>
	        		</tr>
	        		</c:forEach>
	        	</table>
	        	
	        	<div class="cart-total">
	        		<div class="total fr"><span id="cart_total"><fmt:formatNumber value="${sessionScope.totalPrice}" pattern=".00"></fmt:formatNumber></span><span>总计￥：</span></div>
	        	</div>
	        	<div class="info_item">	
	            	<form name="orderInfoForm" id="orderInfoForm" method="post">
	                    <div class="baseinfo_i">
	                    	<span class="label"><em>*</em>收件人姓名:</span>
	                        <div class=""><input name="realname" type="text" id="realname" class="text"" /><span id="realname_msg"></span></div>
	                        <div class="clr"></div>
	                    </div>
	                    <div class="baseinfo_i">
	                    	<span class="label"><em>*</em>收件人地址:</span>
	                        <div class=""><input name="address" type="text" id="address" class="text" /><span id="address_msg"></span></div>
	                        <div class="clr"></div>
	                    </div>
	                    <div class="baseinfo_i">
	                    	<span class="label"><em>*</em>邮编:</span>
	                        <div class=""><input name="postcode" type="text" id="postcode" class="text" /><span id="postcode_msg"></span></div>
	                        <div class="clr"></div>
	                    </div>
	                    <div class="baseinfo_i">
	                    	<span class="label"><em>*</em>手机:</span>
	                        <div class=""><input name="phone" type="text" id="phone" class="text" /><span id="phone_msg"></span></div>
	                        <div class="clr"></div>
	                    </div>
	                    <div class="baseinfo_i">
	                    	<div class="btn_div"><input type="button" class="info_btn" value="提交"/></div>
	                        <div class="clr"></div>
	                    </div>
	                </form>
	            </div>
	            </div>
		    </div>
		</div>
    	<div class="clr"></div>
    </div>
    <%@ include file="../common/foot.jsp" %>
  </body>
</html>
