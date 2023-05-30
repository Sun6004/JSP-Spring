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
	<p>JSTL 태그들의 Example ::: c:out. </p>
	<p>1) escapeXml속성의 기본값은 true이고, 특수 문자를 변환한다. </p>
	<table border="1">
		<tr>
			<td>member.userId </td>
			<td>${member.userId } </td>			
		</tr>
		<tr>
			<td>member.userId </td>
			<td> <c:out value="${member.userId }"></c:out> </td>			
		</tr>		
	</table>
</body>
</html>