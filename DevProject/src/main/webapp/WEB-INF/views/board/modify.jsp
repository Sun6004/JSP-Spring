<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>modify</h3>

<form action="/board/post" method="post">
	<button type="submit" name="modify"> Params Mapping(post?modify)</button>
</form>

<a href="/board/get?list">Params Mapping(get?list)</a>
</body>
</html>