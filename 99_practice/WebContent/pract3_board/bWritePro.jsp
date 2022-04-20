<%@page import="boardEx.BoardDao"%>
<%@page import="boardEx.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b write pro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		BoardDto boardDto = new BoardDto();
		boardDto.setWriter(request.getParameter("writer"));
		boardDto.setEmail(request.getParameter("email"));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setPassword(request.getParameter("password"));
		boardDto.setContent(request.getParameter("content"));
		
		BoardDao.getInstance().insertBoard(boardDto);
		
	%>
</body>
</html>