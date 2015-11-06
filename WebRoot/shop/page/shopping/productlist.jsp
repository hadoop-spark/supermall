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
<!-- 	 <link href="/supermall/style/cloud-zoom.css" rel="stylesheet" type="text/css" />  -->
	<link rel="stylesheet" type="text/css" href="/supermall/style/20120920.css"/>
	<link rel="stylesheet" type="text/css" href="/supermall/style/pop_compare.css" />
	<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" language="javascript" src="/supermall/js/json.js"></script>
<!-- 	<script type="text/JavaScript" src="/supermall/js/cloud-zoom.1.0.2.min.js"></script> -->
	<script type="text/javascript" language="javascript">
		$(document).ready(function(){
			var _attr = <%=request.getAttribute("attrItems")%>;
			//点击属性链接
			$("a[name='attrItem']").click(function(){
				var attrName = $(this).attr("id");
				var attrId = attrName.split("_")[0];
				var attrValue = attrName.split("_")[1];
				_attr[attrId] = attrValue;
				var json_str = JSON.stringify(_attr);
				$("input[name='attrItems']").val(json_str);
				$("form#attrForm")[0].submit();
			});
			//点击排序链接
			$("a[name='l_sort']").click(function(){
				var s = $(this).attr("txt");
				var json_str = JSON.stringify(_attr);
				$("input[name='attrItems']").val(json_str);
				$("input[name='sort']").val(s);
				$("form#attrForm")[0].submit();
			});
			//点击上一页链接
			$("a[name='prev_page']").click(function(){
				var curr_page = $("input[name='pagin']").val();
				if (curr_page <= 1) {
					curr_page = 1;
				} else {
					curr_page--;
				}
				$("input[name='pagin']").val(curr_page);
				$("form#attrForm")[0].submit();
			});
			//点击下一页链接
			$("a[name='next_page']").click(function(){
				var curr_page = $("input[name='pagin']").val();
				var page_count = $("input[name='pageCount']").val();
				if (curr_page >= page_count) {
					curr_page = page_count;
				} else {
					curr_page++;
				}
				$("input[name='pagin']").val(curr_page);
				$("form#attrForm")[0].submit();
			});
		});
	</script>
  </head>
  
  <body>
    <%@ include file="../common/o_top.jsp" %>
    <div class="w">
	<div class="w main">
		<div class="right-extra">			
            <form id="attrForm" action="shopping/ProductListServlet" method="post">
            	<input name="attrItems" type="hidden"/>
            	<input name="subtype" type="hidden" value="${requestScope.curr_subType.subtypeid }"/>
            	<input name="sort" type="hidden" value="${requestScope.sort }"/>
            	<input name="pagin" type="hidden" value="${requestScope.pagin }"/>
            	<input name="pageCount" type="hidden" value="${requestScope.pageCount }"/>
            </form>
			<div id="select" class="m">
                <div class="mt">
                	<c:if test="${requestScope.curr_subType != null }">
                	<h1>${requestScope.curr_subType.subtypename }</h1><strong>&nbsp;-&nbsp;商品筛选</strong>
                	</c:if>
                </div>
                <c:forEach items="${requestScope.attrs }" var="attr">
               
                <dl>
                	<dt>${attr.attrname }</dt>
                    <dd>
                    	<div rel='0'>
                    	
                    	</div>
                    	
	                        	<div rel='0'><a name="attrItem" id="" href="javascript:return false;" class="curr" ></a></div>
	                        
	                        	<div rel='0'><a name="attrItem" id="" href="javascript:return false;" ></a></div>
	                       
                    </dd>
                </dl>
                </c:forEach>
                <!-- 
                <dl  >
                	<dt>价格：</dt>
                    <dd>
                    	<div rel='0'><a id="0" href='652-653-655-0-0-0-0-0-0-0-1-1-1.html' class="curr">不限</a></div>
                        <div rel='0'><a id="8864" href='652-653-655-0-0-8864-0-0-0-0-1-1-1.html' >1-499</a></div>
                        <div rel='0'><a id="8865" href='652-653-655-0-0-8865-0-0-0-0-1-1-1.html' >500-999</a></div>
                        <div rel='0'><a id="8866" href='652-653-655-0-0-8866-0-0-0-0-1-1-1.html' >1000-1999</a></div>
                        <div rel='0'><a id="8867" href='652-653-655-0-0-8867-0-0-0-0-1-1-1.html' >2000-2999</a></div>
                        <div rel='0'><a id="8875" href='652-653-655-0-0-8875-0-0-0-0-1-1-1.html' >3000-3999</a></div>
                        <div rel='0'><a id="100295" href='652-653-655-0-0-100295-0-0-0-0-1-1-1.html' >4000-4999</a></div>
                        <div rel='0'><a id="10999" href='652-653-655-0-0-10999-0-0-0-0-1-1-1.html' >5000以上</a></div>
                    </dd>
                </dl>
                 -->
			</div><!--select end -->
			
                        
			<div id="filter">
                <div class='fore1'>
                	<dl class='order'>
                    	<dt>排序：</dt>
                        <dd <c:if test="${requestScope.sort == 'intime' }">class='curr'</c:if>>
                        	<a name="l_sort" txt="intime" href="">上架时间</a>
                        </dd>
                        <dd <c:if test="${requestScope.sort == 'nowprice' }">class='curr'</c:if>>
                        	<a name="l_sort" txt="nowprice" href="">价格</a>
                        </dd>
                    </dl>
                    <div class='pagin pagin-m'>
                    	<span class='text'>${requestScope.pagin }/${requestScope.pageCount }</span>
                    	<c:if test="${requestScope.pagin <= 1 }">
                        	<span class="prev-disabled">上一页</span>
                        </c:if>
                        <c:if test="${requestScope.pagin > 1 }">
                        	<a name="prev_page" href="javascript:return false;" class="prev" >上一页</a>
                        </c:if>
                        <c:if test="${requestScope.pageCount == requestScope.pagin }">
                        	<span class="next-disabled">下一页</span>
                        </c:if>
                        <c:if test="${requestScope.pageCount > requestScope.pagin }">
                        	<a name="next_page" href="javascript:return false;" class="next" >下一页</a>
                        </c:if>
                   	</div>
                    <div class='total'><span>共<strong>${requestScope.size}</strong>个商品</span></div>
                    <span class='clr'></span>
                </div>
                
			</div><!--filter end-->	
			
			<div class="m " id="plist">
				<c:if test="${fn:length(requestScope.showcommoditys) == 0 }">
					<div>暂时没有产品</div>
				</c:if>
				<c:if test="${fn:length(requestScope.showcommoditys) > 0 }">
				<ul class="list-h">
                    <!-- <cc>1122</cc> -->
                    <c:forEach items="${requestScope.showcommoditys}" var="pro">
					<li>
                    	<div class='p-img'>
                        	<a href="${pageContext.request.contextPath}/servlet/commodityType?flag=selectCom&commodityID=${pro.productid}" target="_blank"> 
                            	<img src="${pageContext.request.contextPath}/upload/${pro.picture}" width="160" height="160" alt="${pro.productname}" />
                            </a>
                        </div>
                        <br/>
                        <div class='p-name'>
                       		<a href="${pageContext.request.contextPath}/servlet/commodityType?flag=selectCom&commodityID=${pro.productid}" target="_blank">${pro.productname}</a>
                        </div>
                        <div  class='p-price' style="color:rgb(204,0,0); font-size:16px; font-weight: bold;">￥<fmt:formatNumber value="${pro.nowprice}" pattern=".00"></fmt:formatNumber><%-- <%=new DecimalFormat(".00").format(((Product)pageContext.getAttribute("pro")).getNowprice()) %> --%></div>
                        <div class='btns'>
                        	<a href="${pageContext.request.contextPath}/servlet/productToCart?flag=buyCommodity&comId=${pro.productid}&buyNum=1" target="_blank" class="btn-buy">购买</a>
                        </div>
                    </li>
                    </c:forEach>
