<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
          
<html>
<body>
<table width="100%" height="100%" border="1" cellspacing="0">
  <tr height="10%">
    <td width="20%" align="center">
       左上角Logo<br/>天天订餐天天优惠
    </td>
    <td>
      <a href="main.jsp" target="main">首页</a>
      <a href="order.jsp" target="main">我要订餐</a>
      查询订单
    </td>
  </tr>
  <tr height="90%">
    <td colspan="2">
      <!-- 这个就是子框架页，用来显示内容的 -->
      <iframe name="main" src="main.jsp" width="100%" height="100%">
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
       页脚，订餐热线：4008-823-823<input name = "id"><a href= "">
    </td>
  </tr>
</body>
</html>
 

  </body>
</html>
