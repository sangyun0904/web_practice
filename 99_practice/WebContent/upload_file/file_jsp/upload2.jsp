<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload 2</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String location = "C:\\Users\\19_web_ksy\\git\\web_practice\\99_practice\\WebContent\\upload_file\\file_repo";
	
		MultipartRequest multi = new MultipartRequest(request, location, 1024 * 1024 * 30, "utf-8", new DefaultFileRenamePolicy());
		
		String userName = multi.getParameter("userName");
		String title = multi.getParameter("title");
		
		Enumeration files = multi.getFileNames();
	%>
</body>
</html>