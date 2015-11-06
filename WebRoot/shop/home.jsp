<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8080/supermall/">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>极目商城</title> 
	<link href="style/common.css" rel="stylesheet" type="text/css" />
	<link href="style/home.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	
	</style>
	<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" language="javascript">
	
	function selectCAll(commodityClassId)
	{	
		cleanNode(commodityClassId);
		var param = "flag="+"selectComAll"+"&supertypeid="+commodityClassId;
  		$.ajax({
  			type:'POST',
  			dataType:'xml',
  			url:'/supermall/servlet/commodityType',
  			data:param,
  			success:function(xml){
  				   $(xml).find("commodity").each(
  				function(i){  
  					var productid = $(this).children("commodityId").text();
  					var productname = $(this).children("commodityName").text();
					$("#"+commodityClassId).append(
						"<li>"+"<a href='${pageContext.request.contextPath}/servlet/commodityType?flag=selectCom&commodityID="+productid+"' target='_blank'>"+productname+"</a></li>"
					);
  				});
  			}
  		});	
	}
	function cleanNode(commodityClassId)
  	{
  		var s = document.getElementById(commodityClassId);
  		var t = s.childNodes.length;
  		for (var i=0;i<t;i++)
		{
   		 s.removeChild(s.firstChild);
		}	
  	}
	var timer;
	var ms = 300;
	$(document).ready(function(){
		function closeClassify(){
			$("#product-classify .item .i-mc").each(function(){
				$(this).css("display","none");
			});
			$("#product-classify .item span h3").each(function(){
				$(this).removeClass("over").addClass("i-classify");
			});
		}
		//timer = setInterval(closeClassify,ms);
		//展开购物车
		$("#shopping-cart dl").mouseover(function(){
			$(this).children(".cart-dt").removeClass("cart-dt").addClass("cart-dt-over");
			$("#shopping-cart dl dd").css("display","block");
		});	
		$("#shopping-cart dl").mouseleave(function(){
			$(this).children(".cart-dt-over").removeClass("cart-dt-over").addClass("cart-dt");
			$("#shopping-cart dl dd").css("display","none");
		});	
		//展开全部商品分类
		$("#product-classify .item span h3").mouseover(function(){
			clearTimeout(timer);
			$("#product-classify .item .i-mc").each(function(){
				$(this).css("display","none");
			});
			$("#product-classify .item span h3").each(function(){
				$(this).removeClass("over").addClass("i-classify");
			});
			$(this).removeClass("i-classify").addClass("over");
			$(this).parent().next().css("display","block");	
		});
		$("#product-classify .item span h3").mouseout(function(){
			timer = setTimeout(closeClassify,ms);
		});
		$("#product-classify .item .i-mc").mouseover(function(){
			clearTimeout(timer);
		});
		$("#product-classify .item .i-mc").mouseout(function(){
			timer = setTimeout(closeClassify,ms);
		});
		
	});
</script>
  </head>
  
  <body>
    <!-- 快捷栏begin -->
<div id="shortcut">
	<div class="w">
    	<ul class="fl oh">
        	<li class="fore1 fl"><b></b><a href="">收藏极目商城</a></li>
        </ul>
        <ul class="fr oh">
        <c:if test="${sessionScope.user!=null}">
        		<li class="fore1 fl">您好！亲爱的会员<font color="red">${sessionScope.user}</font>,欢迎来到极目商城！<a href="${pageContext.request.contextPath}/servlet/UserServlet?flag=exit">[退出]</a></li>
	        	
	      </c:if>  
	        <c:if test="${sessionScope.user==null}">
	        	<li class="fore1 fl">欢迎来到极目商城！<a href="shop/page/user/login.jsp">[登陆]</a>&nbsp;&nbsp;<a href="shop/page/user/regist.jsp">[免费注册]</a></li>
	      </c:if> 
	      
        	<li class="fore2 fl"><a href="shop/page/user/mycart.jsp">我的极目</a></li>
            <li class="fore2 fl"><a href="shop/page/user/myOrders.jsp">我的订单</a></li>
            <li class="fore2 fl"><a href="">在线客服</a></li>
        </ul>
        <div class="clr"></div>
    </div>
