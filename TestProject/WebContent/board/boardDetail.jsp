<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardVO vo = (BoardVO)request.getAttribute("BoardVo");
	%>
	<h2> 게시판 상세정보</h2>
	<div>
		<p>제목: <%=vo.getBo_title() %> </p>
		<p><%=vo.getBo_writer()%> <%=vo.getBo_date()%> </p>
		<p>내용:<%=vo.getBo_content() %> </p>
		<a href="./signin.jsp"><input type="button" value="수정"> </a>
		<a href="./signin.jsp"><input type="button" value="삭제"> </a>
		<a href="./boardList.jsp"><input type="button" value="목록"> </a>
	</div>
</body>
</html>