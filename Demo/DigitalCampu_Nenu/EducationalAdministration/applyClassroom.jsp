<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.nenu.entity.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String stylePath = path + "/style/";
	String addApplication = path + "/EducationalAdministration/operateApplication";
	User user = (User)session.getAttribute("DCUser");
	String commonPagePath = path + "/CommonPage/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>申请教室 | 教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<![endif]-->

<link href="<%=stylePath%>css/normalize.css" rel="stylesheet" />
<link href="<%=stylePath%>css/jquery-ui.css" rel="stylesheet" />
<link href="<%=stylePath%>css/jquery.idealforms.min.css"
	rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/apply.css">
<link rel="stylesheet" href="<%=stylePath%>css/educated.css"
	type="text/css">
<style type="text/css">
body {
	font: normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;
	color: #222;
	background: <%=stylePath%>images/pattern1.png);
	overflow-y: scroll;
	padding: 0px 0 0 0;
	background-repeat: repeat-x repeat-y;
	background-size: 100%;
}

#rea {
	width: 400px;
	height: 70px;
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

	<div class="header">
		<a href="<%=path%>/"><img src="<%=stylePath%>images/banner2.jpg"
			alt="在此处插入徽标" name="Insert_logo" id="Insert_logo"
			style=" display:block;" /></a>
	</div>
	<!-- end .header -->
	<div class="lianjie">
		<span>您的位置:&nbsp;<a href="<%=path%>">首页</a>&gt;&gt;<a href="./">教务管理系统</a>&gt;&gt;
			<a href="borrowClassroom.jsp">借教室</a>&gt;&gt; <a href="#">填写申请</a></span><span
			style="float:right;margin-right:50px;"><%=user.getAccount()%>
			| <%=user.getName()%> </span>
	</div>


	<div class="row">

		<div class="eightcol last">
			<%
				final List<Classroom> classroomList = Classroom.getListOfClassroomFromDatebase();
				Iterator<Classroom> iterator = null;

				Calendar calendar = Calendar.getInstance(); 
				calendar.setTimeInMillis(new Date().getTime());
				calendar.add(Calendar.DATE, 2);
			%>



			<!-- Begin Form -->
			<form id="my-form" method="post" action="<%=addApplication%>">
				<section name="第一步">
				<div>
					<label>借用教室:</label> <select id="classroom" name="classroom"
						onchange="test()">
						<%
							iterator = classroomList.iterator();
							while(iterator.hasNext()) {
								Classroom classroom = iterator.next();
								out.println("<option value='" +  classroom.getId() + "'>" + classroom.getName() + "</option>");
							}
						%>
					</select>
				</div>
				<br>
				<div>
					<label>借用日期:</label> <select id="date" name="date">
						<%
							SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日   ");
							String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
							for(int count=1; count<=7; count++) {
								calendar.add(Calendar.DATE, 1);
								
								int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1 ;
								Date date = new Date(calendar.getTimeInMillis());
								
								out.println("<option value='" +  count + "'>" + dateFormat.format(date) 
										+ weekDays[dayOfWeek] + "</option>");
							}
						%>
					</select>
				</div>
				<br>
				<div>
					<label>借用时间:</label> <select id="time" name="time">
						<%
							for(int time = 1; time<=6; time++) {																					
								out.println("<option value='" + time + "'>" 
										+ CRApplication.getTime(new Integer(time)) + "</option>");
							}
						%>
					</select>
				</div>
				</section>

				<section name="第二步">

				<div>
					<label>借用人/部门:</label> <input id="username" name="username"
						type="text" value="<%=user.getName()%>" readonly
						style="background-color:#ebebeb	 ;" />
				</div>

				<div>
					<label>借用原因:</label>


					<textarea id="rea" name="reason"></textarea>
				</div>
				<br>
				</section>

				<%
					iterator = classroomList.iterator();
					boolean flagFirst= false;
					while(iterator.hasNext()) {
						Classroom classroom = iterator.next();
						out.println("<div id=\"class_" +  classroom.getId() + "\" class=\"tixing\" style=\"display:"
								+ (flagFirst==false?"block":"none") + "\">");
						out.println("<span>教室地点：" + classroom.getAddress()
								+ "&nbsp;|&nbsp;教室可容纳人数：" + classroom.getMaxCapacity() + "人</span>");
						out.println("</div>");
						flagFirst = true;
					}
				%>

				<script type="text/javascript">
					function test() {
				<%iterator = classroomList.iterator();
				while(iterator.hasNext()) {
					Classroom classroom = iterator.next();
					out.println("document.getElementById('class_" + classroom.getId() + "').style.display='none';");
				}%>
					var val = "class_"
								+ document.getElementById('classroom').value;

						document.getElementById(val).style.display = "block";

					}
				</script>


				<div>
					<hr />
				</div>

				<div>

					<button type="submit">提交</button>
					<div hidden>
						<select id="method" name="method">

							<option value="add"></option>

						</select>
					</div>
					<!-- <button id="reset" type="button">重置</button>  -->
				</div>
			</form>
			<!-- End Form -->
		</div>
	</div>

	<script type="text/javascript"
		src="<%=stylePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=stylePath%>js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=stylePath%>js/jquery.idealforms.js"></script>
	<script type="text/javascript">
		var options = {

			onFail : function() {
				alert($myform.getInvalid().length + ' 请填写借用人和原因')
			},

			inputs : {
				'reason' : {
					filters : 'required rea',
				},
				'username' : {
					filters : 'required username,',
					data : {
					//ajax: { url:'validate.php' }
					}

				},

			}

		};

		var $myform = $('#my-form').idealforms(options).data('idealforms');

		$('#reset').click(function() {
			$myform.reset().fresh().focusFirst()
		});

		$myform.focusFirst();
	</script>

</body>
</html>
