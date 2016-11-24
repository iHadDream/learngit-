<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.nenu.entity.*"%>
 
 
<%@ page import="java.util.*"%>
 
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String stylePath = path + "/style/";
User user = (User) session.getAttribute("DCUser");
String commonPagePath = path + "/CommonPage/";
 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>教务公告 | 教务管理系统</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />

<script src="<%=stylePath%>js/jquery-1.7.1.js"></script>
<script src="<%=stylePath%>js/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script src="<%=stylePath%>js/jquery-1.8.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/educated.css">
<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/questionAnswer.css">
<script src="<%=stylePath%>js/xcConfirm.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/xcConfirm.css" />
<style>
.qANavigation .search {
	margin-top: 6px;
	margin-left: 460px;
}

.btn6 {
	cursor: pointer;
}

.news {
	width: 450px;
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
						response.sendRedirect("www.baidu.com");
					}
				%>
	<div class="container">


		<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标"
			name="Insert_logo" id="Insert_logo" style=" display:block;" />

		<div class="header">
			<!-- end .header -->
		</div>
		<div class="lianjie">
			<span>您的位置:&nbsp;<a href="../">首页</a>&gt;&gt;<a href="./">教务管理系统</a>&gt;&gt;
				<a href="">教务公告</a></span>
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

		<div class="content" style="padding-top:1px;">
			<div class="qANavigation">
				<ul>
					<li class="selected">教务公告</li>

				</ul>
				<form method="post" action="noticeList.jsp">
					<input type="text" class="search" placeholder="请输入关键词"
						name="keyword"></input> <input type="submit"
						class="blue bigrounded" value="搜索" />
				</form>
			</div>


			<div id="tab-content">
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
				
				
				<table class="stripe_tb">
					<tr style="height:0;">
						<th style="width:300px"></th>
						<th style="width:100px"></th>
						<th style="width:100px"></th>
						<th style="width:90px"></th>
					</tr>

					<tr class="contentTitle">
						<td>标题</td>
						<td>发布部门</td>
						<td>发布日期</td>
						<td>阅读次数</td>
					</tr>
							
				
				 
									<%  
									//显示页码导航，其中的问号表示由当前页面处理。  
									int page_persize=5;//每页显示记录数  
									int page_total=0;//总的页数  
									int page_now=1;//当前页码  
									int rs_total=listOfNotice.size();//总记录数

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
										Notice noticeBuffer = listOfNotice.get(i);
									%>
										<tr>
											<td class="news"><a
												href="./noticeDetail.jsp?id=<%=noticeBuffer.getId()%>"
												target="_blank" name="news"><%=noticeBuffer.getTitle()%></a></td>
											<td class="news"><%=noticeBuffer.getSignature()%></td>
											<td class="date"><%=noticeBuffer.getDate().toString()%></td>
											<td><%=noticeBuffer.getReadCount()%></td>
					
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
			<!--   -->

			<!-- end .content -->
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
