<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>极目商城用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="/supermall/style/common.css" rel="stylesheet" type="text/css" />
	<link href="/supermall/style/login.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript" src="/supermall/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function(){
		
			function checkUserName(){
				$("#loginname_succeed").html("");
				$("#loginname_error").html("");
				var loginname = $("#loginname").val();
				if(loginname.length == 0){
					$("#loginname_error").html("请输入用户名");
					$("#loginname_error").css("color","#ff0000");
					return false;
				}
				return false;
			}
			
			//检查密码
			function checkPwd(){
				$("#loginpwd_succeed").html("");
				$("#loginpwd_error").html("");
				var loginpwd = $("#loginpwd").val();
				if(loginpwd.length == 0){
					$("#loginpwd_error").html("请输入密码");
					$("#loginpwd_error").css("color","#ff0000");
					return false;
				}
				return false;
			}
			$("#loginname").blur(checkUserName);
			$("#loginpwd").blur(checkPwd);
			//检查验证码
			function checkCode(){
				$("#code_succeed").html("");
				$("#code_error").html("");
				var code = $("#code").val();
				if(code.length == 0){
					$("#code_error").html("请输入验证码");
					$("#code_error").css("color","#ff0000");
					return false;
				}
				var b = false;
				//使用同步请求才能即时改变b的值
				$.ajax({
					url: "${pageContext.request.contextPath}/servlet/UserServlet?flag=logincode",
					type: "POST",
					async: false,
					data: {"LoginCode":code},
					dataType: "json",
					success: function(data){
						if (data) {
							$("#code_succeed").html("验证码正确");
							$("#code_succeed").css("color","#00ff00");
							b = true;
						} else {
							$("#code_error").html("验证码错误");
							$("#code_error").css("color","#ff0000");
							b = false;
						}
					}
				});
				return b;
			}
			$("#code").focus(function(){
				$("#code_error").html("请输入验证码");
				$("#code_error").css("color","#bbb");
			});
			$("#code").blur(checkCode);
			$("#loginsubmit").click(function(){
//  				var b = checkUserName() & checkCode() & checkPwd();
				var b = checkCode();
				if(b){
					$("#loginForm").attr("action","${pageContext.request.contextPath}/servlet/UserServlet?flag=login");
					$("#loginForm")[0].submit();
				}
			});
		});
	</script>
  </head>
  
  <body>
    <!--快捷栏begin-->
<div id="shortcut">
	<div class="l_w">
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
<!--快捷栏end-->
<div class="l_w" id="l_logo">
	<div>
    	<a href="index.jsp" target="_blank"><img width="167" height="46" alt="极目商城" src="images/l_logo.gif" /></a>
    </div>   
</div> 
<div class="l_w" id="l_entry" >
    <div class="mt">
    	<h2>用户登录</h2><b></b>
    </div>
    <div class="mc" style="padding-top:20px;">
    	<form class="form" id="loginForm" method="post">
        	  <div class="item"><span class="label">账户名：</span>
                    <div class="fl">
                        <input type="text" id="loginname" name="loginname" class="text_blank"/>
                        <label id="loginname_succeed" class="blank invisible"></label>
                        <span class="clr"></span>
                        <label id="loginname_error"></label>
                    </div>
                </div>
                <div class="item">
                    <span class="label">密码：</span>
                    <div class="fl">
                        <input type="password" id="loginpwd" name="loginpwd" class="text" onfocus=""/>
                        <label id="loginpwd_succeed" class="blank invisible"></label>
                       <!-- <label><a href="" class="flk13">找回密码</a></label>-->
                        <span class="clr"></span>
                        <label id="loginpwd_error"></label>
                    </div>
                </div>
                <div class="item">
		            <span class="label">验证码：</span>
		
		            <div class="fl">
		                <input type="text" id="code" name="code" class="text" tabindex="5" style="width:100px;"/>&nbsp;
		                <img align="center" style="" id="img_code" src="./servlet/RandomValidateCode" border="0" onclick="this.src='./servlet/RandomValidateCode?s='+Math.random()"/>
		                点击图片换一张
		                <label id="code_succeed" class="blank"></label>             
		                <span class="clr"></span>
		
		                <div id="code_error"></div>
		            </div>
		        </div>
             <!--    <div class="item  hide " id="o-authcode">
                    <span class="label">验证码：</span>
                    <div class="fl">
                        <input type="text" id="authcode" name="authcode" class="text text-1" tabindex="6"
                               autocomplete="off"/>
                        <label class="img">
                            <img style="cursor:pointer;width:100px;height:26px;display:block;">
                        </label>
                        <label class="ftx23">&nbsp;看不清？<a href="javascript:void(0)" class="flk13">换一张</a></label>
                        <label id="authcode_succeed" class="blank invisible"></label>
                        <span class="clr"></span>
                        <span id="authcode_error"></span>
                    </div>
                </div>-->
                <div class="item">
                    <span class="label">&nbsp;</span>
                    <input type="button" class="btn-img btn-entry" id="loginsubmit" value="登录"/>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red" style="font-size: 12px">${requestScope.msg}</font>
                </div>


        </form>
        <div id="guide"><h5>还不是极目商城用户？</h5>

                <div class="content">现在免费注册成为极目商城用户，便能立刻享受便宜又放心的购物乐趣。</div>
                <a href="shop/page/user/regist.jsp" class="btn-link btn-personal">注册新用户</a>
        </div><!--guide end-->
        <span class="clr"></span>
    </div>
</div>
<div class="l_w" style="margin-top:20px;"><div id="footer"><div class="links"><a href="" target="_blank">关于我们</a>|<a href="" target="_blank">联系我们</a>|<a href="" target="_blank">人才招聘</a>|<a href="" target="_blank">商家入驻</a></div><div class="copyright">北京市公安局朝阳分局备案编号110105014669&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证070359号&nbsp;&nbsp;|&nbsp;&nbsp;互联网药品信息服务资格证编号(京)-非经营性-2011-0034<br>&nbsp;&nbsp;|&nbsp;&nbsp;出版物经营许可证编号新出发(苏)批字第N-012号&nbsp;&nbsp;|&nbsp;&nbsp;互联网出版许可证编号新出网证(京)字150号<br>Copyright&copy;2004-2012&nbsp;&nbsp;360buy极目商城&nbsp;版权所有</div></div></div><!-- footer end -->  

  </body>
</html>
