<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
	ul {
		list-style:none;
		text-align: center;
	}
	
	li {
		display: inline-block;
	}
</style>
<script>

	function showList() {
		var onePageViewCount = document.getElementById("onePageViewCount").value;
	}
</script>
</head>
<body>
	
	<div align="center">
		<h2> 전체 게시글 보기 </h2>
		<br>
		<table border="1">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<tr>
				<td>
					조회 : <span style="color:red">${allBoardCount }</span>개
				</td>
				<td colspan="4" align="right">
					<select id="onePageViewCoount" onchange="showList()" >
						<option value="5" <c:if test="${onePageViewCount == 5 }">selected</c:if> >5</option>
						<option value="7" <c:if test="${onePageViewCount == 7 }">selected</c:if> >7</option>
						<option value="10" <c:if test="${onePageViewCount == 10 }">selected</c:if> >10</option>
					</select>
				</td>
			</tr>
			<tr align="center">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>							
			</tr>
			<c:forEach var="boardDto" items="${boardList }">
				<tr align="center">
					<td>${boardDto.num }</td>
					<td align="left">
						<c:forEach var="i" begin="0" end="${boardDto.reLevel }">
							<c:if test="${i > 1 }">
								&emsp;&emsp;
							</c:if>
						</c:forEach>
						<c:if test="${boardDto.reLevel != 1 }">
							>
						</c:if>
						<p>"${boardDto.subject}</p>
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>