<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>4. 표현언어(EL) 을 이용하여 출력</h3>
	<p>1) 자바빈즈 프로퍼티를 조회하는 경우'속성명.프로퍼티명'을 지정한다. </p>
	<table border="1">
		<tr>
			<td>
				<c:forEach items="${member.hobbyArray }" var="hobby">
					${hobby } <br>
				</c:forEach>
			</td>		
		</tr>
		<tr>
			<td>\${member.hobbyArray[0] } </td>
			<td>${member.hobbyArray[0] } </td>			
		</tr>
		<tr>
			<td>\${member.hobbyArray[1] } </td>
			<td>${member.hobbyArray[1] } </td>				
		</tr>
		<tr>
			<td>
				<c:forEach items="${member.hobbyList } " var="hobby">
					${hobby } <br>
				</c:forEach>
			</td>		
		</tr>
		<tr>
			<td>\${member.hobbyList[0] } </td>
			<td>${member.hobbyList[0] } </td>				
		</tr>
		<tr>
			<td>\${member.hobbyList[1] } </td>
			<td>${member.hobbyList[1] } </td>				
		</tr>
	</table>
</body>
</html>