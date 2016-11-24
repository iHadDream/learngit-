<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String stylePath = path + "/style/";
%>
<%@page import=" com.nenu.entity.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>系统登录</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is a login page">


<link rel="stylesheet" type="text/css"
	href="<%=stylePath %>css/login.css">
<style type="text/css">
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-image: url(<%=stylePath%>images/login.jpg);
	margin: 0;
	padding: 0;
	color: #000;
	background-repeat: no-repeat;
	background-size: cover;
	-webkit-background-size:cover;
    -moz-background-size:cover;
    -o-background-size:cover;
}
</style>


</head>

<%
User user = (User)(session.getAttribute("DCUser"));
if(user!=null && user.getUserCheckStatus() == User.USER_CHECK_STATUS_OK) {
	out.print("<script> window.location= '" + path + "/CommonPage/index.jsp' </script>");	
}
%>


<body>
	<div class="header">
		<img src="<%=stylePath %>images/loginBanner.gif" />
		<!-- <span class="language">English|简体中文</span> -->
	</div>
	<div class="content">
		<div class="news">
			<h3>友情提示：</h3>

			1. 登录账号为统一身份认证账号(邮箱)。初始密码为 “Nenu”+身份证号后六位(X用1代替)。<br> 2.
			未修改初始密码的用户，请尽快修改密码。<br> 3.
			信息系统(网站)采用“统一身份认证”或“一站式登录”，可至信息化办网站在线办理。<br> 4.
			用户在个人计算机上可保存账号密码，以方便登录。公用计算机请勿保存，以避免个人信息泄露。清除已保存账号密码，可通过浏览器相关设置进行。<br>
			5. 其他帮助：电话85099005；邮箱xxhb@nenu.edu.cn。
		</div>
		<div class="login">
			<h2>欢迎登录信息与软件工程学院</h2>
			<h3>数字化教学平台</h3>
			<form id="login" action="<%=path %>/login.action" method="post">
				<div class="yonghu">
					<div class="ts">帐号:</div>
					<input type="text" value="统一身份认证账号（邮箱）" id="account" name="account"
						onfocus="if (value =='统一身份认证账号（邮箱）'){value ='';}"
						onblur="if (value ==''){value='统一身份认证账号（邮箱）';}"
						pattern="(^[A-Za-z0-9]+$)" title="请输入您的邮箱" />
				</div>
				<br />
				<div class="yonghu">
					<div class="ts">密码:</div>
					<input type="password" name="password" id="password" />
				</div>
				<br />
				<div class="yonghu" hidden>
					<div class="ts">方法</div>
					<input type="password" name="method" id="method" value='login'
						readonly />
				</div>

				<input type="button" class="button blue bigrounded" value="登录"
					onclick="check();" /> <br>
			</form>
			<a href="http://account.nenu.edu.cn/password/reSet.htm">忘记密码?</a>|<a
				href="http://account.nenu.edu.cn/">维护账号</a>

		</div>




		<script type="text/javascript">
			function check(){
				var password=document.getElementById("password");
				if(password.value==""){
					alert("请输入密码");
				}
				else {
					document.getElementById("login").submit();
				}
			}

		</script>
	</div>
</body>
</html>
