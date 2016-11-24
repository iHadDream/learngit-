<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.nenu.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
	String stylePath = path + "/style/";
	String addApplication = path + "/EducationalAdministration/operateApplication";
	User user = (User)session.getAttribute("DCUser");
	String commonPagePath = path + "/CommonPage/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=stylePath%>css/educated.css" type="text/css">
<link rel="stylesheet" href="<%=stylePath%>css/combo.select.css">
<link rel="stylesheet" href="<%=stylePath%>css/lendClass.css">
<title>教务反馈 | 教务管理系统</title>
<style>
.fbSelect { width: 300px; margin-left:  170px }
.content ul li{
  margin-left: -40px;
}
.button{
 width: 100px;
 margin-left: 170px;
}
</style>
</head>

<body>

<div class="container">
  
  	
  	<img src="<%=stylePath%>images/banner2.jpg" alt="在此处插入徽标" name="Insert_logo"  id="Insert_logo" style=" display:block;" />
  
  <div class="header">
    <!-- end .header --></div>
     <div class="lianjie">			
				<span>您的位置:&nbsp;<a href="<%=path%>">首页</a>>> <a
				href="">教务管理系统</a>&gt;&gt;<a href="./">教学信息反馈</a></span> <span
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
    <!-- end .sidebar1 --></div>
  <div class="content">
      <div >
      <form method="post" action="/DigitalCampu_Nenu/EducationalAdministration/feedbackTest.html">
          <p class="fbSelect">开课时间：
              <select>
                <option value="">2016年春季学期</option>
                <option value=" ">2016年春季学期</option>
                <option value=" ">2016年春季学期</option>
                <option value=" ">2016年春季学期</option>
                 
              </select>
          </p>
          <p class="fbSelect">课程名称：
              <select>
                  <option value=" ">计算机网络</option>
                  <option value=" ">数据库原理</option>
                  <option value=" ">JAVA</option>
                  <option value=" ">MFC</option>
                  <option value=" ">J2EE</option>
                  <option value=" ">WEB</option>
                 
              </select>
          </p>
         <!--  <p class="fbSelect">显示方式：
                <select>
                  <option value="">所有问卷</option>
                  <option value=" ">已填问卷</option>
                   <option value=" ">未填问卷</option>
                   
                </select>
          </p> -->
          <p><input type="submit" class="blue button biground" value="查询"> </input></p>
          </form>
      </div>
      <script src="<%=stylePath%>js/jquery-1.8.3.min.js"></script>
      <script src="<%=stylePath%>js/jquery.combo.select.js"></script>
      <script>
          $(function() {
            $('select').comboSelect();
          });
      </script>
    

  <!-- end .content --></div>

  <div class="footer">
     
     <div class="footer-center">
   		<img src="<%=stylePath%>images/footer-logo.png">
    </div>
    <div class="footer-center" >版权所有©东北师范大学 信息与软件工程学院</div>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>