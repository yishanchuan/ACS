<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="user/toLogin">login</a><p>
	<form action="upload" method="post" enctype="multipart/form-data">
		File:<input type="file" name="file"><br>
		Desc:<input type="text" name="desc"><br>
		<input type="submit" value="提交">
	</form>
	<%response.setHeader("refresh", "0;URL="+"user/toLogin"); %>
</body>
</html>