</div>
<!-- 快捷栏end -->
<!-- 头部begin -->
<div id="o-header">
	<div class="w" id="header">
    	<div class="fl" id="logo"><a href="index.jsp"><img src="images/logo.png" /></a></div>
        <div class="fl" id="search">
        	<div class="i-search">
            	<b class="l-border"></b>
                <b class="r-border"></b>
           <form name="selectForm" method="post" action="${pageContext.request.contextPath}/servlet/commodityServlet?flag=selectProc">
            	<div class="form">
                	<input class="text" type="text" name="selectProduct"/>
                    <input class="button" type="submit" value="搜 索" />
                </div>
                </form>
            </div>
            <div id="hotwords">热门搜索：<a>男包</a>&nbsp;&nbsp;<a>女包</a>&nbsp;&nbsp;<a>男装</a>&nbsp;&nbsp;<a>女装</a></div>
        </div>
        <div id="shopping-cart">
        	<dl>
            	<dt id="cart-dt" class="cart-dt">
                	<a href="shop/page/user/mycart.jsp">去购物车结算</a>
                    <b></b>
                </dt>
                <dd>
                	<div class="prompt">
                    	<div class="loading">加载中,请稍后...</div>
                    </div>
                </dd>
            </dl>
        </div>
    </div>
    
    <div class="w">
    	<div id="nav">
        	<div class="hover" id="categorys">
            	<div class="mt ld">
                	<h2>
                    	<a href="index.jsp">全部商品分类</a>
                        <b></b>
                    </h2>
                </div>
                <div class="mc" id="product-classify">
                	<!-- 列表项循环开始 -->
                	<c:forEach items="${requestScope.commodityClass}" var="commodityClass">
                	<div class="item">
                    	<span>
                        	<h3 class="i-classify">
                            	<a href="${pageContext.request.contextPath}/servlet/commodityType?flag=showComs&typeid=${commodityClass.supertypeid}" onmouseover="selectCAll(${commodityClass.supertypeid})" >${commodityClass.typename}</a>
                         	</h3>
                            <s></s>
                        </span>  
                        <div class="i-mc">
                        	<div class="subItem">
                            	<ul id="${commodityClass.supertypeid}">
                                	<!-- 子列表项循环开始 -->
  
                                    <!-- 子列表项循环结束 -->
                                </ul>
                            </div>
                        </div>
                    </div>
                     </c:forEach>            
                    <!-- 列表项结束 -->
                </div>
            </div>
            <div id="nav-r"></div>
            <ul id="navitems">
            	<li class="curr" id="nav-home">
                	<a href="index.jsp">首页</a>
                </li>
                <li id="nav-mall">
                	<a href="index.jsp">服装城</a>
                </li>
                <li id="nav-tuan">
                	<a href="index.jsp">团购</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 头部end -->
