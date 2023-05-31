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
	<h2>Spring Form</h2>
	<p>1) 모델에 기본 생성자로 생성한 폼 객체를 추가한 후에 화면에 전달한다. </p>
	<!-- 
		path속성에 설정된 속성값으로 id, name이 설정되고
		비밀번호는 modelAttribute에 설정된 member인 자바빈즈 클래스 내 매개변수에 값이 존재한다 하더라도
		비밀번호 value 속성에 값으로 설정되지 않는다.
	 -->
	<form:form modelAttribute="member" method="post" action="/formtag/register">
		<table>
			<tr>
				<td>비밀번호 </td>
				<td>
					<form:password path="password"/>
					<font color="red">
						<form:errors path="password"/>
					</font>
				</td>
			</tr>
		</table>
		<form:button name="register">등록</form:button>
	</form:form>
</body>
</html>