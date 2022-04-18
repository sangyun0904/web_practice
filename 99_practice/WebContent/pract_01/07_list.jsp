<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<h2>회원 리스트</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PASSWORD</th>
			<th>NAME</th>
			<th>JOIN_DATE</th>
		</tr>
	<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				String url = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
				String user = "root";
				String password = "1234";
				
				conn = DriverManager.getConnection(url, user, password);
				
				pstmt = conn.prepareStatement("SELECT * FROM MEMBER");
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					String id = rs.getString("ID");
					String passwd = rs.getString("PASSWD");
					String name = rs.getString("NAME");
					String joinDate = rs.getString("JOIN_DATE");
					
	%>
					<tr align="center">
						<td><%=id %></td>
						<td><%=passwd %></td>
						<td><%=name %></td>
						<td><%=joinDate %></td>
					</tr>
	<%
				}
	%>				
				</table>
	<%
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				rs.close();
				pstmt.close();
				conn.close();
			}
	%>
</body>
</html>