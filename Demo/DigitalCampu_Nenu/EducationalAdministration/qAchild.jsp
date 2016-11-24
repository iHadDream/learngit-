<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.nenu.entity.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String stylePath = path + "/style/";
	User user = (User) session.getAttribute("DCUser");
	String commonPagePath = path + "/CommonPage/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!--     <base href="<%=basePath%>"> -->

<title>问题详情 | 教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=stylePath%>css/educated.css" type="text/css">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
.qA_details {
	width: 700px;
	height: 300px;
	text-align: center;
	border: 3px solid #fff;
}

.qTime,.aTime {
	color: #bbb;
	font-size: 16px;
}

.qTitle {
	color: #0066cc;
	font-size: 20px;
}

.qContent {
	height: 80px;
	border-bottom: 1px solid #bbb;
	text-align: left;
}

.aContent {
	height: 80px;
	text-align: left;
}
</style>


</head>

<div class="container">
				<%
					 
					if (user != null
							&& (user.getJurisdiction().intValue() & User.USER_JURISDICTION_AS) != 0) {
						response.sendRedirect("www.baidu.com");
					}
				%>
	<div class="header">
		<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标" name="logo"
			id="Insert_logo" style=" display:block;" />
	</div>
	<!-- end .header -->
	<div class="lianjie">
		<span>您的位置:&nbsp;<a href="../">首页</a>&gt;&gt; <a href="./">教务管理系统</a>&gt;&gt;<a
			href="./questionAnswer.jsp">教务答疑</a></span> <span
			style="float:right;margin-right:50px;">admin </span>
	</div>
	<div class="sidebar1">

		<img src="<%=stylePath%>images/jiaowuchu.png">
		<!-- 学生网上服务中心 -->
		<ol class="rounded-list">
			<li><a href="noticeList.jsp">教务公告</a></li>
			<li><a href="questionAnswer.jsp">教务答疑</a></li>
			<li><a href="borrowClassroom.jsp">借教室</a></li>
			<li><a href="feedback.html">教学信息反馈</a></li>
			<!--           <li><a href="">论坛</a></li> -->
			<li><a href="single.jsp">个人中心</a></li>

		</ol>




		<p>&nbsp;</p>
		<!-- end .sidebar1 -->
	</div>
	<div class="content">
		<div class="qA_details">
			<% 
				QAndA qabuffer = QAndA.getQAFromDatebaseById(Integer.valueOf(request.getParameter("id")));
				QAndA.increaseReadCount(Integer.valueOf(request.getParameter("id")));
// 				out.println(qabuffer.getId());
			%>
			<p class="qTitle">"<%=qabuffer.getqSubject() %>"</p>
			<p class="qTime">已阅人数"<%=qabuffer.getCount() %>" 发表于"<%=qabuffer.getqTime()%>"</p>
			<p class="qContent">"<%=qabuffer.getqDetail()%>"</p>
			<p class="aContent">"<%=qabuffer.getaDetail()%>"</p>
			<p class="aTime">"<%=qabuffer.getResponder()%>" 发表于"<%=qabuffer.getaTime()%>"</p>
		</div>

		<!-- end .content -->
	</div>

	<div class="footer">

		<div class="footer-center">
			<img src="<%=stylePath%>images/footer-logo.png">
		</div>
		<div class="footer-center">版权所有©东北师范大学 信息与软件工程学院</div>
		<!-- end .footer -->
	</div>
	<!-- end .container -->
</div>
</body>
</html>
