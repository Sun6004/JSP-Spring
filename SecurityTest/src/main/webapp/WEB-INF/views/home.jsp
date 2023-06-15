<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<!-- 로그인 하지 않은 경우 -->
<sec:authorize access="isAnonymous()">
	<a href="/login">로그인</a>
</sec:authorize>

<!-- 로그인 후 인증된 사용자인 경우 -->
<sec:authorize access="isAuthenticated()">
	<a href="/logout">로그아웃</a>
</sec:authorize>
<hr> <br>
<a href="/board/list">Board</a>
<a href="/notice/list">Notice</a>

</body>
</html>
