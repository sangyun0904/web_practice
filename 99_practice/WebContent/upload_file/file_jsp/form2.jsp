<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file form 2</title>
</head>
<body>
	<form action="upload2.jsp" method="post">
		<fieldset>
			<legend>파일 업로드 폼</legend>
			<p>작성자 : <input type="text" name="userName"><p>
			<p>제 목 : <input type="text" name="title"></p>
			<p>파일1 : <input type="file" name="file1"></p>
			<p>파일2 : <input type="file" name="file2"></p>
			<p>파일3 : <input type="file" name="file3"></p>
			<p><input type="submit" value="upload"></p>
		</fieldset>
	</form>
</body>
</html>