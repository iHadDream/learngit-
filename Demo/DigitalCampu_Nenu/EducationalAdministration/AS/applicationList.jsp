<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nenu.entity.CRApplication"%>
<%@ page import="org.displaytag.sample.*"%>
<%@ page import="com.nenu.entity.*"%>

<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String stylePath = path + "/style/";
String acceptApplicationPath = path + "/EducationalAdministration/operateApplication?method=accept";
String denyApplicationPath = path + "/EducationalAdministration/operateApplication?method=deny";
User user = (User) session.getAttribute("DCUser");
String commonPagePath = path + "/CommonPage/";
%>
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
 
 

 
 
 
 

<title>教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/xcConfirm.css" />
	
<link rel="stylesheet" type="text/css" href="<%=stylePath%>css/educated.css">
<link rel="stylesheet" type="text/css" href="<%=stylePath%>css/questionAnswer.css">
<script src="<%=stylePath%>js/jquery-1.8.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=stylePath%>js/xcConfirm.js" type="text/javascript"
	charset="utf-8"></script>
 
<style type="text/css" rel="stylesheet">
.page {
	display: none;
}

#pagnation a {
	padding-right: 5px;
}

.current {
	color: blue;
}

.numlink,#prev,#next {
	background-color: #F5F5F5;
	border: 1px solid #EBEBEB;
	color: #0072BC;
	font-weight: normal;
	margin-left: 10px;
	padding: 2px 7px;
	text-decoration: none;
	width: 22px;;
}

.current {
	background-color: #DDEEFF;
	border: 1px solid #BBDDFF;
	color: #0072BC;
	cursor: default;
	margin-left: 10px;
	padding: 2px 7px;
	text-decoration: none;
}

.stripe_tb {
	width: 780px;
	text-align: center;
}

.stripe_tb a {
	width: 24px;
	height: 10px;
	 
}

.stripe_tb a:hover {
	
}

.stripe_tb tr.alt td {
	background: #EBEBEB;
} /*这行将给所有偶数行加上背景色*/
.stripe_tb tr.over td {
	background: #ecf6fc;
} /*这个将是鼠标高亮行的背景色 */
.date {
	width: 100px;
	text-align: center;
}
 
.bigrounded  a {
	-webkit-border-radius: 2em;
	-moz-border-radius: 2em;
	border-radius: 2em;
}

.button a {
	color: #fff;
	
	
	border: solid 1px #0076a3;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee),
		to(#0078a5));
	background: -moz-linear-gradient(top, #00adee, #0078a5);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee',
		endColorstr='#0078a5');
}

.blue:hover {
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc),
		to(#00678e));
	background: -moz-linear-gradient(top, #0095cc, #00678e);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc',
		endColorstr='#00678e');
}

.blue:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5),
		to(#00adee));
	background: -moz-linear-gradient(top, #0078a5, #00adee);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5',
		endColorstr='#00adee');
}
/*button css*/
.pagebanner {
	width: 750px;
	text-align: right;
	line-height: 30px;
	height: 30px;
	color: #475766;
	text-decoration: underline;
	background-color: #F5F5F5;
}

.pagelinks {
	background-color: #F5F5F5;
	border: 1px solid #EBEBEB;
	color: #0072BC;
	font-weight: normal;
	margin-top: -16px;
	padding: 2px 0px;
	text-decoration: none;
	width: 780px;;
}

.pagelinks a {
	font-family: "微软雅黑";
	color: #aaa;
}
</style>
<script type="text/javascript">
	//隔行变色  
	$(document).ready(function() {

		$(".stripe_tb tr").mouseover(function() { //如果鼠标移到class为stripe_tb的表格的tr上时，执行函数  
			$(this).addClass("over");
		}).mouseout(function() { //给这行添加class值为over，并且当鼠标一出该行时执行函数  
			$(this).removeClass("over");
		}) //移除该行的class  
		$(".stripe_tb tr:even").addClass("alt"); //给class为stripe_tb的表格的偶数行添加class值为alt  

	});
</script>

