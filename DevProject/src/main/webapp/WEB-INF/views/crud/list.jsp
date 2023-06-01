<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Board List</h2>
	<a href="/crud/board/register">등록</a>
		
	<form action="/crud/board/search" method="post">
		<input type="text" name="title" value="${board.title }">
		<input type="submit" value="검색">
	</form>
		<table border="1">
			<tr>
				<td align="center" width="80">번호 </td>
				<td align="center" width="320">제목 </td>
				<td align="center" width="100">작성자 </td>
				<td align="center" width="180">작성일 </td>
			</tr>
				<c:choose>
					<c:when test="${empty boardList }">
						<tr>
							<td colspan="4">조회하실 게시물이 존재하지 않습니다. </td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardList }" var="board">
							<tr>
								<td align="center">${board.boardNo} </td>
								<td align="center"> <a href="/crud/board/read?boardNo=${board.boardNo }">${board.title}</a> </td> 
								<td align="center">${board.writer} </td> 
								<td align="center"> <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

		</table>
</body>
</html>