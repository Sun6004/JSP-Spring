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
	<p> </p>
	<form:form modelAttribute="member" method="post" action="/formtag/hidden/result">
		<table>
			<tr>
				<td>이름: </td>
				<td> 
					<form:input path="userName"/>
					<font color="red">
						<form:errors path="userName"></form:errors>
					</font>
				</td>
			</tr>
		</table>
		<form:button name="register">등록</form:button>
	</form:form>
</body>
</html>