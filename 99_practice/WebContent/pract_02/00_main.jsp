<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
	
		if (id == null) {
	%>
			<h3>Just Do It!</h3>
			<p><a href="01_join.jsp">join</a></p>
			<p><a href="03_login.jsp">login</a></p>
	<%
		}
		else {
	%>
			<h3>Welcome! <%=id %></h3>
			<p><a href="05_logout.jsp">logout</a></p>
			<p><a href="06_delete.jsp">delete account</a></p>
	<%
		}
	%>
</body>
</html>