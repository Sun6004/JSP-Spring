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
	<h4>c:import 사용</h4>
	<p>특정 URL의 결과를 읽어와서 현재 위치에 삽입한다. </p>
	<p>절대 URL </p>
	<c:import url="http://localhost/board/list"/>
	<c:import url="http://localhost/board/search">
		<c:param name="keyword" value="apple"/>
	</c:import>
	<br>
	
	<p>상대 URL - 절대경로 </p>
	<c:import url="http://localhost/board/list"/>

	<p>상대 URL - 상대경로 </p>
	<c:import url="../../board/list.jsp"/>
	
		
</body>
</html>