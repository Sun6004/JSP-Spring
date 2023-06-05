<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Modify</h2>
	<form action="/item/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="itemId" value="${item.itemId }">
		<input type="hidden" name="pictureUrl" value="${item.pictureUrl }">
		<table>
			<tr>
				<td> 상품명</td>
				<td>
					<input type="text" name="itemName" id="itemName" value="${item.itemName }">
				</td>
			</tr>
			<tr>
				<td> 가격</td>
				<td>
					<input type="text" name="price" id="price" value="${item.price }">
				</td>
			</tr>
			<tr>
				<td> 파일</td>
				<td>
					<img src="/item/display?itemId=${item.itemId }" width="220" height="200">
				</td>
			</tr>
			<tr>
				<td> 파일</td>
				<td>
					<input type="file" name="picture" id="picture">
				</td>
			</tr>
			<tr>
				<td> 개요</td>
				<td>
					<textarea rows="10" cols="30" name="description">${item.description }</textarea>
				</td>
			</tr>
		</table>
		<div>
			<button type="submit" id="btnModify">Modify</button>
			<button type="button" id="btnList" onclick="javascript:location.href='/item/list'">List</button>
		</div>
	</form>
</body>
</html>