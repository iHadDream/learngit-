<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import=" com.nenu.entity.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页跳转</title>
    <meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
	<%
	//判断登录状态
	User user = (User)(session.getAttribute("DCUser"));
	if(user!=null && user.getUserCheckStatus() == User.USER_CHECK_STATUS_OK) {
		out.print("<script> window.location= '" + path + "/CommonPage/' </script>");	
	}
	else {
		out.print("<script>alert('请先登录！'); window.location= '" 
				+ path + "/login.jsp' </script>");		
	}
	%>    
  </body>
</html>
