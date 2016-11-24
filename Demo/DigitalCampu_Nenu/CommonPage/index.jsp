<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import=" com.nenu.entity.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String stylePath = path + "/style/";
	User user = (User)(session.getAttribute("DCUser"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>信息与软件工程学院数字化教学平台</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is a homepage">
<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/index.css">

</head>

<body>

	<div class="container">
		<div class="header">
			<!--<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标"
				name="Insert_logo" id="Insert_logo" style=" display:block;" />
			-->

		</div>
		<div class="content">

			<div class="nav">
				<ul>
					<%
					String pathOfIndex = "./EducationalAdministration/index.jsp";;
					if (user != null
							&& (user.getJurisdiction().intValue() & User.USER_JURISDICTION_AS) != 0) {
						pathOfIndex = "./EducationalAdministration/AS/index.jsp";
					}
					%>
					<li><a class=""> 首页 </a></li>
					<li><a href=<%= pathOfIndex%>>教务管理系统</a></li>
					<li><a href="http://nenu.gaoxiaobang.com/">在线学习平台</a></li>
					<li><a href="#">质量保障体系</a></li>
					<!-- <li><a href="index3.html">个人中心</a></li> -->
					<li><a onmouseover="show1()" onmouseout="show2()" id="show">简介</a></li>
					<li>
						<form name='form1' action='<%=path%>/login.action' method='post'>
							<input type='hidden' name='method' value='logout' /> <a
								href='javascript:document.form1.submit();'>注销</a>
						</form>
					</li>
				</ul>
			</div>
			<!-- begin zhiliang-->
			<div class="show">
				<link rel="stylesheet" href="<%=stylePath%>css/slide.css" />
				<style>
				.ck-slide {
					max-width:1366px;
					height: 370px;
				}
				
				.ck-slide ul.ck-slide-wrapper {
					height: 370px;
				}
				</style>

				<!-- html -->
				<div class="ck-slide">
					<ul class="ck-slide-wrapper">
						<li><a href="javascript:;"><img
								src="<%=stylePath%>images/11.jpg" alt=""></a></li>
						<li style="display:none"><a href="javascript:;"><img
								src="<%=stylePath%>images/33.gif" alt=""></a></li>
						<li style="display:none"><a href="javascript:;"><img
								src="<%=stylePath%>images/44.jpg" alt=""></a></li>

					</ul>
					<a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a
						href="javascript:;" class="ctrl-slide ck-next">下一张</a>
					<div class="ck-slidebox">
						<div class="slideWrap">
							<ul class="dot-wrap">
								<li class="current">1</li>
								<li>2</li>
								<li>3</li>
								<!-- <li><em>4</em></li>
						<li><em>5</em></li> -->
							</ul>
						</div>
					</div>


				</div>

				<!-- js -->
				<script src="<%=stylePath%>js/jquery-1.8.3.min.js"></script>
				<script src="<%=stylePath%>js/slide.js"></script>
				<script>
					$('.ck-slide').ckSlide({
						autoPlay : true
					});
				</script>

				<div class="jieshao" id="intro">


					<h4>数字化教学平台简介：</h4>
					1. 教务管理系统：<br> 完成本科教学的日常管理，包含教务通知、教学反馈、教务答疑、在线查看考场及教室使用等功能<br>
					2. 在线学习平台：<br>
					丰富学生学习，开阔视野，放眼未来。为学生和教师提供多门专业前沿的MOOC课程，进行知识元学习，师生互动，单元检测，教学辅导等多种学习体验。<br>
					3. 质量保障体系:<br>
					质量保障体系包含教育教学管理制度、教学环节质量标准、内部质量监控机制、毕业生跟踪反馈机制、社会质量评价机制以及教育 质量评估报表。

				</div>
				<script type="text/javascript">
					function show1() {
						var show1 = document.getElementById("intro");
						show1.style.display = "block";

					}
					function show2() {
						var show2 = document.getElementById("intro");
						show2.style.display = "none";

					}
				</script>
			</div>
			<!-- end show-->

			<!-- begin jiaowu-->
			<div class="jiaowu">
				<div class="title">
					教务公告<a href="EducationalAdministration/noticeList.jsp" class="more">更多&nbsp;>></a>
				</div>
				<div class="publicInfo">
					<ul>
						<li class="date">2016-05</li>
						<li>

							<h1>关于做好2016届本科生毕业论文 ...</h1>
							<p>为进一步加强我校本科生毕业论文（设计）质量管理，现将2016届本科生毕业论文
								“查重”工作、答辩工作、优秀本科生毕业论文（设计）评审工作具体安排如下：</p> <a href="EducationalAdministration/noticeList.jsp">查看详情></a>
						</li>
					</ul>
				</div>
				<div class="publicInfo">
					<ul>
						<li class="date">2016-05</li>
						<li>

							<h1>2015-2016学年第一学期期末考试...</h1>
							<p>2015-2016学年度
								考试周自2016年7月7日起至7月15日，学校对期末考试工作高度重视。为营造公平、公正的考试秩序，学校成立了由教师、学生、学院负责人组成的校、院两级督导组赴各考场进行检查。</p>
							<a href="EducationalAdministration/noticeList.jsp">查看详情></a>
						</li>
					</ul>
				</div>
				<div class="publicInfo">
					<ul>
						<li class="date">2016-05</li>
						<li>

							<h1>全国大学英语四、六级考试考生须知</h1>
							<p>参加全国大学英语四、六级考试的考生须在考试前认真阅读以下内容，避免在不知晓相关规定情况下造成无法考试或考试成绩无效情况的出现：</p>
							<a href="EducationalAdministration/noticeList.jsp">查看详情></a>
						</li>
					</ul>
				</div>
			</div>
			<!-- end jiaowu-->
			<!-- begin xuexi-->
			<div class="xuexi">
				<div class="title">
					在线学习平台<a href="http://nenu.gaoxiaobang.com/" class="more">更多&nbsp;>></a>
				</div>
				<div class="lesson">
					<a href="http://nenu.gaoxiaobang.com/#/courses/detail/3474"><img src="<%=stylePath%>images/lesson1.jpg"><br></a>
					<h2>均衡负载课程</h2>
					均衡负载阿里云计划<br>更新完毕&nbsp;已有425人学习
				</div>
				<div class="lesson">
					<a href="http://nenu.gaoxiaobang.com/#/courses"><img src="<%=stylePath%>images/dataStruct.jpg"><br>
						<h2>数据结构课程</h2>数据结构之入栈，出栈<br>更新完毕&nbsp;已有234人学习</a>

				</div>
				<div class="lesson">
					<a href="http://nenu.gaoxiaobang.com/#/courses"><img src="<%=stylePath%>images/Java.jpg"><br>
						<h2>JAVA课程</h2>JAVA中你必须懂得小技巧<br>更新完毕&nbsp;已有305人学习</a>

				</div>
			</div>
			<!-- end xuexi-->
			<!-- begin zhiliang-->
			<div class="zhiliang">

				<div class="title">
					质量保障体系<a href="#" class="more">----</a>
				</div>
				<div class="publicInfo">
					<ul>
						<li class="date">2016-05</li>
						<li><h2>教育教学管理制度</h2>
							<a href="#">暂不开放</a></li>
						<li class="date">2016-05</li>
						<li><h2>毕业生跟踪反馈机制</h2>
							<a href="#">暂不开放</a></li>
					</ul>
				</div>
				<div class="publicInfo">
					<ul>
						<li class="date">2016-05</li>
						<li><h2>教学环节质量标准</h2> <a href="#">暂不开放</a></li>
						<li class="date">2016-05</li>
						<li><h2>社会质量评价机制</h2>
							<a href="#">暂不开放</a></li>
					</ul>
				</div>
				<div class="publicInfo">
					<ul>
						<li class="date">2016-05</li>
						<li><h2>内部质量监控机制</h2> <a href="#">暂不开放</a></li>
						<li class="date">2016-05</li>
						<li><h2>教育教学质量评估报表</h2>
							<a href="#">暂不开放</a></li>
					</ul>
				</div>

			</div>
			<!-- end zhiliang-->
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
