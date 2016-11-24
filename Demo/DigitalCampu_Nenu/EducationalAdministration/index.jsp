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

<title>教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="<%=stylePath%>css/educated.css"
	type="text/css">


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
			<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标"
				name="logo" id="Insert_logo" style=" display:block;" />
		</div>
		<!-- end .header -->
		<div class="lianjie">
			<span>您的位置:&nbsp;<a href="<%=path%>">首页</a>>> <a
				href="">教务管理系统</a></span> <span
				style="float:right;margin-right:50px;"><%=user.getAccount()%>
				| <%=user.getName()%> </span>
		</div>
		<div class="sidebar1">

			<img src="<%=stylePath%>images/jiaowuchu.png">
			<!-- 学生网上服务中心 -->
			<ol class="rounded-list">
				<li><a href="noticeList.jsp">教务公告</a></li>
				<li><a href="questionAnswer.jsp">教务答疑</a></li>
				<li><a href="borrowClassroom.jsp">借教室</a></li>
				<li><a href="feedback.jsp">教学信息反馈</a></li>
				<li><a href="<%=commonPagePath%>singleCenter.jsp" target="blank">个人中心</a></li>

			</ol>

			<p>&nbsp;</p>
			<!-- end .sidebar1 -->
		</div>
		<div class="content">
			<div class="jiaowu1">
				<span>教务公告</span><br> <img
					src="<%=stylePath%>images/MainClassTitle1.gif">

				<p>
				<%
					String keyword = request.getParameter("keyword");
					List<Notice> listOfNotice = null;
					if (keyword == null) {
						listOfNotice = Notice.getListOfNoticeFromDatebase();
					} else {
						listOfNotice = Notice.getListOfNoticeWithKeyWords(keyword);
					}
					
				%>
				<%
					if (listOfNotice.isEmpty()) {
						out.println("<br><br>什么都没有搜索到。");
					} else {
						Iterator<Notice> iterator = listOfNotice.iterator();
				%>
				<%
					int siz = 6;
					if(listOfNotice.size() < siz) siz = listOfNotice.size();
					for(int i =0; i < siz; i ++) {
					Notice noticeBuffer = listOfNotice.get(i);
				%>
									 
				<ul>
					<li><a href="./noticeDetail.jsp?id=<%=noticeBuffer.getId()%>"
					target="_blank" name="news"><%=noticeBuffer.getTitle()%></a></li>
				 
				</ul>
				<%								
					}
				%>	
				</p>
				<p class="more"><a href="noticeList.jsp">更多内容 >>>></a></p>
			</div>



			<!-- end .content -->
		</div>

		<div class="footer">

			<div class="footer-center">
				<img src="<%=stylePath%>images/footer-logo.png">
				<%								
					}
				%>
			</div>
			<div class="footer-center">版权所有©东北师范大学 信息与软件工程学院</div>
			<!-- end .footer -->
		</div>
		<!-- end .container -->
	</div>
</body>
</html>
