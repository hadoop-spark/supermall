<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<link href="style/common.css" rel="stylesheet" type="text/css" />
	<link href="style/top.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" language="javascript" src="resource/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" language="javascript">
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
		$("#arrow").click(function(){
			$("#categorys .mc").toggle();
		});
		//展开商品子分类
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

    <!-- 快捷栏begin -->
<div id="shortcut">
	<div class="l_w">
    	<ul class="fl oh">
        	<li class="fore1 fl"><b></b><a href="javascript: return false;" onclick=''>收藏极目商城</a></li>
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
	<div class="l_w" id="header">
    	<div class="fl" id="logo"><a href="index.jsp"><img src="images/l_logo.gif" /></a></div>
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
                	<a href="shop/page/user/userinfo.jsp">我的极目</a>
                    <b></b>
                </dt>
                <dd>
                	<div class="prompt">
                    	<div class="loading"></div>
                    </div>
                </dd>
            </dl>
        </div>
    </div>
   
    <div class="l_w">
    	<div id="nav">
        	<div class="hover" id="categorys">
            	<div class="mt ld">
                	<h2>
                    	<span>全部商品分类</span>
                        <b id="arrow"></b>
                    </h2>
                </div>
                <div class="mc" id="product-classify">
                	<!-- 列表项循环开始 -->
                	<c:forEach items="${sessionScope.supTypes }" var="supType">
                	<div class="item">
                    	<span>
                        	<h3 class="i-classify">
                            	${supType.typename }
                         	</h3>
                            <s></s>
                        </span>
                        <div class="i-mc">
                        	<div class="subItem">
                            	<ul>
                                	<!-- 子列表项循环开始 -->
                                	<c:if test="${fn:length(supType.subtypes) == 0 }">
                                		<li>暂无</li>
                                	</c:if>
                                	<c:if test="${fn:length(supType.subtypes) > 0 }">
	                                	<c:forEach items="${supType.subtypes }" var="subType">
	                                	<li><a href="shopping/ProductListServlet?subtype=${subType.subtypeid }">${subType.subtypename }</a></li>
	                                	</c:forEach>
                                	</c:if>
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

