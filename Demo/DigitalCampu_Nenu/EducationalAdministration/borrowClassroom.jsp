<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page import="com.nenu.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.displaytag.sample.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String stylePath = path + "/style/";
String showDetailOfApplication = "applicationDetail.jsp";
User user = (User)session.getAttribute("DCUser");
String commonPagePath = path + "/CommonPage/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>借教室 | 教务管理系统</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=stylePath %>js/jquery-1.7.1.js"></script>
<script src="<%=stylePath %>js/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=stylePath %>css/lendClass.css">
<link rel="stylesheet" href="<%=stylePath %>css/educated.css"
	type="text/css">
<script src="<%=stylePath %>js/jquery-1.8.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="<%=stylePath %>css/questionAnswer.css">
<style type="text/css">
.headerStyle1 {
	width:500;
}

.headerStyle2 {
	width:200;
}

.headerStyle3 {
	width:40;
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
			<a href="<%=path %>/"><img
				src="<%=stylePath %>images/banner2.jpg" alt="在此处插入徽标"
				name="Insert_logo" id="Insert_logo" style=" display:block;" /></a>
		</div>
		<!-- end .header -->
		<div class="lianjie">
			<span>您的位置:&nbsp;<a href="<%=path%>">首页</a>&gt;&gt;<a
				href="./">教务管理系统</a>&gt;&gt; <a href="">借教室</a></span> <span
				style="float:right;margin-right:50px;"><%=user.getAccount() %>
				| <%=user.getName() %> </span>
		</div>
		<div class="sidebar1">

			<img src="<%=stylePath %>images/jiaowuchu.png">
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
					<li class="selected">所有申请</li>
					<li>未审核</li>
				</ul>
			</div>
			<div id="tab-content">


				<!-- 所有申请的列表 -->
				<%
				//获得列表，并根据时间排序
			List<CRApplication> myListOfApplication = CRApplication.getMyListOfApplication(user.getAccount());
				Collections.sort(myListOfApplication, new Comparator<CRApplication>() {
		            public int compare(CRApplication arg0, CRApplication arg1) {
		                return arg1.getExceptDate().compareTo(arg0.getExceptDate());
		            }
		        });
			request.setAttribute("myListOfApplication", myListOfApplication);
			 %>
				<div class="stripe_tb">
					<display:table name="myListOfApplication" pagesize="3" >

						<display:column href="<%=showDetailOfApplication%>" title="原因"
							paramId="id" paramProperty="id" property="reason"
							class="news"  headerClass="headerStyle1" />
						
						<display:column property="applyTime" title="申请时间" class="data"
							headerClass="headerStyle2" />
							
						<display:column headerClass="headerStyle3" />

						<display:setProperty name="paging.banner.items_name" value="教室申请" />
						<display:setProperty name="paging.banner.placement" value="bottom" />



						<display:setProperty name="paging.banner.first">
							<div align=center class="pagelinks">
								{0} [<a href="{3}">下一页</a>|<a href="{4}">尾页</a>]
							</div>
						</display:setProperty>

						<display:setProperty name="paging.banner.full">
							<div align=center class="pagelinks">
								[<a href="{1}">首页</a>|<a href="{2}">上一页</a>] {0} [<a href="{3}">下一页</a>|<a
									href="{4}">尾页</a>]
							</div>
						</display:setProperty>

						<display:setProperty name="paging.banner.last">
							<div align=center class="pagelinks">
								[<a href="{1}">首页</a>|<a href="{2}">上一页</a>] {0} 
							</div>
						</display:setProperty>
						<display:setProperty name="paging.banner.onepage">
							<div align=center class="pagelinks"></div>
						</display:setProperty>


						<display:setProperty name="paging.banner.some_items_found">
							<p class="pagebanner">您有{0}条{1}已被处理, 本页显示第{2}条到第{3}条</p>
						</display:setProperty>
						<display:setProperty name="paging.banner.all_items_found">
							<p class="pagebanner">您有{0}条{1}已被处理, 已呈现所有{2}</p>
						</display:setProperty>
					</display:table>
				</div>

				<div class="stripe_tb hide">
					<!-- 已审核的列表 -->
				<%
			List<CRApplication> myListOfWaitingApplication = CRApplication.getMyListOfWaitingApplication(user.getAccount());
			request.setAttribute("myListOfWaitingApplication", myListOfWaitingApplication);
			 %>
<!-- 				<div class="stripe_tb"> -->
					<display:table name="myListOfWaitingApplication" pagesize="3">

						<display:column href="<%=showDetailOfApplication%>" title="原因"
							value="同意" paramId="id" paramProperty="id" property="reason"
							class="news" style="width:500px" />

						<display:column property="applyTime" title="申请时间" class="data"
							style="width:200px" />

						<display:setProperty name="paging.banner.items_name" value="教室申请" />
						<display:setProperty name="paging.banner.placement" value="bottom" />



						<display:setProperty name="paging.banner.first">
							<div align=center class="pagelinks">
								{0} [<a href="{3}">下一页</a>|<a href="{4}">尾页</a>]
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
							<p class="pagebanner">您有{0}条{1}已被处理, 本页显示第{2}条到第{3}条</p>
						</display:setProperty>
						<display:setProperty name="paging.banner.all_items_found">
							<p class="pagebanner">您有{0}条{1}已被处理, 已呈现所有{2}</p>
						</display:setProperty>
					</display:table>
				</div>
<!-- 				</div> -->
				
				<!-- end .content -->
			</div>
			<!-- 按钮 -->
				<div class="btn_1">
					<input type="button" class="button blue bigrounded" value="我要借教室"
						onclick="location.href='applyClassroom.jsp'" />
				</div>
		</div>
		<script type="text/javascript">
     
         $('.qANavigation li').click(function(){
         $(this).addClass("selected").siblings().removeClass("selected");//removeClass就是删除当前其他类；只有当前对象有addClass("selected")；siblings()意思就是当前对象的同级元素，removeClass就是删除；
         $("#tab-content > div").hide().eq($('.qANavigation li').index(this)).show();
         });
          
        </script>

		<!-- end .container -->
	</div>
</html>
