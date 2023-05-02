<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
		<div>
		<form action="../src/controller/signIn.do" method="post" id="signinform">
			아이디: <input type="text" name="id"> <br>
			비밀번호: <input type="text" name="pw"> <br>
			이름: <input type="text" name="name"> <br>
		<input type="submit" value="등록">
		<a href="./login.jsp"><input type="button" value="로그인"> </a>
	</form>
	</div>
</body>
</html>