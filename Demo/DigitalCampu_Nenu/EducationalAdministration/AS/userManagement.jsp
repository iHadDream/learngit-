<%@ page language="java" import="java .util.*" pageEncoding="UTF-8"%>
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
<!-- <base href="<%=basePath%>"> --> 

<title>用户管理 | 教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=stylePath%>css/educated.css"
	type="text/css">
<script src="<%=stylePath%>js/jquery-1.7.1.js"></script>
<script src="<%=stylePath%>js/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>

<script src="<%=stylePath%>js/jquery-1.8.3.min.js"
	type="text/javascript" charset="utf-8"></script>


<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/questionAnswer.css">
<title>用户管理 | 教务管理系统</title>
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

	$(function() {
		$("#selectAll").click(function() {//全选  
			$("#playList :checkbox").attr("checked", true);
		});

		$("#unSelect").click(function() {//全不选  
			$("#playList :checkbox").attr("checked", false);
		});

		$("#reverse").click(function() {//反选  
			$("#playList :checkbox").each(function() {
				$(this).attr("checked", !$(this).attr("checked"));
			});
		});
	});
</script>
<style>
.qANavigation .search {
	margin-top: 6px;
	margin-left: 267px;
}

.btn6 {
	cursor: pointer;
}

form {
	text-align: left;
}
</style>
</head>

<body>
				<%
					 
					if (user != null
							&& (user.getJurisdiction().intValue() & User.USER_JURISDICTION_AS) != 0) {
// 						response.sendRedirect("userManagement.jsp");
// 						return;
					}else{
						response.sendRedirect("404.html");
						return ;
					}
				%>
	
	<div class="container">




		<div class="header">
			<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标" name="logo"
				id="Insert_logo" style=" display:block;" />
		</div>
		<!-- end .header -->
		<div class="lianjie">
			<span>您的位置:&nbsp;<a href="../../CommonPage">首页</a>&gt;&gt;<a
				href="./">教务管理系统</a>&gt;&gt;<a href="#">用户管理</a>
				<span style="float:right;margin-right:50px;"><%=user.getAccount() %>
				| <%=user.getName() %>  </span>
		</div>
		<div class="sidebar1">

			<img src="<%=stylePath%>images/jiaowuchu.png">
			<!-- 学生网上服务中心 -->
			<ol class="rounded-list">
				<li><a href="notice.jsp">教务公告</a></li>
				<li><a href="questionAnswer.jsp">教务答疑</a></li>
				<li><a href="applicationList.jsp">借教室</a></li>
				<li><a href="feedback.html">教学信息反馈</a></li>
				<li><a href="userManagement.jsp">用户管理</a></li>
				<li><a href="<%=commonPagePath%>singleCenter.jsp" target="blank">个人中心</a></li>

			</ol>




			<p>&nbsp;</p>
			<!-- end .sidebar1 -->
		</div>

		<div class="content" style="padding-top:1px;">



			<div class="qANavigation">
				<ul>
					<li class="selected ">查看用户</li>
					<li>导入用户</li>
					<li>新增用户</li>


				</ul>
				<input type="text" class="search" placeholder="请输入关键词"></input> <input
					type="button" class="blue bigrounded" value="搜索" />

			</div>
			<div id="tab-content">
				<!-- 三个切换卡 -->

				<table class="stripe_tb" id="playList">

					<tr class="contentTitle">
						<td>选择</td>
						<td>序号</td>
						<td>姓名</td>
						<td>学号</td>
						<td>性别</td>
						<td>邮箱</td>
						<td>操作</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox1" value="1">
						</td>
						<td>1</td>
						<td class=" "><a href="qA_1.html"> 天航狗</a></td>
						<td>110</td>

						<td class="">男</td>
						<td>去阿斯蒂芬.com</td>
						<td class="">修改</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox1" value="1">
						</td>
						<td>1</td>
						<td class=" "><a href="qA_1.html"> 天航狗</a></td>
						<td>110</td>

						<td class="">男</td>
						<td>去阿斯蒂芬.com</td>
						<td class="">修改</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox1" value="1">
						</td>
						<td>1</td>
						<td class=" "><a href="qA_1.html"> 天航狗</a></td>
						<td>110</td>

						<td class="">男</td>
						<td>去阿斯蒂芬.com</td>
						<td class="">修改</td>
					</tr>
					<tr>
						<td colspan="7"><input type="button" value="全选"
							id="selectAll" /> <input type="button" value="全不选" id="unSelect" />
							<input type="button" value="反选" id="reverse" /> <input
							type="button" class="blue button " value="导出" id="" /></td>
					</tr>
				</table>





				<table class="stripe_tb hide" style="background-color:#ebebeb;">

					<tr>
						<td style="width:200px;height:300px;"><img
							src="<%=stylePath%>images/into.png"></td>
						<td>
							<p style="text-align:left;">1.导入用户只支持导入EXCEL表文件格式.</p>
							<p style="text-align:left;">2.请将EXCEL表格中的实体属性与用户管理列表的实体属性保持一致.</p>
