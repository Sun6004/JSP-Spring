<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	h3{
	border: 1px solid black;
	}
	</style>
</head>
<body>
	<h3>게시판 등록</h3>
	<form action="/addBoard.do" method="post">
		<p>제목: <input type="text" id="title" name="title"> </p>	
		<p>내용: <input type="text" id="content" name="content"> </p>
		<input type="submit" value="등록"> <a href="/boardList.jsp"> <input type="button" value="목록"> </a>
	</form>
</body>
</html>