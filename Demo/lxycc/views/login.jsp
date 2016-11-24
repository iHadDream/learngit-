<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

 %>
 <%=basePath %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/introduction.css">
<title>Insert title here</title>
</head>
<body>
     
</head>
<body>
	<div class="header">
		<img src="./images/in-background.png">
	</div>
	<div class="in-nav-home">	
		
		<ol class="breadcrumb">
		    <li class="glyphicon glyphicon-home" style="color:#572703;"><a href="#">首页</a></li>
		    <li><a href="#">网络投票</a></li>
		    <li class="active">成员简介</li>
		</ol>
	</div>
	
	<div class="content">
		<div class="in-photograph">
			<img src="./images/jinzr.jpg"/>
		</div>
		<div class="page-header in-intro">
  				
  				<h1>成员介绍 <small> members introduce</small></h1>
		
			 
			<table class="table table-striped in-intro-content">
   
			  <tbody>
			    <tr>
			      <td>姓名：</td>
			      <td>金正日</td>
			       
			    </tr>
			    <tr>
			      <td>学院及专业：</td>
			      <td>Mumbai</td>
			       
			    </tr>
			    <tr>
			      <td>毕业去向：</td>
			      <td>出国</td>
			       
			    </tr>
			    <tr>
			      <td>类别：</td>
			      <td>超级优秀生</td>
			       
			    </tr>
			  </tbody>
			</table>
		</div>
		<div class="in-other ">
			
			
			<ul>
				<li class="in-other-content" >其他成员</li>
			 	 <li class="in-other-content"><a href="a.jsp" target = "main" >郭艳斌</a></li>
			 	 <li class="in-other-content"><a href="b.jsp" target = "main">岳盈盈</a></li>
			 	 <li class="in-other-content"><a href="c.jsp" target = "main">张茜</a></li>
			 	 <li class="in-other-content"><a href="d.jsp" target = "main">林  可</a></li>
			 	 <li class="in-other-content"><a href="e.jsp" target = "main">程钧铭</a></li>
			 	 <li class="in-other-content"><a href="f.jsp" target = "main">吕天骄</a></li>
			 	 <li class="in-other-content"><a href="g.jsp" target = "main">周惠容</a></li>
			 	 <li class="in-other-content"><a href="h.jsp" target = "main">徐  飞</a></li>
			 	 <li class="in-other-content"><a href="i.jsp" target = "main">刘明昊</a></li>
			 	 <li class="in-other-content"><a href="j.jsp" target = "main">周子琳</a></li>
			 	 <li class="in-other-content"><a href="k.jsp" target = "main">刘  娟</a></li>
			 	 <li class="in-other-content"><a href="l.jsp" target = "main">叶挺铭</a></li>
			 	 <li class="in-other-content"><a href="m.jsp" target = "main">苑城睿</a></li>
			 	 <li class="in-other-content"><a href="n.jsp" target = "main">孟祥云</a></li>
			 	 <li class="in-other-content"><a href="o.jsp" target = "main">朱丹炜</a></li>
			 	 <li class="in-other-content"><a href="p.jsp" target = "main">包崇庆</a></li>
			 	 <li class="in-other-content"><a href="q.jsp" target = "main">王司宇</a></li>
			 	 <li class="in-other-content"><a href="r.jsp" target = "main">申芳瑜</a></li>
			 	 <li class="in-other-content"><a href="s.jsp" target = "main">王天卓</a></li>
			 	 <li class="in-other-content"><a href="t.jsp" target = "main">侯文宇</a></li>
			 	 <li class="in-other-content"><a href="u.jsp" target = "main">郑媛渊</a></li>
			 	 <li class="in-other-content"><a href="v.jsp" target = "main">张皖雄</a></li>
			 	 <li class="in-other-content"><a href="w.jsp" target = "main">燕  妮</a></li>
			 	 <li class="in-other-content"><a href="x.jsp" target = "main">孙铭徽</a></li>
			 	 <li class="in-other-content"><a href="y.jsp" target = "main">徐云月</a></li>
			 	 <li class="in-other-content"><a href="z.jsp" target = "main">朱岳涵</a></li>
			 	 <li class="in-other-content"><a href="aa.jsp" target = "main">张  仲</a></li>
			 	 <li class="in-other-content"><a href="ab.jsp" target = "main">杨秀云</a></li>
			 	 <li class="in-other-content"><a href="ac.jsp" target = "main">马英才</a></li>
			 	 <li class="in-other-content"><a href="ac.jsp" target = "main">买买提明</a></li>
			 	  
			 </ul> 
			

		</div>

		<div class="in-report">
			<h1>理想与成才报告 <br><small> Report on ideal and success</small></h1>
			<h3>仰望星空盼楚天、脚踏实地励栋才</h3>
			<p> <iframe name="main" src="aa.jsp" class="in-report-content"  ></iframe></p>
			
		</div>
	</div>

	 <div class="footer">
         <img src="./images/in-footer.png">
	</div>


	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
