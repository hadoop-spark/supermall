<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String isConfirm=request.getParameter("isConfirm");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>��¼ҳ��</title>
		<link href="style/css.css" rel="stylesheet" type="text/css" />
		<link href="style/div.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function check(){
				var loginid=document.getElementById("userid").value;
				var password=document.getElementById("password").value;
				if(loginid==""){
					alert("�������ֻ��Ż����䣡");
					return false;
				}else if(password==""){
					alert("���������룡");
					return false;
				}
			}
		</script>
	</head>
	<body>
		<div id="logo" align="center">
			<img src="images/1108.gif" width="144" height="28" />
		</div>
		<div id="top_link">
			<a href="login.jsp">��¼</a><span>|</span><a href="register.jsp">ע��</a><span>|</span>��Ա����
			<span>|</span>��������
			<span>|</span>���ﳵ
		</div>
		<div id="menu">
			<img src="images/1109.gif" width="65" height="15" />
			<img src="images/1110.gif" width="65" height="15" />
			<img src="images/1111.gif" width="65" height="15" />
			<img src="images/1112.gif" width="65" height="15" />
			<img src="images/1113.gif" width="65" height="15" />
			<img src="images/1114.gif" width="65" height="15" />
			<img src="images/1115.gif" width="65" height="15" />
		</div>
		<br><br><br><br>
		<div style="width: 500">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="6C415C" size="5">�û���¼</font>
			<br>
			<hr width="400" align="left">
			<br>
			<form id="loginForm" action="LoginServlet" method="post" onsubmit="return check()">
				<table width="321" height="118">
					<tr>
						<td height="30" align="right">
							<font style="font-size: 12px">�û���</font>
						</td>
						<td>
							&nbsp;&nbsp;<input name="userid" type="text" class="mytext" />
						</td>
					</tr>
					<tr>
						<td height="30" align="right">
							<font style="font-size: 12px">����</font>
						</td>
						<td>
							&nbsp;&nbsp;<input name="password" type="password" class="mytext">
						</td>
					</tr>
					<tr>
						<td height="30" align="right">
							<font style="font-size: 12px">�û�����</font>
						</td>
						<td>
							&nbsp;&nbsp;<select >
										  <option value ="1">��ͨ�û�</option>
										  <option value ="2">�̼��û�</option>
										</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" height="30">
							<input name="button" type="submit" value="��  ¼"/>
						</td>
					</tr>
				</table>
				<input type="hidden" name="isConfirm" value="<%=isConfirm%>"/>
			</form>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div id="link">
			<span>��������</span><span>��Ȩ����</span><span>��ϵ����</span><span>��վ����</span><span>��������</span>
		</div>
		<div id="bottom" style="margin-bottom: 50">
			<img src="images/1139.gif" width="125" height="69" />
			<br />
			COPYRIGHT (C) 2004-2007 DUTYFREE24 DONGWHA.All Rights Reserved.
		</div>
	</body>
</html>