<!-- 广告begin -->
<div class="ad w">
	<div class="slide" id="slide">
    	<div class="slide-img">
        	<ul>
            	<!-- 幻灯片列表begin -->
            	
            			<li><a href="index.jsp"><img src="/supermall/images/banner01.jpg" /></a></li>
            	
            			<li class="hid"><a href="index.jsp"><img src="/supermall/images/20121122165756.png" /></a></li>
            	
            			<li class="hid"><a href="index.jsp"><img src="/supermall/images/20121122104216.png" /></a></li>
            	
                <!-- 幻灯片列表end -->
            </ul>
        </div>
        <div class="slide-control">
       		
           			<span class="curr">1</span>
           	
           			<span class="">2</span>
           	
           			<span class="">3</span>
           	
        </div>
    </div>
	<script type="text/javascript" language="javascript">
		var img_count = 3;//图片总数
		var curr_i = 0;//当前图片下标
		var slideTimer;//定时器
		var slide_ms = 4000;//时间间隔
		//替换图片函数
		function slide_replace(curr_control){
			$(".slide .slide-control span").each(function(){
				$(this).removeClass("curr");	
			});
			curr_control.addClass("curr");
			$(".slide .slide-img ul li[class!='hid']").fadeOut(500,function(){
				$(".slide .slide-img ul li[class!='hid']").addClass("hid");
				$($(".slide .slide-img ul li")[curr_i]).show();
				$($(".slide .slide-img ul li")[curr_i]).removeClass();
			});
		}
		//图片轮换函数
		function img_scroll(){
			if(++curr_i >= img_count){
				curr_i = 0;
			}
			slide_replace($($(".slide .slide-control span")[curr_i]));
		}
		//开始效果
		function scroll_start(){
			slideTimer = setInterval(img_scroll,slide_ms);
		}
		//停止效果
		function scroll_stop(){
			clearInterval(slideTimer);
		}
		//幻灯片控制器：鼠标悬停事件
        $(".slide .slide-control span").mouseover(function(){
			scroll_stop();
			var i = $(this).html() - 1;
			if(i != curr_i){
				curr_i = i;
				slide_replace($(this));
		};
		});
		//幻灯片控制器：鼠标移出事件
		$(".slide .slide-control span").mouseout(function(){
			scroll_start();
		});
		//幻灯片图片：鼠标悬停事件
		$(".slide .slide-img ul li").mouseover(function(){
			scroll_stop();
		});
		//幻灯片图片：鼠标移出事件
		$(".slide .slide-img ul li").mouseout(function(){
			scroll_start();
		});
		scroll_start();
    </script>
    <div class="ad_img1"><a href="index.jsp"><img src="images/ad_1.jpg" width="310" height="85" /></a></div>
    <div class="ad_img2"><a href="index.jsp"><img src="images/ad_2.jpg" width="310" height="85" /></a></div>
    <div class="ad_img2"><a href="index.jsp"><img src="images/ad_3.jpg" width="310" height="85" /></a></div>
    <div class="clr"></div>
</div>
<!-- 广告end -->
<div class="w w1">
	<div class="m m2" id="timed">
		<div class="mt">
			<h2><font color="red" style="font-size: 14px">限时抢购</font></h2>
			<div class="extra"></div>
		</div>
		<div class="mc">
			<ul class="lh">
			<c:forEach items="${requestScope.listTopFive}" var="TopFive" varStatus="j">
				<li>
                  <div class="countdown" id="timer36" style="color:blue; font-size:16px; font-weight: bold;">${j.index + 19}:00开始抢哦亲</div>
                  <div class="p-img ld" align="center"><a href='${pageContext.request.contextPath}/servlet/commodityType?flag=selectCom&commodityID=${TopFive.productid}' target="_blank"><img src="${pageContext.request.contextPath}/upload/${TopFive.picture}" width="125" height="125" alt="${TopFive.productname}" /></a></div>
                  <div class="p-name" align="center"><a href='${pageContext.request.contextPath}/servlet/commodityType?flag=selectCom&commodityID=${TopFive.productid}' target="_blank">${TopFive.productname}</a></div>
                  <div class="p-price" align="center" style="color:rgb(204,0,0); font-size:16px; font-weight: bold;">惊爆价：￥<fmt:formatNumber value="${TopFive.nowprice}" pattern=".00"></fmt:formatNumber></div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div><!--timed end-->
	<div class="m ranking">
    	<div class="sm sm3">
        	<div class="smt"><font color="red" style="font-size: 14px">人气排行</font></div>
            <div class="smc">
            	<ul>
            	<c:forEach items="${requestScope.listTopTen}" var="TopTen" varStatus="i">
                	<li>
                    	<span>${i.index + 1}</span>
                        <div class="p-name">
                        	<a href='${pageContext.request.contextPath}/servlet/commodityType?flag=selectCom&commodityID=${TopTen.productid}' target="_blank">${TopTen.productname}</a>
                        </div>
                        <div class="p-price"><strong style="color:rgb(204,0,0); font-weight:bold;">￥<fmt:formatNumber value="${TopTen.nowprice}" pattern=".00"></fmt:formatNumber></div>
                    </li>
                  </c:forEach>

                </ul>
            </div>
        </div>
    </div>
	<!--group end-->
	<span class="clr"></span>
</div>
  </body>
</html>