<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<div align="center">
		<c:choose>
			<c:when test="${sessionScope.id ne null }">
				${sessionScope.id }님 환영합니다.<br><br>
				입사지원정보 수정<br><br>
				<a href="logout">로그아웃</a><br><br>
				탈퇴<br><br>
			</c:when>
			<c:otherwise>
				<a href="join">회원가입</a><br><br>
				<a href="login">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>