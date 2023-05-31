<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>유저 등록 화면</h2>
	<hr> <br>
	<form:form modelAttribute="member" method="post" action="/validation/result">
		<table>
			<tr>
				<td>ID: </td>
				<td>
					<form:input path="userId"/>
					<font color="red">
						<form:errors path="userId"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>이름: </td>
				<td>
					<form:input path="userName"/>
					<font color="red">
						<form:errors path="userName"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>PW: </td>
				<td>
					<form:input path="password"/>
					<font color="red">
						<form:errors path="password"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>E-mail: </td>
				<td>
					<form:input path="email"/>
					<font color="red">
						<form:errors path="email"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>성별: </td>
				<td>
					<form:radiobutton path="gender" value="male" label="male"/>
					<form:radiobutton path="gender" value="female" label="female"/>
					<form:radiobutton path="gender" value="gay" label="gay"/>
				</td>
			</tr>
		</table>
		<form:button name="register">등록</form:button>
	</form:form>
</body>
</html>