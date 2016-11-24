<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 
<%@ page import="com.nenu.entity.*"%>
 

<%
	String path = request.getContextPath();

// <<<<<<< .mine
// 	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
// 	String stylePath = path + "/style/";
	
// 	User user = (User) session.getAttribute("DCUser");
	
// 	List<QAndA>  listOfQA = null;
	
// 	Iterator<QAndA> iterator = null;
// =======
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String stylePath = path + "/style/";

User user = (User) session.getAttribute("DCUser");

List<QAndA>  listOfQA1 = null;
List<QAndA>  listOfQA2 = null;
List<QAndA>  listOfQA3 = null;

int i = 0;
int page_persize=5;//每页显示记录数  
int page_total=0;//总的页数  
int page_now=1;//当前页码 
Iterator<QAndA> iterator = null;
// >>>>>>> .r34
 
String commonPagePath = path + "/CommonPage/";
%>
 



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>



<title>教务问答 | 教务管理系统</title>


<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta http-equiv="pragma" content="no-cache">

<meta http-equiv="cache-control" content="no-cache">

<meta http-equiv="expires" content="0">

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<meta http-equiv="description" content="This is my page">



<script src="<%=stylePath%>js/jquery-1.7.1.js"></script>

<script src="<%=stylePath%>js/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>



<script src="<%=stylePath%>js/jquery-1.8.3.min.js"
	type="text/javascript" charset="utf-8"></script>



<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/educated.css">

<link rel="stylesheet" type="text/css"
	href="<%=stylePath%>css/questionAnswer.css">



<script type="text/javascript">
	//隔行变色 

	$(document).ready(function() {

		$(".stripe_tb tr").mouseover(function() { //如果鼠标移到class为stripe_tb的表格的tr上时，执行函数 

			$(this).addClass("over");

		}).mouseout(function() { //给这行添加class值为over，并且当鼠标一出该行时执行函数 

			$(this).removeClass("over");

		}); //移除该行的class 

		$(".stripe_tb tr:even").addClass("alt"); //给class为stripe_tb的表格的偶数行添加class值为alt 

	});
</script>

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





		<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标"
			name="Insert_logo" id="Insert_logo" style=" display:block;" />



		<div class="header">

			<!-- end .header -->

		</div>

		<div class="lianjie">

			<span>您的位置:&nbsp;<a href="../">首页</a>&gt;&gt;<a
				href="./">教务管理系统</a>&gt;&gt; <a
				href="questionAnswer.jsp">教务答疑</a></span>

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

		<%
			Boolean hasKeyword = false;

			String keyword = request.getParameter("keyword");
	
			if (keyword != null) {
	
			       hasKeyword = true;
	
			}
		%>



		<div class="content" style="padding-top:1px;">
			<% 
			int status = 1;
			if (!(request.getParameter("status")==null || request.getParameter("status").equals(""))) { 
				status=Math.min(Math.abs(Integer.parseInt(request.getParameter("status"))),4);
				status=Math.max(Math.abs(Integer.parseInt(request.getParameter("status"))),1);
			}
		 
			%>
			<div class="qANavigation">

				<ul>

<!-- 					<li <%if(!hasKeyword) out.print("class=\"selected\"");%>>热门问题</li> -->

<!-- 					<li <%if(hasKeyword) out.print("class=\"selected\"");%>>所有问题</li> -->

<!-- 					<li class="myQuestion">我要提问</li> -->

<!-- 					<li>我的问题</li> -->


					<li <%if(status == 1) out.print("class=\"selected\"");%>> <a href="?page_now=1&&status=1">热门问题</a></li>

					<li <%if(status == 2) out.print("class=\"selected\"");%>> <a href="?page_now=1&&status=2">所有问题</a></li>

					<li class="myQuestion <%if(status == 3) out.print("selected");%>"> <a href="?page_now=1&&status=3">我要提问</a></li>

					<li <%if(status == 4) out.print("class=\"selected\"");%>> <a href="?page_now=1&&status=4">我的问题</a></li>
					
					
 

				</ul>

				<form method="post" action="qa.jsp">

					<input type="text" class="search" placeholder="请输入关键词"
						name="keyword"></input> <input type="submit"
						class="blue bigrounded" value="搜索" />

				</form>



			</div>

			<div id="tab-content">

				<!-- 三个切换卡 -->

				<div class = "<%if(status != 1) out.print("hide");%>">

				<table class="stripe_tb">
