<%@page import="boardEx.BoardDao"%>
<%@page import="boardEx.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b update</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDto boardDto = BoardDao.getInstance().getOneBoard(num);
	%>
	
	<h1>게시글 수정하기</h1>
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><%=boardDto.getWriter() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=boardDto.getRegDate() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" value="<%=boardDto.getSubject() %>" /></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea rows="10" cols="60" name="content"><%=boardDto.getContent() %></textarea>
	</table>
</body>
</html>