<!-- 							<form method="post" action="../CommonPage/operateUser" enctype="multipart/form-data"> -->
							<form method="post" action="doUpload.jsp"
								enctype="multipart/form-data">
								<td align="center"><input type="file" name="file2"
									size="30"></td>
								<td align="center"><input type="submit" name="Submit"
									value="导入" class="blue"></td>
								<!-- 								<input type="file" id="f2" class="button "> </input>  -->
								<!-- 								<input type="submit" name="submit" value="导入" class="blue"> </input>  -->
								<input name="method" value="addStudentsInBulk" hidden> </input>
								<input name="putFilePath" value="/upload" hidden> </input> <input
									name="sevletName" value="/DigitalCampu_Nenu/CommonPage/operateUser" hidden>
								</input>
							</form>
						</td>
					</tr>
				</table>
				
				<table class="stripe_tb hide" style="background-color:#148bdd;">

					<tr>
						<td style="width:200px;"><img
							src="<%=stylePath%>images/join.png"></td>
						<td>
							<form id="addOneUser" method="post" action="../CommonPage/operateUser">
								<legend></legend>
								<p>
									<label for="account">帐号:&nbsp;&nbsp;&nbsp; <input
										type="text" id="account" name="account" placeholder="输入文本……">
									</label>
								</p>
								<p>
									<label for="password">密码:&nbsp;&nbsp;&nbsp; <input
										type="password" id="password" name="password" placeholder="输入文本……">
									</label>
								</p>
								<p>
									<label for="name">姓名:&nbsp;&nbsp;&nbsp; <input
										type="text" id="name" name="name" placeholder="输入文本……">
									</label>
								</p>
								<p>
									<label for="sNumber">学号:&nbsp;&nbsp;&nbsp;
										<input type="text" id="sNumber" name="sNumber" placeholder="输入文本……">
									</label>
								</p>
								<p>
									<label for="sex">性别:&nbsp;&nbsp;</label>
										<input type="radio" name="sex" checked="checked" value="女" />女
										<input type="radio" name="sex" value="男" />男
									</label>
								</p>

								<p>
									<label for="submit"> <input type="button" name="button"
										value="注册" class="blue button" onclick="checkform();">
									</label>
								</p>
								<input name="method" value="addUser" hidden> </input>

							</form>

						</td>
					</tr>
				</table>
			</div>
			
			<script type="text/javascript">
			function checkform(){
				var name=document.getElementById("name");
				var sNumber=document.getElementById("sNumber");
				var account=document.getElementById("account");
				var password=document.getElementById("password");
				if(name == null || name.value==""){
					alert("请输入姓名");
				}
// 				else if(sex == null || sex.value==""){
// 					alert("请选择性别");
// 				}
				else if(sNumber == null || sNumber.value==""){
					alert("学号不能为空");
				}
				else if(account == null || account.value==""){
					alert("请输入帐号");
				}
				else if(password == null || password.value==""){
					alert("请输入密码");
				}
				else {
					document.getElementById("addOneUser").submit();
				}
			}

		</script>
			
			<!-- 结束三个切换卡 -->

			<script type="text/javascript">
				$('.qANavigation li').click(
						function() {
							$(this).addClass("selected").siblings()
									.removeClass("selected");//removeClass就是删除当前其他类；只有当前对象有addClass("selected")；siblings()意思就是当前对象的同级元素，removeClass就是删除；
							$("#tab-content > table").hide().eq(
									$('.qANavigation li').index(this)).show();
						});
			</script>



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