<!-- 				<table class="stripe_tb  <%if(hasKeyword) out.print("hide");%>"> -->

					<tr style="height:0;">

						<th style="width:40px"></th>

						<th style="width:300px"></th>

						<th style="width:100px"></th>

						<th style="width:100px"></th>

						<th style="width:100px"></th>

						<th style="width:80px"></th>

					</tr>

					<tr class="contentTitle">

						<td>序号</td>

						<td>主题</td>

						<td>提问者</td>

						<td>回复者</td>

						<td>时间</td>

						<td>点击量</td>

					</tr>

					<%
						listOfQA1 = QAndA.getHotListOfQAFromDatebase(10);
					
						 
						
					%>
					<%  
									//显示页码导航，其中的问号表示由当前页面处理。  
									  
									int rs_total1=listOfQA1.size();//总记录数

									if (rs_total1 % page_persize==0)  
									    page_total=rs_total1/page_persize;  
									else  
									    page_total=rs_total1/page_persize+1;
// 									page_total = (rs_total + page_persize - 1) / page_persize;

									try{  
										if (!(request.getParameter("page_now")==null || request.getParameter("page_now").equals("")))   
											page_now=Math.min(Math.abs(Integer.parseInt(request.getParameter("page_now"))),page_total);
										 
									}catch(java.lang.NumberFormatException e){  
										out.print("指定页码格式不正确"+e);  
									}  
									if (page_now==0) page_now=1; 
										
									int begin = page_persize * (page_now - 1);
									int end = begin + page_persize;
									if(end > rs_total1) end = rs_total1;
									
// 									out.println(begin + " " + end);
									for(i = begin; i < end; i ++) {
										QAndA qaBuffer = listOfQA1.get(i);
									%>
					 
					<tr>

						<td><%=qaBuffer.getId()%></td>

						<td class="news"><a
							href="qAchild.jsp?id=<%=qaBuffer.getId()%>" target="blank"><%=qaBuffer.getqSubject()%></a></td>

						<td><%=qaBuffer.getUserName()%></td>

						<td class="reply"><%=qaBuffer.getResponder()%></td>

						<td class="date"><%=qaBuffer.getaTime()%></td>

						<td><%=qaBuffer.getCount()%></td>

					</tr>
					 
					<%									
									}
					%>
									</table>
									<p align="center">
									<%
									out.print("总共"+rs_total1+"条记录　");  
									if (page_total>1){  
									out.print("当前第"+page_now+"页　");  
									out.print("共"+page_total+"页　");  
									if(page_now!=1) {  
									        out.print("<a href=?page_now=1&&status=1>首页</a>　");  
									        out.print("<a href=?page_now="+(page_now-1)+ "&&status=1"+">上一页</a>　");
// 									        page_now=page_now-1;
									        
									    }  
									if(page_now!=page_total){  
									    out.print("<a href=?page_now="+(page_now+1)+ "&&status=1"+">下一页</a>　");  
									    out.print("<a href=?page_now="+page_total+ "&&status=1"+">尾页</a>　"); 
// 									    page_now=page_now+1;
									    }  
									 
									%>  
									</p>
									<% } %>  

				 
				 
									 
								 

				</div>
				
				<div class="<%if(status != 2) out.print("hide");%>">
