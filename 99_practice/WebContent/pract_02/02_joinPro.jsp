<%@page import="step2_00_loginEx.MemberDao"%>
<%@page import="step2_00_loginEx.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join pro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setId(id);
		memberDto.setPasswd(passwd);
		memberDto.setName(name);
		
		boolean isMember = MemberDao.getInstance().insertMember(memberDto);
		
		if (isMember) {
	%>
			<script>
				alert("Welcome!");
				location.href = "00_main.jsp";
			</script>
	<%
		}
		else {
	%>
			<script>
				alert("Id not available try different id");
				history.go(-1);
			</script>
	<%	
		}
	%>
</body>
</html>