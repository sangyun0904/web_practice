<%@page import="step2_00_loginEx.MemberDao"%>
<%@page import="step2_00_loginEx.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		MemberDto memberDto = new MemberDto();
		memberDto.setId(request.getParameter("id"));
		memberDto.setPasswd(request.getParameter("passwd"));
		System.out.println(memberDto.toString());
		
		boolean isDeleted = MemberDao.getInstance().deleteMember(memberDto);
		
		if (isDeleted) {
			session.invalidate();
	%>
			<script>
				alert("See you again!");
				location.href = "00_main.jsp";
			</script>
	
	<%		
		}
		else {		
	%>	
			<script>
				alert("Check your password.");
				history.go(-1);
			</script>
	<%
		}
	%>
</body>
</html>