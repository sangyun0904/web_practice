<%@page import="boardEx.BoardDao"%>
<%@page import="boardEx.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b info</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		BoardDto boardDto = BoardDao.getInstance().getOneBoard(Integer.parseInt(request.getParameter("num")));
		
	%>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td><%=boardDto.getNum() %></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=boardDto.getReadCount() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=boardDto.getWriter() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=boardDto.getRegDate() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=boardDto.getEmail() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=boardDto.getSubject() %></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><%=boardDto.getContent() %></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" value="수정하기" onclick="location.href='bUpdate.jsp?num=<%=request.getParameter("num") %>'">
				<input type="button" value="삭제하기" onclick="">
				<input type="button" value="목록보기" onclick="">
			</td>
		</tr>
	</table>
</body>
</html>