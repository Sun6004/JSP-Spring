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
	<!-- 
		입력값 검증 결과 테스트 시나리오
		1. 유효한 데이터 입력
		2. 우편번호를 빈 값으로 입력
		3. 카드번호를 빈 값으로 입력
		4. 카드 유효년월을 과거 날짜 입력
	 -->
	<form:form modelAttribute="member" method="post" action="/validation/result3">
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
				<td>우편번호: </td>
				<td>
					<form:input path="address.postCode"/>
					<font color="red">
						<form:errors path="address.postCode"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>주소: </td>
				<td>
					<form:input path="address.location"/>
					<font color="red">
						<form:errors path="address.location"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>카드1 - 번호: </td>
				<td>
					<form:input path="cardList[0].no"/>
					<font color="red">
						<form:errors path="cardList[0].no"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>카드1 - 유효년월: </td>
				<td>
					<form:input path="cardList[0].validMonth"/>
					<font color="red">
						<form:errors path="cardList[0].validMonth"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>카드2 - 번호: </td>
				<td>
					<form:input path="cardList[1].no"/>
					<font color="red">
						<form:errors path="cardList[1].no"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>카드2 - 유효년월: </td>
				<td>
					<form:input path="cardList[1].validMonth"/>
					<font color="red">
						<form:errors path="cardList[1].validMonth"/>
					</font>
				</td>
			</tr>
			<tr>
				<td>생년월일: </td>
				<td>
					<form:input path="dateOfBirth" type="date"/>
					<font color="red">
						<form:errors path="dateOfBirth"/>
					</font>
				</td>
			</tr>
		</table>
		<form:button name="register">등록</form:button>
	</form:form>
</body>
</html>