<!-- 				<div class="<%if(!hasKeyword) out.print("hide");%>"> -->
				<table class="stripe_tb ">

					<tr style="height:0;">

						<th style="width:40px"></th>

						<th style="width:300px"></th>

						<th style="width:100px"></th>

						<th style="width:100px"></th>

						<th style="width:100px"></th>

						<th style="width:80px"></th>

					</tr>

					<tr class="contentTitle">

						<td>序号</td>

						<td>问题</td>

						<td>提问者</td>

						<td>回复者</td>

						<td>时间</td>

						<td>点击量</td>

					</tr>

					<%
						listOfQA2 = QAndA.getListOfQAFromDatebase();

						 
					%>
					<%  
									//显示页码导航，其中的问号表示由当前页面处理。  
									 
									int rs_total2=listOfQA2.size();//总记录数

									if (rs_total2 % page_persize==0)  
									    page_total=rs_total2/page_persize;  
									else  
									    page_total=rs_total2/page_persize+1;
 

									try{  
										if (!(request.getParameter("page_now")==null || request.getParameter("page_now").equals("")))   
											page_now=Math.min(Math.abs(Integer.parseInt(request.getParameter("page_now"))),page_total);
										 
									}catch(java.lang.NumberFormatException e){  
										out.print("指定页码格式不正确"+e);  
									}  
									if (page_now==0) page_now=1; 
// 									out.print("debug   " + page_now);
									  begin = page_persize * (page_now - 1);
									  end = begin + page_persize;
									if(end > rs_total2) end = rs_total2;
									
// 									out.println(begin + " " + end);
									for(i = begin; i < end; i ++) {
										QAndA qaBuffer = listOfQA2.get(i);
						%>
						<tr>
							 
							
							<td><%=qaBuffer.getId()%></td>
	
							<td class="news"><a
								href="qAchild.jsp?id=<%=qaBuffer.getId()%>" target="blank"><%=qaBuffer.getqSubject()%></a></td>
	
							<td><%=qaBuffer.getUserName()%></td>
	
							<td class="reply"><%=qaBuffer.getResponder()%></td>
	
							<td class="date"><%=qaBuffer.getaTime()%></td>
	
							<td><%=qaBuffer.getCount()%></td>
							 
						</tr>
					  

				  
					<%									
									}
					%>
									</table>
									<p align="center">
									<%
									out.print("总共"+rs_total2+"条记录　");  
									if (page_total>1){  
									out.print("当前第"+page_now+"页　");  
									out.print("共"+page_total+"页　");  
									if(page_now!=1) {  
									        out.print("<a href=?page_now=1&&status=2>首页</a>　");  
									        out.print("<a href=?page_now="+(page_now-1)+ "&&status=2"+">上一页</a>　");
									    }  
									if(page_now!=page_total){  
// 									    out.print("debug2   " + page_now);
									    out.print("<a href=?page_now="+(page_now+1)+"&&status=2"+">下一页</a>　");  
									    out.print("<a href=?page_now="+page_total+"&&status=2"+">尾页</a>　"); 
									}  
									 
									%>  
									</p>
									<% } %>  
			  
				</div>



<!-- 				<div class="hide"> -->
				<div class = "<%if(status != 3) out.print("hide");%>">
				<form action="operateQandA" method="post">
					<table class="question" >
					
						<tr>
							<td style="height:80px;font-size:20px;font-weight:bolder;">
								主题：<input type="text" name="qSubject" placeholder="请输入问题的标题..."
								style="width:200px;height:40px;font-size:16px;line-height:16px;" />
							</td>
						</tr>
						<tr>
							<td colspan="3"><textarea style="width:768px;height:200px;"
									name="qDetail" placeholder="请在此写下问题的具体内容..."></textarea></td>
						</tr>
						<tr>
							<td>是否匿名： <input type="radio" name="anonymous" value="1" />是

								<input type="radio" name="anonymous" value="0" checked="checked" />否

							</td>

							<td><input type="submit" class="button blue bigrounded"
								value="提问" /></td>

							<td><input type="reset" class="button blue bigrounded"
								value="重置" /></td>

						</tr>
							<input name="method" value="addQ" hidden></input> 

					

				</table>
				</form>
				</div>
				
				<!-- 我的提问 -->
				
				
				
				<div class = "<%if(status != 4) out.print("hide");%>">
