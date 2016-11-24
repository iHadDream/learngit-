<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,com.jspsmart.upload.*"%>
<%@ page import="com.nenu.entity.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!--     <base href="<%=basePath%>"> -->

<title>文件上传处理页面</title>
<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
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
	<%
		SmartUpload su = new SmartUpload();
		su.initialize(pageContext);
		su.upload();
		String method = su.getRequest().getParameter("method");
		String putFilePath = su.getRequest().getParameter("putFilePath");
		String sevletName = su.getRequest().getParameter("sevletName");
		// 逐一提取上传文件信息，同时可保存文件。
// 		for (int i = 0; i < su.getFiles().getCount(); i++) {
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			String ext = file.getFileExt();
			if(!ext.equals("xls")) {
				out.print("<script>alert('请输入xls格式文件！'); </script>");
				out.print("<script> window.location= '" + path
						+ "/EducationalAdministration/userManagement.jsp' </script>");
				return ;
			}
			// 若文件不存在则继续
			if (file.isMissing()) {
				out.print("<script>alert('文件上传失败，请重新上传！'); </script>");
				out.print("<script> window.location= '" + path
						+ "/EducationalAdministration/userManagement.jsp' </script>");
				return;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS"); 
			String newFileName = "";
			newFileName += sdf.format(new Date());
			for(int i = 0; i < 3; i ++) {
				Random rand = new Random();
				newFileName += rand.nextInt(10) + '0';
			}
			newFileName += ".xls";
			int count = su.save("/upload");
			out.println(count + "个文件上传成功！<br>");
			// 显示当前文件信息
			out.println("<TABLE BORDER=1>");
			out.println("<TR><TD>表单项名（FieldName）</TD><TD>"
					+ file.getFieldName() + "</TD></TR>");
			out.println("<TR><TD>文件长度（Size）</TD><TD>" + file.getSize()
					+ "</TD></TR>");
			out.println("<TR><TD>文件名（FileName）</TD><TD>"
					+ file.getFileName() + "</TD></TR>");
			out.println("<TR><TD>文件扩展名（FileExt）</TD><TD>"
					+ file.getFileExt() + "</TD></TR>");
			out.println("<TR><TD>文件全名（FilePathName）</TD><TD>"
					+ file.getFilePathName() + "</TD></TR>");
			out.println("</TABLE><BR>");

			// 将文件另存
			file.saveAs("/upload/" + newFileName);
			
			putFilePath += "/" + newFileName;
			
			// 另存到以WEB应用程序的根目录为文件根目录的目录下
			// file.saveAs("/upload/" + myFile.getFileName(),su.SAVE_VIRTUAL);
			// 另存到操作系统的根目录为文件根目录的目录下
			// file.saveAs("c:\\temp\\" + myFile.getFileName(),su.SAVE_PHYSICAL);
// 		}
	%>
	
	<form method="post" action="<%= sevletName%>">
		<input name="putFilePath" value="<%= putFilePath%>" hidden> </input>
		<input name="method" value="<%= method%>" hidden> </input>
		<input type="submit" class="button blue biground" value="确认"></input>
	</form>

</body>
</html>
