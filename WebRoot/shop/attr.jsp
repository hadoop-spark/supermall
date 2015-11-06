<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script language="javascript" src="resource/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
	$(function() {
		//选中filter下的所有a标签，为其添加hover方法，该方法有两个参数，分别是鼠标移上和移开所执行的函数。       
		$("#filter a").hover(function() {
			$(this).addClass("seling");
		}, function() {
			$(this).removeClass("seling");
		});
		//选中filter下所有的dt标签，并且为dt标签后面的第一个dd标签下的a标签添加样式seled。(感叹jquery的强大)       
		$("#filter dt+dd a").attr("class", "seled");
		/*注意：这儿应该是设置(attr)样式，而不是添加样式(addClass)，                                                      不然后面通过$("#filter a[class='seled']")访问不到class样式为seled的a标签。*/
		//为filter下的所有a标签添加单击事件        
		$("#filter a").click(function() {
			$(this).parents("dl").children("dd").each(function() {
				$(this).children("div").children("a").removeClass("seled");
			});
			$(this).attr("class", "seled");
			alert(RetSelecteds()); //返回选中结果       
		});
	});
	function RetSelecteds() {
		var result = "";
		$("#filter a[class='seled']").each(function() {
			result += $(this).html() + "\n";
		});
		return result;
	}
</script>
		<title>静态多条件筛选</title>
		<style type="text/css">
#filter {
	width: 620px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	font-size: 12px;
}

#filter dl {
	padding: 0;
	margin-top: 0;
	margin-bottom: 0;
	clear: both;
	padding: 4px 0;
}

#filter dt,dd {
	display: block;
	float: left;
	width: auto;
	padding: 0;
	margin: 3px 0;
}

#filter dt {
	height: 14px;
	padding-bottom: 4px;
	font-weight: bold;
	color: #333333;
}

#filter dd {
	color: #005AA0;
	margin-right: 8px;
}

#filter a {
	cursor: pointer;
}

.seling {
	background-color: #005AA0;
	color: #FFFFFF;
}

.seled {
	background-color: #005AA0;
	color: #FFFFFF;
}

</style>
	</head>
	<body>
		<div id="filter">
		<c:forEach var="pattrs" items="${pattr}">
			<dl>
				<dt>
					${pattrs.key}：
				</dt>
				<dd>
					<div>
						<a href="#">全部</a>
					</div>
				</dd>
				<c:if test="${not empty pattrs.value}">
				<c:forEach var="atvalue" items="${pattrs.value}">
				<dd>
					<div>
						<a id="1" href="#">${atvalue}</a>
					</div>
				</dd>
				</c:forEach>
				</c:if>
			</dl>
		</c:forEach>
		</div>
	</body>
</html>
