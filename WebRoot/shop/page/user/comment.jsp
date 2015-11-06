<%@ page language="java" import="java.util.*,java.text.*,java.math.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

com.shopping.vo.User userinfo_currUser = null;
Object userinfo_obj = session.getAttribute("curr_user");
if(userinfo_obj == null){
	response.sendRedirect(basePath + "page/user/login.jsp");
	return;
} else {
	userinfo_currUser = (com.shopping.vo.User)userinfo_obj;
}
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
	<link href="style/userinfo.css" rel="stylesheet" type="text/css" />
	<link href="style/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript" src="resource/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function(){
			function checkCtitle() {
				$("#ctitle_msg").html("");
				var ct = $("#ctitle").val();
				if (ct.length > 0) {
					return true;
				} else {
					$("#ctitle_msg").html("标题不能为空");
					$("#ctitle_msg").css("color","red");
					return false;
				}
			}
			function checkContent() {
				$("#content_msg").html("");
				var ct = $("#content").val();
				if (ct.length > 0) {
					return true;
				} else {
					$("#content_msg").html("不能为空");
					$("#content_msg").css("color","red");
					return false;
				}
			}
			$("#ctitle").blur(checkCtitle);
			$("#content").blur(checkContent);
			$(".info_btn").click(function(){
				$("#commentForm").attr("action","user/DeliverCommentServlet");
				$("#commentForm")[0].submit();
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
		    	<h2>发表评论</h2>
		    </div>
		    <div id="baseinfo">
		    	<div>
		        	<div class="info_item">
		            	<form name="commentForm" id="commentForm" method="post">
		            		<input type="hidden" name="productid" id="productid" value="${param.proid }" />
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>标题:</span>
		                        <div class=""><input name="ctitle" type="text" id="ctitle" class="text"" /><span id="ctitle_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>内容:</span>
		                        <div class=""><textarea name="content" id="content" class="text" cols="100" rows="10"></textarea><span id="content_msg"></span></div>
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
