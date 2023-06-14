<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
</head>
<body>
	<h1>LoginForm</h1>
	<h2><c:out value="${error }"/></h2>		<!-- 에러 발생 시, 출력할 메시지 -->
	<h2><c:out value="${logout }"/></h2>	<!-- 로그아웃 시, 출력할 메시지 -->
	
	<form action="/login" method="post">
		username : <input type="text" name="username" value="admin"/><br/>
		password : <input type="text" name="password" value="admin"/><br/>
		<input type="submit" value="로그인"/>
		<sec:csrfInput/>
	</form>
</body>
</html>