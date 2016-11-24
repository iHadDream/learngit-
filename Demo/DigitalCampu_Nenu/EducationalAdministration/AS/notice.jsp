<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.nenu.entity.*"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String stylePath = path + "/style/";
User user = (User)session.getAttribute("DCUser");
String commonPagePath = path + "/CommonPage/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教务公告 | 教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=stylePath %>js/jquery-1.7.1.js"></script>
<script src="<%=stylePath %>js/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>

<script src="<%=stylePath %>js/jquery-1.8.3.min.js" type="text/javascript"
	charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="<%=stylePath %>css/educated.css">
<link rel="stylesheet" type="text/css" href="<%=stylePath %>css/questionAnswer.css">
<script src="<%=stylePath %>js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<%=stylePath %>css/xcConfirm.css" />

<style>
.qANavigation .search {
	margin-top: 6px;
	margin-left: 360px;
}

.btn6 {
	cursor: pointer;
}

.news {
	width: 600px;
}
</style>

<script type="text/javascript">
   
      
            //隔行变色  
        $(document).ready(function(){  
                  
                 $(".stripe_tb tr").mouseover(function(){ //如果鼠标移到class为stripe_tb的表格的tr上时，执行函数  
                 $(this).addClass("over");}).mouseout(function(){ //给这行添加class值为over，并且当鼠标一出该行时执行函数  
                 $(this).removeClass("over");}) //移除该行的class  
                 $(".stripe_tb tr:even").addClass("alt"); //给class为stripe_tb的表格的偶数行添加class值为alt  
                  
            });  
        
   
   </script>
</head>

<body>
				<%
					 
					if (user != null
							&& (user.getJurisdiction().intValue() & User.USER_JURISDICTION_AS) != 0) {
						 
					}else{
						response.sendRedirect("www.baidu.com");
					}
				%>


	<div class="container">


		<img src="<%=stylePath %>images/banner2.jpg" alt="在此处插入徽标" name="Insert_logo"
			id="Insert_logo" style=" display:block;" />

		<div class="header">
			<!-- end .header -->
		</div>
		<div class="lianjie">
			<span>您的位置:&nbsp;<a href="../../CommonPage">首页</a>&gt;&gt;<a
				href="./">教务管理系统</a>&gt;&gt; <a href="#">教务公告</a></span>
		</div>
		<div class="sidebar1">

			<img src="<%=stylePath %>images/jiaowuchu.png">
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
					<li class="selected">教务公告</li>
					<li>发公告</li>

				</ul>
				<form method="post" action="notice.jsp">
				<input type="text" class="search" placeholder="请输入关键词" name="keyword"></input>
				<input type="submit" class="blue bigrounded" value="搜索" />
				</form>

			</div>
			<div id="tab-content">

<%
					String keyword = request.getParameter("keyword");
					List<Notice> listOfNotice = null;
           			if(keyword==null) {
           				listOfNotice = Notice.getListOfNoticeFromDatebase();
           			 }
           			else {
           				listOfNotice = Notice.getListOfNoticeWithKeyWords(keyword);
           			}
           	%>
				<% 
					if(listOfNotice.isEmpty()) {
						out.println("<br><br>什么都没有搜索到。");
					}
					else {
						Iterator<Notice> iterator = listOfNotice.iterator();
						%>
				<table class="stripe_tb">
					<tr style="height:0;">
						<th style="width:350px"></th>
						<th style="width:100px"></th>
						<th style="width:100px"></th>
						<th style="width:40px"></th>
					</tr>

					<tr class="contentTitle">
						<td>标题</td>
						<td>发布部门</td>
						<td>发布日期</td>
						<td>删除</td>
					</tr>

					<%
						while(iterator.hasNext()) {
							Notice noticeBuffer = iterator.next();
							%>

					<tr>
						<td class="news"><a href="../noticeDetail.jsp?id=<%=noticeBuffer.getId() %>" target="_blank"
							name="news"><%=noticeBuffer.getTitle() %></a></td>
						<td class="news"><%=noticeBuffer.getSignature()%></td>
						<td class="date"><%=noticeBuffer.getDate().toString() %></td>
						<td>
						<form method="post"  name="form<%=noticeBuffer.getId() %>"  action="../operateNotice" hidden>
							<input name="method" value="deleteNotice"  />
							<input name="id" value="<%=noticeBuffer.getId() %>"  />
							</form>
						<a href='javascript:document.form<%=noticeBuffer.getId() %>.submit();' target="_blank"
							name="news">删除</a>
						</td>

					</tr>



					<%
						}
					%>
					
				</table>
				<%
					}
				%>


				<!-- 发公告 -->
				<table class="question hide">
					<form name="NewNotice" method="post" action="../operateNotice">
						<tr>
							<td style="height:50px;font-size:14px;font-weight:bolder;">

								主题：<input type="text" placeholder="请输入公告的标题..." id="title"
								name="title"
								style="width:350px;height:20px;font-size:14px;line-height:16px;" />
								&nbsp;&nbsp;&nbsp;&nbsp;
								部门：<input type="text" placeholder="发布部门" id="signatrue"
								name="signatrue"
								style="width:100px;height:20px;font-size:14px;line-height:16px;" />
								<input type="password" name="method" value="addNewNotice" readonly hidden/>
							</td>
						</tr>
						<tr>
							<td colspan="3"><textarea style="width:768px;height:300px;" name="text"
									placeholder="请在此写下公告的具体内容..."></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" class="button blue bigrounded"
								value="发布"  /></td>
							<td><input type="reset" class="button blue bigrounded"
								value="重置" /></td>
						</tr>
					</form>

				</table>





			</div>
			<!--   -->
			<script type="text/javascript">
     
         $('.qANavigation li').click(function(){
         $(this).addClass("selected").siblings().removeClass("selected");//removeClass就是删除当前其他类；只有当前对象有addClass("selected")；siblings()意思就是当前对象的同级元素，removeClass就是删除；
         $("#tab-content > table").hide().eq($('.qANavigation li').index(this)).show();
         });

         $(".myQuestion").click(function(){
            $(".qANavigation > input").hide();
         });
        
          
        </script>




			<!-- end .content -->
		</div>
		<!-- end .content -->

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
