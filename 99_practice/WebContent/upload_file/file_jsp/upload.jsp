<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		try {
			
			String location = "C:\\Users\\19_web_ksy\\git\\web_practice\\99_practice\\WebContent\\upload_file";
			
			MultipartRequest multi = new MultipartRequest(request, location, 1024 * 1024 * 10, "utf-8", new DefaultFileRenamePolicy());
			
			String userName = multi.getParameter("userName");
			
			Enumeration files = multi.getFileNames();
			
			if (files.hasMoreElements()) {
				
				String element = (String)files.nextElement();
				String filesystemName = multi.getFilesystemName(element);
				String originalFileName = multi.getOriginalFileName(element);
				String contentType = multi.getContentType(element);
				long length = multi.getFile(element).length();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>