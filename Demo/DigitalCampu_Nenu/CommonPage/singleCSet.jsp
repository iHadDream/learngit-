<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.nenu.entity.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String stylePath = path + "/style/";
	String commonPagePath = path + "/CommonPage/";
	User user = (User)session.getAttribute("DCUser");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>个人设置 | 个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset="utf-8">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<link rel="stylesheet" href="<%=stylePath %>css/educated.css" type="text/css">
<link rel="stylesheet" href="<%=stylePath %>css/questionAnswer.css" type="text/css">
<link rel="stylesheet" href="<%=stylePath %>css/singleCenter.css" type="text/css">
<title>个人中心</title>

<style type="text/css">
.wrap {
	position: relative;
	width: 1200px;
	margin: 0px auto;
	height: 500px;
}

.self {
	position: absolute;
	width: 1200px;
	margin-bottom: 20px;
	text-align: right;
}

.selfUser {
	font-weight: bold;
	right: 0px;
}

.slider {
	position: absolute;
	width: 200px;
	left: 0;
	margin-top: 20px;
}

.slider ul li {
	height: 60px;
	border-bottom: 1px solid #EDF1F2;
	width: 160px;
	margin: 0 auto;
}

.slider ul a {
	display: block;
	height: 60px;
	font-size: 16px;
	line-height: 60px;
	text-align: center;
	color: #787d82;
	font-family: '微软雅黑';
}

.slider ul a.active {
	color: #F01400;
	font-weight: bold;
}

.slider ul a:hover {
	color: black;
	font-size: 16px;
}

/*u-container*/
.u-container {
	margin-top: 20px;
	margin-left: 240px;
	min-height: 589px;
}

.setUp {
	width: 800px;
	height: 600px;
}

.setUpDetail {
	width: 700px;
	height: 500px;
}

.setUp div {
	margin-left: 100px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.setInput {
	display: block;
	width: 300px;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #787d82;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 2px;
	box-sizing: border-box;
}

.setUp label {
	float: left;
	width: 100px;
	text-align: center;
	height: 40px;
	line-height: 40px;
	color: #07111b;
	font-weight: bold;
	font-size: 14px;
}

.setUp textarea {
	width: 300px;
	height: 100px;
	margin-left: -199px;
}

.dynamic {
	padding-bottom: 21px;
	border-bottom: 1px solid #CFD5D8;
}

.dynamic-title {
	color: #787d82;
	line-height: 14px;
	margin-top: 10px;
	padding-top: 25px;
	font-size: 14px;
	text-align: left;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">

			<img src="<%=stylePath %>images/banner2.jpg" alt="在此处插入徽标" name="logo"
				id="Insert_logo" style=" display:block;" />

		</div>

		<div class="wrap">
			<div class="self"> <%=user.getAccount()%> | <%=user.getName()%>
<!-- 				<span class="selfUser">王某某</span>&nbsp;&nbsp;|&nbsp; <span>消息</span> -->
			</div>
			<div class="slider">

				<ul>
					<%-- <li><a href="<%=commonPagePath%>singleCenter.jsp" class="active"> <i
							class="icon-home"></i> <span>主页</span> <b class="icon-right"></b>
					</a></li> --%>

					<li><a href="<%=commonPagePath%>singleCenter.jsp"> <i class="icon-home"></i>
							<span>消息</span> <b class="icon-right"></b>
					</a></li>

					<!-- <li><a href="#"> <i class="icon-home"></i> <span>课程</span>
							<b class="icon-right"></b>
					</a></li>

					<li><a href="singleCNotice.html"> <i class="icon-home"></i>
							<span>通知</span> <b class="icon-right"></b>
					</a></li> -->

					<li><a href="<%=commonPagePath%>singleCSet.jsp"> <i class="icon-home"></i> <span>设置</span>
							<b class="icon-right"></b>
					</a></li>


				</ul>
			</div>
			<div class="u-container">
				<div class="dynamic">
					<p class="dynamic-title">设置中心</p>
				</div>
				<div class="setUp">
					<div class="setUpDetail">
						<form method="post" action="operateUser">
							<div>
								<label>输入原密码：</label> <input placeholder="请输入..."
									name="oldPassword" type="password" class="setInput"></input>
							</div>

							<div>
								<label>输入新密码：</label> <input placeholder="请输入..."
									name="newPassword" type="password" class="setInput"></input>
							</div>

							<div>
								<label>确认密码：</label> <input placeholder="请输入..."
									name="confirmPassword" type="password" class="setInput"></input>
							</div>
							<p></p>
							<!-- 					 	<div> -->
							<!-- 						 	<label>邮箱：</label> -->
							<!-- 						 	<input placeholder="请输入邮箱." class="setInput"></input> -->
							<!-- 					 	</div> -->
							<!-- 					 	<div> -->
							<!-- 						 	<label>联系电话：</label> -->
							<!-- 						 	<input placeholder="请输入电话." class="setInput"></input> -->
							<!-- 					 	</div> -->
							<div>
								<label>个性签名：</label> <textarea name="introduction" class="setInput"></textarea>
							</div>
							<p></p>
							<input type="submit" class="button blue biground" value="保存"></input>
							<input name="method" value="updatePersonalInformation" hidden></input> 
							<input name="account" value="<%=user.getAccount()%>" hidden> </input>
						</form>
					</div>

				</div>

			</div>

		</div>

		<div class="footer">
			<div class="footer-center">
				<img src="<%=stylePath %>images/footer-logo.png">
			</div>
			<div class="footer-center">版权所有©东北师范大学 信息与软件工程学院</div>
			<!-- end .footer -->
		</div>
		<!-- end .container -->
	</div>
	</div>
</body>
</html>
