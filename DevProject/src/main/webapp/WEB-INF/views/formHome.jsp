<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form action="/board/register">
		<input type="submit" value="register(GET)">
	</form>
	<form action="/board/register" method="post">
		<input type="submit" value="register(POST)">
	</form>
	<form action="/board/modify">
		<input type="submit" value="register(GET)">
	</form>
	<form action="/board/modify" method="post">
		<input type="submit" value="register(POST)">
	</form>
	<form action="/board/remove" method="post">
		<input type="submit" value="register(POST)">
	</form>
	<form action="/board/list">
		<input type="submit" value="register(GET)">
	</form>
</body>
</html>
