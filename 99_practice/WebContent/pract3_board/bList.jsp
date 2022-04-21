<%@page import="boardEx.BoardDao"%>
<%@page import="boardEx.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b list</title>
</head>
<body>

	<h1>게시글 보기</h1>

	<%
		ArrayList<BoardDto> boardList = BoardDao.getInstance().getBoardList();
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	<%
			for (BoardDto boardDto : boardList) {
	%>
				<tr>
					<td><%=boardDto.getNum() %></td>
					<td><a href="bInfo.jsp?num=<%=boardDto.getNum() %>"><%=boardDto.getSubject() %></a></td>
					<td><%=boardDto.getWriter() %></td>
					<td><%=boardDto.getRegDate() %></td>
					<td><%=boardDto.getReadCount() %></td>
				</tr>
	<%
			}
	%>
		<tr>
			<td colspan="5"><input type="button" value="글쓰기" onclick="location.href='bWrite.jsp'"></td>
		</tr>
	</table>
</body>
</html>