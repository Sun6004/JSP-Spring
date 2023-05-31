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
	<h3>Spring Form</h3>
	<form:form modelAttribute="member" method="post" action="/formtag/label/result">
		<table>
			<tr>
				<td><form:label path="userId">유저ID</form:label> </td>
				<td>
					<form:input path="userId"/>
					<font color="red">
						<form:errors path="userId"/>
					</font>
				</td>
			</tr>
			<form:button name="register">등록</form:button>
		</table>
	</form:form>
</body>
</html>