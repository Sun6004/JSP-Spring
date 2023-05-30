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
	<h4>  pattern 속성을 사용하여 직접 사용할 서식을 지정한다. </h4>
	<p>number: ${coin } </p>
	<fmt:parseNumber value="${coin }" pattern="0,000.00" var="coinNum"/>
	<p>coinNum: ${coinNum } </p>
</body>
</html>