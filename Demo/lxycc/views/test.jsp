<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
      <%
           List<String> a = new ArrayList();
           a.add("贝贝");
           a.add("晶晶");
           a.add("欢欢");
           a.add("莹莹");
           a.add("妮妮");
           request.setAttribute("a",a);
       %>
       <B><c:out value = "不指定begin 和 end 的迭代" />
       </B><br />
       <c:forEach var = "fuwa" items = "${a }">
          <c:out value = "${fuwa}"><br />
          </c:out>       
       </c:forEach>
       <B><c:out value = "制定begin和end的迭代"></c:out>
       </B>
       <c:forEach var = "fuwa" items = "${a}" begin = "1" end = "3" step ="2">
             <c:out value = "${fuwa}"></c:out>
       </c:forEach>
       
</body>
</html>