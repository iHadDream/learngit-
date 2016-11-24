<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>申请详情 | 教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="<%=stylePath%>css/educated.css"
	type="text/css">

<style type="text/css">
.details {
	width: 700px;
}

.Time {
	padding-bottom: 15px;
	text-align: center;
	margin: 0 5px;
	font-size: 15px;
	color: #787878;
	font-family: "Microsoft YaHei";
}

.Title {
	color: #0066cc;
	line-height: 28px;
	padding-bottom: 8px;
	font-size: 21px;
	font-weight: normal;
	text-align: center;
}

.Content {
	margin: 0 auto;
	overflow: hidden;
	border-bottom: 1px solid #bbb;
	font-size: 17px;
}
</style>



</head>

<body>
				<%
					 
					if (user != null
							&& (user.getJurisdiction().intValue() & User.USER_JURISDICTION_AS) != 0) {
						response.sendRedirect("www.baidu.com");
					}
				%>
	<div class="container">

		<div class="header">
			<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标" name="logo"
				id="Insert_logo" style=" display:block;" />
		</div>
		<!-- end .header -->
		<div class="lianjie">
			<span>您的位置:&nbsp;<a href="<%=path%>">首页</a>&gt;&gt; <a
				href="./">教务管理系统</a>&gt;&gt;<a href="borrowClassroom.jsp">借教室</a>&gt;&gt;<a
				href="#">申请详情</a></span> <span style="float:right;margin-right:50px;"><%=user.getAccount()%>
				| <%=user.getName()%> </span>
		</div>
		<div class="sidebar1">

			<img src="<%=stylePath %>images/jiaowuchu.png">
			<!-- 学生网上服务中心 -->
			<ol class="rounded-list">
				<li><a href="notice.html">教务公告</a></li>
				<li><a href="questionAnswer.html">教务答疑</a></li>
				<li><a href="borrowClassroom.jsp">借教室</a></li>
				<li><a href="feedback.html">教学信息反馈</a></li>
				<li><a href="">论坛</a></li>
				<li><a href="<%=commonPagePath%>singleCenter.jsp" target="blank">个人中心</a></li>

			</ol>

			<p>&nbsp;</p>
			<!-- end .sidebar1 -->
		</div>
		<div class="content">
			<div class="details" >
				<%
					String indexString = request.getParameter("id");
					if (indexString == null) {
						response.sendRedirect(path);
					}
					Integer index = Integer.valueOf(indexString);
					CRApplication crApplication = CRApplication
							.getApplicationById(index);
					if (crApplication == null) {
						response.sendRedirect(path);
					}
					User aUser = crApplication.getUserWithClass();
					User aOperator = crApplication.getOperatorWithClass();
					Classroom aClassroom = crApplication.getClassroomWithClass();
				%>
				<div style="height:60"></div>
				<p class="Title">对<%=crApplication.getClassroom()%>的申请详情</p>
				<p class="Time"><%=aUser.getName()%> 申请于：<%=crApplication.getApplyTime()%></p>
				<p class="Content"> 期望教室：<%=crApplication.getClassroom()%><br>
				期望日期：<%=crApplication.getExceptDate()%><br>
					期望时间：<%=crApplication.getExceptTime()%><br> 申请状态：
					<b><%=crApplication.getStatusToString()%></b><br>
					申请原因：<%=crApplication.getReason()%></p>
				<p>
								

				</p>
			</div>

			<!-- end .content -->
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

</body>
</html>
