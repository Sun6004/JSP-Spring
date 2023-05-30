<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> 6) type 속성을 date로 지정하여 날짜 포멧팅을 한다. </h4>
	<p>now: ${now } </p>
	date default: <fmt:formatDate value="${now }" type="date" dateStyle="default"/> <br>
	date short: <fmt:formatDate value="${now }" type="date" dateStyle="short"/><br>
	date medium: <fmt:formatDate value="${now }" type="date" dateStyle="medium"/><br>
	date long: <fmt:formatDate value="${now }" type="date" dateStyle="long"/><br>
	date full: <fmt:formatDate value="${now }" type="date" dateStyle="full"/><br>
	
</body>
</html>