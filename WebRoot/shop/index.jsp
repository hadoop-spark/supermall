<<<<<<< .mine
<%-- <%@page import="biz.NoticeService"%>--%>
<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%-- <%@ page import="entity.Customer"%>
<%@ page import="entity.Product"%>
<%@ page import="entity.Notice" %>
<%@ page import="biz.ProdService"%> 
=======
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page contentType="text/html;charset=GBK"%>
>>>>>>> .r37
<%
<<<<<<< .mine
	request.setCharacterEncoding("gb2312"); 
	Customer cust = (Customer) session.getAttribute("cust");
	String custname ="";
	if (cust != null) {
		custname = cust.getCustname();
	}
	
	ProdService prodService=new ProdService();
	List prodList=prodService.getAllProd();
	String count=(String)session.getAttribute("count");
	
	NoticeService noticeService=new NoticeService();
	List noticeList=noticeService.getNotice();
%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>购物网站</title>
		<link href="style/css.css" rel="stylesheet" type="text/css" />
		<link href="style/div.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="box" align="center" style="width: 1200">
			<div id="logo" align="center">
				<a href="index.jsp"><img src="images/1108.gif" width="144" height="28" /></a>
			</div>
			<div id="top_link">
				<%-- <%if(cust != null){ 
					%>
					 您好， <%=custname %> 
					<%
				}else{
				 %> --%>
				 	<a href="login.jsp">登录</a>&nbsp;|&nbsp;<a href="register.jsp">注册</a>
				 <%
				  %>
					 &nbsp;|&nbsp;会员中心&nbsp;|&nbsp;帮助中心
				 <% 
				 %>
				 	&nbsp;|&nbsp;<a href="confirm.jsp">购物车()</a>
				 	&nbsp;|&nbsp;购物车
			</div>
			
			<div id="menu">
				<a href="cosmetics.jsp"><img src="images/1109.gif" width="65" height="15" /></a>
				<a href="bag.jsp"><img src="images/1110.gif" width="65" height="15" /></a>
				<a href="watch.jsp"><img src="images/1111.gif" width="65" height="15" /></a>
				<a href="fashion.jsp"><img src="images/1112.gif" width="65" height="15" /></a>
				<img src="images/1113.gif" width="65" height="15" />
				<img src="images/1114.gif" width="65" height="15" />
				<img src="images/1115.gif" width="65" height="15" />
			</div>
			<div id="main">
				<div id="flash" align="left">
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
						codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
						width="251" height="227">
						<param name="movie" value="images/pop.swf" />
						<param name="quality" value="high" />
						<embed src="images/pop.swf" quality="high"
							pluginspage="http://www.macromedia.com/go/getflashplayer"
							type="application/x-shockwave-flash" width="251" height="227"></embed>
					</object>
				</div>
				<div id="banner">
					<div id="banner1">
						<img src="images/1116.gif" width="570" height="100" />
					</div>
					<div id="banner2">
						<img src="images/1117.gif" width="265" height="78" />
						<img src="images/1118.gif" width="265" height="78" />
					</div>
				</div>
				<div id="line"></div>
				<div id="left">
					<div id="notice_title">
							网站公告<img src="images/1119.gif" width="29" height="5" />
					</div>
					<div id="notice" align="left">
					
						<span><img src="images/1120.gif" width="27" height="14" />&nbsp;tytryrtytry</span>
						<br />
						
					</div>
					<div id="event">
						<img src="images/1122.gif" width="200" height="95" />
						<img src="images/1123.gif" width="200" height="93" />
					</div>
					<div id="time">
						<img src="images/1124.gif" width="188" height="75" />
						<img src="images/1125.gif" width="188" height="98" />
					</div>
					<div id="pic">
						<img src="images/1126.gif" width="200" height="50" />
					</div>
				</div>
				
	</body>
=======
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
	<title>WebQQ</title>
	<link type="text/css" rel="stylesheet" href="<%=path%>/qq/image/qq.css" />
	<script type="text/javascript">var basePath = "<%=path%>";</script>
	<script type="text/javascript" src="<%=path%>/resource/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=path%>/qq/js/common.js"></script>
	<script type="text/javascript" src="<%=path%>/qq/js/qq.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			openFriendPanel();
			setTimeout(openHelpPanel, 7000);
		});
	</script>
</head>

<body>
	<a target="_blank" href="<%=path%>/test.jsp?userId=24">普通用户登录</a>
	<a target="_blank" href="<%=path%>/test.jsp?userId=25">普通用户登录</a>
	<br/>
	<br/>
	<a target="_self" href="<%=path%>/index.jsp?merchantId=2">浏览联想电脑</a>
	<a target="_self" href="<%=path%>/index.jsp">返回首页</a>
	<div id="_friendsPanel" class="friendsPanel" style="display:none;"></div>
	<p style="height:200px;"></p>
	<p style="height:200px;"></p>
	<p style="height:200px;"></p>
	<p style="height:200px;"></p>
	<p style="height:200px;"></p>
</body>
>>>>>>> .r37
</html>
