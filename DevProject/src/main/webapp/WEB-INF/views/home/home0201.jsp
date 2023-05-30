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
	<h3>4. 표현언어(EL)</h3>
	<p>2) 산술 연산자를 이용한 방법 </p>
	<table border="1">
		<tr>
			<td>\${coin} </td>
			<td>${coin} </td>			
		</tr>
		<tr>
			<td>\${coin + 100} </td>
			<td>${coin + 100} </td>			
		</tr>
		<tr>
			<td>\${coin - 100} </td>
			<td>${coin - 100} </td>			
		</tr>
		<tr>
			<td>\${coin * 100} </td>
			<td>${coin * 100} </td>			
		</tr>
		<tr>
			<td>\${coin / 100} </td>
			<td>${coin / 100} </td>			
		</tr>
		<tr>
			<td>\${coin / 100} </td>
			<td>${coin div 100} </td>			
		</tr>
		<tr>
			<td>\${coin % 100} </td>
			<td>${coin % 100} </td>			
		</tr>
		<tr>
			<td>\${coin % 100} </td>
			<td>${coin mod 100} </td>			
		</tr>
	</table>
</body>
</html>