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
	<h2>List</h2>
	<a href="/item/register">상품등록</a>
	<table border="1">
		<tr>
			<th align="center" width="80">상품ID </th>
			<th align="center" width="320">상품명 </th>
			<th align="center" width="100">가격 </th>
			<th align="center" width="80">편집 </th>
			<th align="center" width="80">제거 </th>
		</tr>
		<c:choose>
			<c:when test="${empty itemList }">
				<tr>
					<td colspan="5">조회하신 상품이 존재하지 않습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${itemList }" var="item">
					<tr>
						<td>${item.itemId } </td>
						<td>${item.itemName } </td>
						<td>${item.price }원 </td>
						<td>
							<a href="/item/modify?itemId=${item.itemId }">상품편집</a>
						</td>
						<td>
							<a href="/item/remove?itemId=${item.itemId }">상품삭제</a>
						</td>						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>