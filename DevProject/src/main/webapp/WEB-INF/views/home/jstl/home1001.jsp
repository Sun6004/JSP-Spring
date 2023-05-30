<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>7장 JSP</h3>
	<h4>c:redirect 사용</h4>
	<p>지정한 페이지로 redirect한다. </p>
	<c:redirect url="http://localhost/board/list"/>
	<h4>redirect이후의 코드는 실행되지 않는다</h4>
		
</body>
</html>