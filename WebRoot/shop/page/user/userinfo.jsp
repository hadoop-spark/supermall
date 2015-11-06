<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userdetail.jsp' starting page</title>
    
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
 		var curr_year;
		var start_year = 1930;
		//var 
		$(document).ready(function(){
			for(var i = curr_year; i >= start_year; i--){
				$("#year").append("<option value='"+i+"'>"+i+"</option>");
			}
			for(var i = 1; i <= 12; i++){
				$("#month").append("<option value='"+i+"'>"+i+"</option>");
			}
			for(var i = 1; i <= 31; i++){
				$("#date").append("<option value='"+i+"'>"+i+"</option>");
			}
			$("#year").change(function(){
				var m = $("#month").val();
				var y = $("#year").val();
				if (m == 2) {
					$("#date").html("");
					if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) {
						for(var i = 1; i <= 29; i++){
							$("#date").append("<option value='"+i+"'>"+i+"</option>");
						}
					} else {
						for(var i = 1; i <= 28; i++){
							$("#date").append("<option value='"+i+"'>"+i+"</option>");
						}
					}
				}
			});
			$("#month").change(function(){
				var m = $("#month").val();
				var y = $("#year").val();
				var b_m = /^1|3|5|7|8|(10)|(12)$/;
				var s_m = /^4|6|9|11$/;
				if (b_m.test(m)) {
					$("#date").html("");
					for(var i = 1; i <= 31; i++){
						$("#date").append("<option value='"+i+"'>"+i+"</option>");
					}
				}
				if (s_m.test(m)){
					$("#date").html("");
					for(var i = 1; i <= 30; i++){
						$("#date").append("<option value='"+i+"'>"+i+"</option>");
					}
				}
				if (m == 2) {
					$("#date").html("");
					if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) {
						for(var i = 1; i <= 29; i++){
							$("#date").append("<option value='"+i+"'>"+i+"</option>");
						}
					} else {
						for(var i = 1; i <= 28; i++){
							$("#date").append("<option value='"+i+"'>"+i+"</option>");
						}
					}
				}
			});
			//����֤
			//��֤��ʵ��������Ϊ��
			function checkTrueName() {
				$("#truename_msg").html("");
				var tn = $("#truename").val();
				if (tn.length == 0) {
					$("#truename_msg").html("��ʵ��������Ϊ��");
					$("#truename_msg").css("color","#ff0000");
					return false;
				}
				return true;
			}
			//��֤�����ʼ�
			function checkEmail(){
				$("#email_msg").html("");
				var email = $("#email").val();
				if(email.length == 0){
					$("#email_msg").html("����������");
					$("#email_msg").css("color","#ff0000");
					return false;
				}
				var reg = /^\w{1,}@\w+(\.\w+)+$/;
				if(!reg.test(email)){
					$("#email_msg").html("�����ʽ������������������");
					$("#email_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}
				return false;
			}
			//��֤��ַ����Ϊ��
			function checkAddress() {
				$("#address_msg").html("");
				var ad = $("#address").val();
				if (ad.length == 0) {
					$("#address_msg").html("���������ĵ�ַ");
					$("#address_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}
			}
			//��֤�ʱ�
			function checkPostcode() {
				$("#postcode_msg").html("");
				var pc = $("#postcode").val();
				var re= /^[1-9][0-9]{5}$/;
				if (!re.test(pc)) {
					$("#postcode_msg").html("��������ȷ���ʱ�");
					$("#postcode_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}
			}
			//��֤��ϵ�绰
			function checkPhone(){
				$("#phone_msg").html("");
				var ph = $("#phone").val();
				var re= /^\d{7,}$/;
				if (ph.length != 0 && !re.test(ph)) {
					$("#phone_msg").html("��������ȷ�ĵ绰����");
					$("#phone_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}
			}
			//��֤�ֻ�����
			function checkMobile() {
				$("#mobile_msg").html("");
				var mb = $("#mobile").val();
				var re= /^1[3|4|5|8][0-9]\d{4,8}$/;
				if (!re.test(mb)) {
					$("#mobile_msg").html("��������ȷ���ֻ�����");
					$("#mobile_msg").css("color","#ff0000");
					return false;
				} else {
					return true;
				}
			}
			$("#truename").blur(checkTrueName);
			$("#email").blur(checkEmail);
			$("#address").blur(checkAddress);
			$("#postcode").blur(checkPostcode);
			$("#phone").blur(checkPhone);
			$("#mobile").blur(checkMobile);
			$(".info_btn").click(function(){
				var b = checkTrueName() & checkEmail() & checkAddress() & checkPostcode() & checkPhone() & checkMobile();
				if (b) {
					$("#baseinfoForm").attr("action","user/UpdateBaseInfoServlet");
					$("#baseinfoForm")[0].submit();
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
		    	<h2>�˻���Ϣ</h2>
		    </div>
		    <div id="baseinfo">
		    	<div>
		        	<div class="info_item">
		            	<form name="baseinfoForm" id="baseinfoForm" method="post">
		                	<div class="baseinfo_i">
		                    	<span class="label">�û���:</span>
		                        <div class="username">${sessionScope.curr_user.name}</div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>��ʵ����:</span>
		                        <div class=""><input name="truename" id="truename" class="text" value="${sessionScope.curr_user.truename }" /><span id="truename_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>�Ա�:</span>
		                        <div class="">
		                        <c:if test="${sessionScope.curr_user.gender == 1 }">
			                        <input name="gender" type="radio" value="1" class="radio" checked="checked" /><span class="g_lbl">��</span>
			                        <input name="gender" type="radio" value="0" class="radio" /><span class="g_lbl">Ů</span></div>
		                        </c:if>
		                        <c:if test="${sessionScope.curr_user.gender == 0 }">
			                        <input name="gender" type="radio" value="1" class="radio" /><span class="g_lbl">��</span>
			                        <input name="gender" type="radio" value="0" class="radio" checked="checked" /><span class="g_lbl">Ů</span></div>
		                        </c:if>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>��������:</span>
		                        <div class="">
			                        <select name="year" id="year" class="select" >
			                        </select><span class="bron">��</span>
			                        <select name="month" id="month" class="select" >
			                        </select><span class="bron">��</span>
			                        <select name="date" id="date" class="select" >
			                        </select><span class="bron">��</span>
			                    </div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>�����ʼ�:</span>
		                        <div class=""><input name="email" id="email" class="text" value="${sessionScope.curr_user.email }" /><span id="email_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>��ϸ��ַ:</span>
		                        <div class=""><input name="address" id="address" class="text" value="${sessionScope.curr_user.address }" /><span id="address_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>�ʱ�:</span>
		                        <div class=""><input name="postcode" id="postcode" class="text" value="${sessionScope.curr_user.postcode }" /><span id="postcode_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label">��ϵ�绰:</span>
		                        <div class=""><input name="phone" id="phone" class="text" value="${sessionScope.curr_user.phone }" /><span id="phone_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<span class="label"><em>*</em>�ֻ�����:</span>
		                        <div class=""><input name="mobile" id="mobile" class="text" value="${sessionScope.curr_user.mobile }" /><span id="mobile_msg"></span></div>
		                        <div class="clr"></div>
		                    </div>
		                    <div class="baseinfo_i">
		                    	<div class="btn_div"><input type="button" class="info_btn" value="�ύ"/></div>
		                        <div class="clr"></div>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		
    	<div class="clr"></div>
    </div>
 <%@ include file="../common/foot.jsp" %>
  </body>
</html>