<!-- 				<div class="<%if(!hasKeyword) out.print("hide");%>"> -->
					<table class="stripe_tb">

					<tr style="height:0;">

						<th style="width:40px"></th>

						<th style="width:300px"></th>

						<th style="width:100px"></th>

						<th style="width:100px"></th>

						<th style="width:100px"></th>

						<th style="width:80px"></th>

					</tr>

					<!-- 限制表格宽度 -->

					<tr class="contentTitle">

						<td>序号</td>

						<td>问题</td>

						<td>匿名</td>

						<td>回复者</td>

						<td>时间</td>

						<td>状态</td>

					</tr>

					<%
						listOfQA3 = QAndA.getListOfQAByAccount(user.getAccount());

						 
					%>
					<%  
									//显示页码导航，其中的问号表示由当前页面处理。  
									 
									int rs_total3=listOfQA3.size();//总记录数

									if (rs_total3 % page_persize==0)  
									    page_total=rs_total3/page_persize;  
									else  
									    page_total=rs_total3/page_persize+1;
 

									try{  
										if (!(request.getParameter("page_now")==null || request.getParameter("page_now").equals("")))   
											page_now=Math.min(Math.abs(Integer.parseInt(request.getParameter("page_now"))),page_total);
										 
									}catch(java.lang.NumberFormatException e){  
										out.print("指定页码格式不正确"+e);  
									}  
									if (page_now==0) page_now=1; 
										
									  begin = page_persize * (page_now - 1);
									  end = begin + page_persize;
									if(end > rs_total3) end = rs_total3;
									
// 									out.println(begin + " " + end);
									for(i = begin; i < end; i ++) {
										QAndA qaBuffer = listOfQA3.get(i);
						%>
					<tr>

						<td><%=qaBuffer.getId()%></td>

						<td class="news"><a
							href="qAchild.jsp?id=<%=qaBuffer.getId()%>" target="blank"><%=qaBuffer.getqSubject()%></a></td>

						<td>
							<%
								if(qaBuffer.isAnonymous()) out.print("是");

							                                         else out.print("否");
							%>
						</td>

						<td><%=qaBuffer.getResponder()%></td>

						<td class="date"><%=qaBuffer.getaTime()%></td>

						<td>
							<%
								if(qaBuffer.getStatus().intValue()==QAndA.AQ_STATUS_WAITE) {out.print("未回复");}

								if(qaBuffer.getStatus().intValue()==QAndA.AQ_STATUS_ANSWERED) {out.print("已回复");}
							%>
						</td>

					</tr>

					<%									
									}
					%>
									</table>
									<p align="center">
									<%
									out.print("总共"+rs_total3+"条记录　");  
									if (page_total>1){  
									out.print("当前第"+page_now+"页　");  
									out.print("共"+page_total+"页　");  
									if(page_now!=1) {  
									        out.print("<a href=?page_now=1&&status=4>首页</a>　");  
									        out.print("<a href=?page_now="+(page_now-1)+ "&&status=4"+">上一页</a>　");
// 									        page_now=page_now-1;
									        
									    }  
									if(page_now!=page_total){  
									    out.print("<a href=?page_now="+(page_now+1)+"&&status=4"+">下一页</a>　");  
									    out.print("<a href=?page_now="+page_total+"&&status=4"+">尾页</a>　"); 
// 									    page_now=page_now+1;
									    
									    }  
									 
									%>  
									</p>
									<% } %>  
			  
				 
				</div>

				




			</div>

			<!-- 结束四个切换卡 -->



 			<script type="text/javascript">  
		 		$('.qANavigation li').click( 
		
		 			function() {  
		
		 					$(this).addClass("selected").siblings().removeClass("selected");  
		 					//removeClass就是删除当前其他类；只有当前对象有addClass("selected")；siblings()意思就是当前对象的同级元素，removeClass就是删除；  

/* <!-- 					$("#tab-content > div").hide().eq( --> */

/* <!-- 					$('.qANavigation li').index(this)).show(); --> */
					
					 

 			}); 

 		 
 		</script>  





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