</head>

<body>
				<%
					 
					if (user != null
							&& (user.getJurisdiction().intValue() & User.USER_JURISDICTION_AS) != 0) {
// 						return;
					}else{
						response.sendRedirect("www.baidu.com");
						return ;
					}
				%>
	<div class="container">
		<div class="header">
			<a href="jiaowu.html"><img
				src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标"
				name="Insert_logo" id="Insert_logo" style=" display:block;" /></a>

			<!-- end .header -->
		</div>
		<div class="lianjie">
			<span>您的位置:&nbsp;<a href="../../CommonPage">首页</a>&gt;&gt;<a
				href="./">教务管理系统</a> &gt;&gt;<a href="#">借教室</a></span>
			<span style="float:right;margin-right:50px;">管理员</span>
		</div>
		<div class="sidebar1">

			<img src="<%=stylePath%>images/jiaowuchu.png" />
			<ol class="rounded-list">
				<li><a href="notice.jsp">教务公告</a></li>
				<li><a href="questionAnswer.jsp">教务答疑</a></li>
				<li><a href="borrowClassroom.jsp">借教室</a></li>
				<li><a href="feedback.html">教学信息反馈</a></li>
				<li><a href="userManagement.jsp">用户管理</a></li>
				<li><a href="<%=commonPagePath%>singleCenter.jsp" target="blank">个人中心</a></li>

			</ol>
			<p>&nbsp;</p>
		</div>
		<!-- end .sidebar1 -->
		<%
			//http://localhost:8080/DigitalCampus/EducationalAdministration/teacher/applicationList.jsp
			List<CRApplication> applicationList = CRApplication.getListOfWaitingApplication();
			request.setAttribute("applicationList", applicationList);
		%>

		<div class="content" style="padding-top:1px;">
			<div id="content">
				<display:table name="applicationList" pagesize="10" class="stripe_tb">
					<display:column property="user" title="申请人" />
					<display:column property="classroom" title="申请教室" />
					<display:column property="exceptDate" title="借用日期" />
					<display:column property="exceptTime" title="借用时间" />
					<display:column property="reason" title="申请原因" />


					<display:column href="<%=acceptApplicationPath%>" title="同意"
						value="同意" paramId="id" paramProperty="id"
						class="bigground button  " />

					<display:column href="<%=denyApplicationPath%>" title="拒绝"
						value="拒绝" paramId="id" paramProperty="id"
						class="bigground button  " />


					<display:setProperty name="paging.banner.items_name" value="申请" />
					<display:setProperty name="paging.banner.placement" value="bottom" />



					<display:setProperty name="paging.banner.first">
						<div align=center class="pagelinks">
							[<a href="{1}">首页</a>/<a href="{2}">上一页</a>] {0} [<a href="{3}">下一页</a>/<a
								href="{4}">尾页</a>]
						</div>
					</display:setProperty>

					<display:setProperty name="paging.banner.full">
						<div align=center class="pagelinks">
							[<a href="{1}">首页</a>/<a href="{2}">上一页</a>] {0} [<a href="{3}">下一页</a>/<a
								href="{4}">尾页</a>]
						</div>
					</display:setProperty>

					<display:setProperty name="paging.banner.last">
						<div align=center class="pagelinks">
							[<a href="{1}">首页</a>/<a href="{2}">上一页</a>] {0} [<a href="{3}">下一页</a>/<a
								href="{4}">尾页</a>]
						</div>
					</display:setProperty>
					<display:setProperty name="paging.banner.onepage">
						<div align=center class="pagelinks"></div>
					</display:setProperty>


					<display:setProperty name="paging.banner.some_items_found">
						<p class="pagebanner">您有{0}条{1}未处理, 本页显示第{2}条到第{3}条</p>
					</display:setProperty>
					<display:setProperty name="paging.banner.all_items_found">
						<p class="pagebanner">您有{0}条{1}未处理, 已呈现所有{2}</p>
					</display:setProperty>
				</display:table>
			</div>
		</div>

		<!-- end .content -->

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
