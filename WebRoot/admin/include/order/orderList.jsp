<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'orderList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function(){
		var param = "flag="+"ShowAllOrders";
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
		
		/*  function send(orderid)
		{
			document.myform1.action="/supermall/servlet/OrderInfoServlet?flag=changeO&id="+orderid;
			document.myform1.submit();
		} */
	</script>
  </head>
  
  <body bgcolor="#ffffff">
  <form action="" method="post" name="myform1">
   <div id="orderInfos" align="center"></div>
  </body>
  </form>
</html>