<!-- <cache>hits</cache> -->
				</ul>
				</c:if>
			</div><!--plist end-->			
			<div reco_id="2" class="shop-choice hide" id="shop-choice"></div>			
			<div class="m clearfix">
				<div class="pagin fr">
					<c:if test="${requestScope.pagin <= 1 }">
                    	<span class="prev-disabled">上一页<b></b></span>
                    </c:if>
                    <c:if test="${requestScope.pagin > 1 }">
                    	<a name="prev_page" href="javascript:return false;" class="prev" >上一页<b></b></a>
                    </c:if>
                    <c:if test="${requestScope.pageCount == requestScope.pagin }">
	                  	<span class="next-disabled">下一页<b></b></span>
	                </c:if>
	                <c:if test="${requestScope.pageCount > requestScope.pagin }">
	                  	<a name="next_page" href="javascript:return false;" class="next" >下一页<b></b></a>
	                </c:if>
				</div><!--pagin end-->
			</div>
		
			
		</div><!--right-extra end-->
	   
		<div class="left">
			<div id="weekRank" class="m rank">
				<div class="mt">
					<h2>销量排行榜</h2>
				</div>
				<div class="mc">
					<ul class="tabcon">
					<c:if test="${fn:length(requestScope.showcommoditys) > 0 }">
						<c:forEach items="${requestScope.showcommoditys}" var="product" varStatus="i">
                        <li class="fore">
                        	<span>${i.index + 1 }</span>
							<div class="p-name">
								<a href='${pageContext.request.contextPath}/servlet/commodityType?flag=selectCom&commodityID=${product.productid}' target="_blank">${product.productname }</a>
							</div>
							<div class="p-price">
								<strong style="color:rgb(204,0,0); font-weight:bold;">￥<fmt:formatNumber value="${product.nowprice }" pattern=".00"></fmt:formatNumber><%-- <%=new DecimalFormat(".00").format(((Product)pageContext.getAttribute("product")).getNowprice()) %> --%></strong>
							</div>
						</li>
						</c:forEach>
					</c:if>
					</ul>
					<!--rank end-->
				</div><!--left end-->
				<span class="clr"></span>
			<div id="Collect_Tip" class="Tip360 w260"></div>
		</div>
	</div>
	</div>
	<div class="clr"></div>
	</div>
    <%@ include file="../common/o_foot.jsp" %>
  </body>
</html>
