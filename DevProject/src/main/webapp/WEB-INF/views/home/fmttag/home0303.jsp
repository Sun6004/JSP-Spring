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
	<h4> // 8) type 속성을 both로 지정하여 시간 포멧팅을 한다. </h4>
	<p>now: ${now } </p>
	both default: <fmt:formatDate value="${now }" type="both" dateStyle="default" timeStyle="default"/> <br>
	both short: <fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="short"/><br>
	both medium: <fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium"/><br>
	both long: <fmt:formatDate value="${now }" type="both" dateStyle="long" timeStyle="long"/><br>
	both full: <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/><br>
</body>
</html>