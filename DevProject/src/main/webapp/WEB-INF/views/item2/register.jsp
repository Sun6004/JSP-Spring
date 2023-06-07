<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h2>Register</h2>
	<form action="/item2/register" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품명 </td>
				<td>
					<input type="text" name="itemName" id="itemName">
				</td>
			</tr>
			<tr>
				<td>가격 </td>
				<td>
					<input type="text" name="price" id="price">
				</td>
			</tr>
			<tr>
				<td>파일 </td>
				<td>
					<input type="file" name="pictures" id="picture1">
				</td>
			</tr>
			<tr>
				<td>파일 </td>
				<td>
					<input type="file" name="pictures" id="picture2" >
				</td>
			</tr>
			<tr>
				<td>개요 </td>
				<td>
					<textarea rows="10" cols="20" name="description"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<button type="submit" id="btnRegister">Register</button>
			<button type="button" id="btnList" onabort="javascript:location.href='/item2/list'">List</button>
		</div>
	</form>
</body>
<script type="text/javascript">
</script>
</html>