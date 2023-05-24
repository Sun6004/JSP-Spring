<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Result</h2>
	아이디: ${member.userId } <br>
	비밀번호: ${member.userName } <br>
	이메일: ${member.email } <br>
	생일: ${member.dateOfBirth } <br>
	성별: ${member.gender } <br>
	개발자 여부: ${member.developer } <br>
	외국인 여부: ${member.foreigner } <br>
	국적: <c:forEach items="${member.nationality }" var="nation">
		${nation}
	</c:forEach> <br>
	소유차량: 
</body>
</html>