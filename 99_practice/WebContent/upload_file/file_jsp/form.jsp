<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
</head>
<body>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>파일 업로드</legend>
			<p>작성자 : <input type="text" name="userName"></p>
			<p>파일명 : <input type="file" name="file"></p>
			<p><input type="submit" value="upload"></p>
		</fieldset>
	</form>
</body>
</html>