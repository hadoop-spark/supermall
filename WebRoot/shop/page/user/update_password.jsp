<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
	<link href="style/userinfo.css" rel="stylesheet" type="text/css" />
	<link href="style/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript" src="resource/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function(){
			function checkOldPwd(){
				$("#old_pwd_msg").html("");
				var pwd = $("#old_pwd").val();
				if(pwd.length == 0){
					$("#old_pwd_msg").html("请输入密码");
					$("#old_pwd_msg").css("color","#ff0000");
					return false;
				}
				return true;
			}
			$("#old_pwd").blur(checkOldPwd);
			
			function checkNewPwd(){
				$("#new_pwd_msg").html("");
				var pwd = $("#new_pwd").val();
				if(pwd.length == 0){
					$("#new_pwd_msg").html("请输入密码");
					$("#new_pwd_msg").css("color","#ff0000");
					return false;
				}
				var reg = /^\w{6,20}$/;
				if(!reg.test(pwd)){
					$("#new_pwd_msg").html("6-20个字符，可由字母、数字、“_”组成");
					$("#new_pwd_msg").css("color","#ff0000");
					return false;
				} else {
					$("#new_pwd_msg").html("格式正确");
					$("#new_pwd_msg").css("color","#00ff00");
					return true;
				}
				return false;
			}
			$("#new_pwd").blur(checkNewPwd);
			
			//检查确认密码
			function checkRePwd(){
				$("#re_pwd_msg").html("");
				var pwd = $("#new_pwd").val();
				var pwd2 = $("#re_pwd").val();
				if(pwd2.length == 0){
					$("#re_pwd_msg").html("请输入确认密码");
					$("#re_pwd_msg").css("color","#ff0000");
					return false;
				}
				if(pwd == pwd2){
					$("#re_pwd_msg").html("密码一致");
					$("#re_pwd_msg").css("color","#00ff00");
					return true;
				} else {
					$("#re_pwd_msg").html("两次输入的密码不一致");
					$("#re_pwd_msg").css("color","#ff0000");
					return false;
				}
				return false;
			}
			$("#re_pwd").blur(checkRePwd);
			$(".info_btn").click(function(){
				var b = checkOldPwd() & checkNewPwd() & checkRePwd();
				if (b) {
					$("#pwdForm").attr("action","user/UpdatePwdServlet");
					$("#pwdForm")[0].submit();
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
		    	<h2>修改密码</h2>
		    </div>
		    <div id="baseinfo">
		    	<div>
		        	<div class="info_item">
		            	<form name="pwdForm" id="pwdForm" method="post">
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>原密码:</span>
		                        <div class=""><input name="old_pwd" type="password" id="old_pwd" class="text"" /><span id="old_pwd_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>新密码:</span>
		                        <div class=""><input name="new_pwd" type="password" id="new_pwd" class="text" /><span id="new_pwd_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>再次输入密码:</span>
		                        <div class=""><input name="re_pwd" type="password" id="re_pwd" class="text" /><span id="re_pwd_msg"></span></div>
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
