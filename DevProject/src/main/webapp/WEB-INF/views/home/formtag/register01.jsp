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
	<h4>Spring form</h4>
	<p>1) form:form 태그를 이용한 form을 생성해 보자</p>
	<form:form modelAttribute="member" method="post" action="/formtag/register">
		<table border="1">
			<tr>
				<td>유저ID </td>
				<td>
					 <form:input path="userId"/>
					 <font color="red">
					 	<form:errors path="userId"/>
					 </font>
				</td>
			</tr>
			<tr>
				<td>이름 </td>
				<td>
					 <form:input path="userName"/>
					 <font color="red">
					 	<form:errors path="userName"/>
					 </font>
				</td>
			</tr>
		</table>
		<form:button name="register">등록 </form:button>
	</form:form>
</body>
</html>