<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register ALL Form</title>
</head>
<body>
	<h2>Register All Form</h2>
	<form action="/registerUser" method="post">
		<table border="1">
			<tr>
				<td>유저 ID</td>
				<td><input type="text" name="userId"/></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName"/></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><input type="text" name="email"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="dateOfBirth"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="male" checked="checked"/>Male 
					<input type="radio" name="gender" value="female"/>Female 
					<input type="radio" name="gender" value="other"/>Other 
				</td>
			</tr>
			<tr>
				<td>개발자 여부</td>
				<td><input type="checkbox" name="developer" value="Y"/></td>
			</tr>
			<tr>
				<td>외국인 여부</td>
				<td><input type="checkbox" name="foreigner" value="true"/></td>
			</tr>
			<tr>
				<td>국적</td>
				<td>
					<select name="nationality" class="jobs">
						<option value="korea">대한민국</option>
						<option value="germany">독일</option>
						<option value="austrailia">호주</option>
						<option value="canada">캐나다</option>
						<option value="usa">미국</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소유차량</td>
				<td>
					<select name="cars" multiple="multiple">
						<option value="jeep">JEEP</option>
						<option value="bmw">BMW</option>
						<option value="audi">audi</option>
						<option value="volvo">VOLVO</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="sports"/>Sports
					<input type="checkbox" name="hobby" value="music"/>Music 
					<input type="checkbox" name="hobby" value="movie"/>Movie 
				</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="address.postCode"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address.location"/></td>
			</tr>
			<tr>
				<td>카드1 - 번호</td>
				<td><input type="text" name="cardList[1].no"/></td>
			</tr>
			<tr>
				<td>카드1 - 유효년월</td>
				<td><input type="text" name="cardList[1].validMonth"/></td>
			</tr>
			<tr>
				<td>카드2 - 번호</td>
				<td><input type="text" name="cardList[2].no"/></td>
			</tr>
			<tr>
				<td>카드2 - 유효년월</td>
				<td><input type="text" name="cardList[2].validMonth"/></td>
			</tr>
			<tr>
				<td>소개</td>
				<td>
					<textarea rows="30" cols="10" name="introduction"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="등록"/>
					<input type="reset" value="리셋"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

