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
	<h3>Result</h3>
	<table>
		<tr>
			<td>개발자 여부 </td>
			<td>${member.developer } </td>			
		</tr>
		<tr>
			<td>외국인 여부 </td>
			<td>${member.foreigner } </td>			
		</tr>
		<tr>
			<td>취미 </td>
			<td>${member.hobby } </td>			
		</tr>
		<tr>
			<td>취미(hobbyArray) </td>
			<td>
				<c:forEach items="${member.hobbyArray }" var="hobby">
					${hobby } <br>
				</c:forEach>
			</td>			
		</tr>
		<tr>
			<td>취미(hobbyList)
				<c:forEach items="${member.hobbyList }" var="hobby">
					${hobby } <br>
				</c:forEach>					
			</td>
		</tr>
	</table>
</body>
</html>