<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
	%>

	<form action="07_deletePro" method="post">
		<fieldset>
			<legend>Delete Member</legend>
			<h3 align="center">ID : <%=id %></h3>
			<p align="center">Type your password : <input type="password" name="passwd"></p>
			<p><input type="submit" value="Delete!"></p>
		</fieldset>
	</form>
</body>
</html>