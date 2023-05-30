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
	<h4> 7) type 속성을 time으로 지정하여 시간 포멧팅을 한다. </h4>
	<p>now: ${now } </p>
	time default: <fmt:formatDate value="${now }" type="time" timeStyle="default"/> <br>
	time short: <fmt:formatDate value="${now }" type="time" timeStyle="short"/><br>
	time medium: <fmt:formatDate value="${now }" type="time" timeStyle="medium"/><br>
	time long: <fmt:formatDate value="${now }" type="time" timeStyle="long"/><br>
	time full: <fmt:formatDate value="${now }" type="time" timeStyle="full"/><br>
	
</body>
</html>