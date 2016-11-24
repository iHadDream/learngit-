<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.nenu.entity.*"%>
<%
	String stylePath = path + "/style/";
String commonPagePath = path + "/CommonPage/";
	User user = (User)session.getAttribute("DCUser");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>个人设置 | 个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset="utf-8">
<link rel="stylesheet" href="<%=stylePath %>css/educated.css" type="text/css">
<link rel="stylesheet" href="<%=stylePath %>css/questionAnswer.css" type="text/css">
<link rel="stylesheet" href="<%=stylePath %>css/singleCenter.css" type="text/css">
<title>个人中心</title>

<style type="text/css">
.wrap {
	position: relative;
	width: 1200px;
	margin: 0px auto;
	height: 650px;
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
	width: １00px;
	left: ２0px;
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
.u-container {
	margin-top: 20px;
	margin-left: 240px;
	min-height: 589px;
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

					<li><a href="<%=commonPagePath%>singleCMessage.jsp"> <i class="icon-home"></i>
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
					<p class="dynamic-title">最新动态</p>
				</div>
				<div id="tab-content">
				<%
					List<PersonalMessage> listOfMessage = null;
					listOfMessage = PersonalMessage.getListOfPersonalMessageFromDatebase(user);
					
				%>
				<%
					if (listOfMessage.isEmpty()) {
						out.println("<br><br>消息列表为空！");
					} else {
				%>
				
				
				<table class="stripe_tb">
					<tr style="height:0;">
						<th style="width:300px"></th>
						<th style="width:100px"></th>
						<th style="width:100px"></th>
						<th style="width:90px"></th>
					</tr>

					<tr class="contentTitle">
						<td>发送人</td>
						<td>发送内容</td>
						<td>发送时间</td>
						<td>是否阅读</td>
					</tr>
							
				
				 
									<%  
									//显示页码导航，其中的问号表示由当前页面处理。  
									int page_persize=5;//每页显示记录数  
									int page_total=0;//总的页数  
									int page_now=1;//当前页码  
									int rs_total=listOfMessage.size();//总记录数

									if (rs_total % page_persize==0)  
									    page_total=rs_total/page_persize;  
									else  
									    page_total=rs_total/page_persize+1;
// 									page_total = (rs_total + page_persize - 1) / page_persize;

									try{  
										if (!(request.getParameter("page_now")==null || request.getParameter("page_now").equals("")))   
											page_now=Math.min(Math.abs(Integer.parseInt(request.getParameter("page_now"))),page_total);
										 
									}catch(java.lang.NumberFormatException e){  
										out.print("指定页码格式不正确"+e);  
									}  
									if (page_now==0) page_now=1; 
										
									int begin = page_persize * (page_now -1);
									int end = begin + page_persize;
									if(end > rs_total) end = rs_total;//防止越（上）界
									 
									for(int i = begin; i < end; i ++) {
										PersonalMessage messageBuffer = listOfMessage.get(i);
									%>
										<tr>
											<td class="news"><a
												href="./noticeDetail.jsp?id=<%=messageBuffer.getＭessageId()%>"
												target="_blank" name="news"><%=messageBuffer.getMessageSender()%></a></td>
											<td class="news"><%=messageBuffer.getMessageContent()%></td>
											<td class="date"><%=messageBuffer.getMessageTime().toString()%></td>
											<td><%=messageBuffer.getIsRead()%></td>
					
										</tr>
										
									
									<%
									
									}
									%>
									</table>
									<p align="center">
									<%
									out.print("总共"+rs_total+"条记录　");  
									if (page_total>1){  
									out.print("当前第"+page_now+"页　");  
									out.print("共"+page_total+"页　");  
									if(page_now!=1) {  
									        out.print("<a href=?page_now=1>首页</a>　");  
									        out.print("<a href=?page_now="+(page_now-1)+">上一页</a>　");
// 									        page_now=page_now-1;
									        
									    }  
									if(page_now!=page_total){  
									    out.print("<a href=?page_now="+(page_now+1)+">下一页</a>　");  
									    out.print("<a href=?page_now="+page_total+">尾页</a>　"); 
// 									    page_now=page_now+1;
									    }  
									 
									%>  
									</p>
									<% } %>  
							 
				
				<%
					}
				%>
				
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
	 
</body>
</html>
