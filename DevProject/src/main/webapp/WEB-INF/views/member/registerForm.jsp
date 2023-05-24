<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Register form</h2>
	<hr>
	
	<h4>1. 컨트롤러 메서드 매개변수(요청처리)</h4>
	<hr>
	
	<p>1) URL 경로 상의 쿼리 파라미터 정보로부터 요청 데이터를 취득할 수 있다. </p>
	<a href="/register?userId=hongkd&password=1234">BUTTON1</a>
	<br>
	
	<p>2) URL 경로 상의 경로 변수로부터 요청 데이터를 취득할 수 있다. 
		<font color="red">서버 쪽 컨트롤러 메서드에서 @PathVariables를 사용하지 않는 경우 파라미터로 해당 값을 얻을 수 없다.(null)</font></p>
	 <a href="/register/hongkd">BUTTON2</a>
	 
	 <p>3) HTML Form 필드명과 컨트롤러 매개변수명이 일치하면 요청 데이터를 취득할 수 있다. </p>
	 <form action="/register01" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="register01"/> <br>
	 </form>
	 
	 <p>4) HTML Form 필드가 여러개일 경우에도 컨트롤러 매개변수명이 일치하면 요청 데이터를 취득할 수 있다. </p>
	 <form action="/register02" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="register02"/> <br>
	 </form>
	 
	 <p>5) HTML Form 필드가 여러개일 경우에 컨트롤러 매개변수의 위치는 상관이 있나? </p>
	 <form action="/register03" method="post">
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	<input type="submit" value="register03"/> <br>
	 </form>
	 
	 <p>6) HTML Form 필드값이 숫자일 경우에는 컨트롤러 매개변수 타입이 문자열이면 그대로 문자열 형태로 들어가는가? </p>
	 <form action="/register04" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="register04"/> <br>
	 </form>
	 
	 <p>7) HTML Form 필드값이 숫자일 경우에는 컨트롤러 매개변수 타입이 숫자형이면 숫자로 타입변환하여 데이터를 취득하는가?  </p>
	 <form action="/register05" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="register05"/> <br>
	 </form>
	 
	 <h4>3. 요청 데이터 처리 어노테이션</h4>
	 <hr>
	 
	 <p>1) URL 경로 상의 경로 변수가 여러 개일때 @PathVariable 어노테이션을 사용하여 특정한 경로 변수명을 지정해 준다. </p>
	 <a href="/register/hongkd/100">BUTTON3 </a>
	 <br>
	 
	 <p>2) HTML 폼의 필드명과 컨트롤러 매개변수명이 일치하면 요청을 처리할 수 있다. </p>
	  <form action="/register0101" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="register0101"/> <br>
	 </form>
	 
	 <p>3) HTML 폼 필드명과 컨트롤러 매개변수명이 일치(대소문자 구분)하지 않으면 요청을 처리할 수 없다. </p>
	   <form action="/register0201" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="register0201"/> <br>
	 </form>
	 
	 <p>4) @RequestParam 어노테이션을 사용하여 특정한 HTML Form의 필드명을 지정하여 요청을 처리한다. </p>
	 <form action="/register0202" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="register0202"/> <br>
	 </form>
	 <br> <hr>
	 <h4>4. 요청 처리 자바빈즈</h4>
	 <hr>
	 <p>1) 폼 텍스트 필드 요소값을 자바빈즈 매개변수로 처리한다. </p>
	 <form action="beans/register01" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="registerJavaBeans01"/> <br>
	 </form>

	 <p>2) 폼 텍스트 필드 요소값을 자바빈즈 매개변수 와 기본 데이터 타입인 정수 타입 매개변수로 처리한다. </p>
	 <form action="beans/register02" method="post">
	 	userId: <input type="text" name="userId" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="150"> <br>
	 	<input type="submit" value="registerJavaBeans02"/> <br>
	 </form>

	 <p>3) 여러 개의 폼 텍스트 필드 요소값을 매개변수 순서와 상관없이 매개변수명을 기준으로 처리한다.</p>
	 <form action="beans/register03" method="post">
	 	uid: <input type="text" name="uid" value="50"> <br>
	 	userName: <input type="text" name="userName" value="hong"> <br>
	 	password: <input type="text" name="password" value="1234"> <br>
	 	coin: <input type="text" name="coin" value="100"> <br>
	 	<input type="submit" value="registerJavaBeans03"/> <br>
	 </form> <br>
	 <br> <hr> <br>
	 
	 <h4>5. Date 타입 처리</h4>
	 <hr>
	 <p>1) 쿼리 파라미터(dataOfBirth=1234)로 전달받은 값이 날짜 문자열 형식에 맞지 않아 Date 타입으로 변환에 실패한다. </p>
	 <a href="/registerByGet01?userId=hong&dateOfBirth=1234">BUTTON4</a>
	 
	 <p>2) 쿼리 파라미터 (dataOfBirth=2018-09-08)로 전달받은 값이 날짜 문자열 형식으로 설정 시, Date 타입으로 받는가?</p>
	 <a href="/registerByGet01?userId=hong&dateOfBirth=2018-09-08">BUTTON5</a>
	 
	 <p>3) 쿼리 파라미터 (dataOfBirth=20180908)로 전달받은 값이 날짜 문자열 형식으로 설정 시, Date 타입으로 받는가?</p>
	 <a href="/registerByGet01?userId=hong&dateOfBirth=20180908">BUTTON6</a>

	 <p>
	 	4) 쿼리 파라미터 (dataOfBirth=2018/09/08)로 전달받은 값이 날짜 문자열 형식으로 설정 시, Date 타입으로 받는가?
	 	<font color="green">SUCCESS</font>
	 </p>
	 <a href="/registerByGet01?userId=hong&dateOfBirth=2018/09/08">BUTTON7</a>
	 
	 <p>5) Member 매개변수와 쿼리 파라미터(dateOfBirth=20180908)으로 전달받은 값이 날짜 문자열 형식으로 설정 시, Date 타입으로 받는가> </p>
	 <a href="/registerByGet02?userId=hong&dateOfBirth=20180908">BUTTON8</a>

	 <p>6) Member 매개변수와 폼 방식요청 전달받은 값이 날짜 문자열 형식으로 설정 시, Date 타입으로 받는가> </p>
	 <form action="/register" method="post">
	 	userId: <input type="text" name="userId" value="hong"><br>
	 	password: <input type="text" name="password" value="1234"><br>
	 	dateOfBirth: <input type="text" name="dateOfBirth" value="20180908"><br>
	 	<input type="submit" value="register"> <br>
	 </form>
	 <br> <hr>
	 
	 <p>7. 폼 방식 요청 처리 </p>
	 <hr>
	 <p>1) 폼 텍스트 필드 요소값을 기본 데이터 타입인 문자열 타입 매개변수로 처리한다. </p>
	  <form action="/registerUserId" method="post">
	 	userId: <input type="text" name="userId" value="hong"><br>
	 	<input type="submit" value="/registerUserId"> <br>
	 </form>
	
	 <p>2) 폼 텍스트 필드 요소값을 자바빈즈 매개변수로 처리한다. </p>
	  <form action="/registerMemberUserId" method="post">
	 	userId: <input type="text" name="userId" value="hong"><br>
	 	<input type="submit" value="/registerMemberUserId"> <br>
	 </form>

	 <p>3) 폼 비밀번호 필드 요소값을 자바빈즈 매개변수로 처리한다. </p>
	 <form action="/registerPassword" method="post">
	 	password: <input type="password" name="password" value="1234"><br>
	 	<input type="submit" value="/registerPassword"> <br>
	 </form>

	 <p>4) 폼 라디오버튼 요소값을 기본 데이터 타입인 문자열 타입 매개변수로 처리한다. </p>
	 <form action="/registerRadio" method="post">
	 	gender: <br>
	 	<input type="radio" name="gender" value="male" checked="checked">Male <br>
	 	<input type="radio" name="gender" value="female" checked="checked">Female <br>
	 	<input type="radio" name="gender" value="other" checked="checked">Other <br>
	 	<input type="submit" value="/registerRadio"> <br>
	 </form>

	 <p>5) 폼 셀렉트 박스 요소값을 기본 데이터 타입인 문자열 타입 매개변수로 처리한다. </p>
	 <form action="/registerSelect" method="post">
	 	nationality: <br>
	 	<select name="nationality">
	 		<option value="korea">한국 </option>
	 		<option value="usa">미국 </option>
	 		<option value="germany">독일 </option>
	 		<option value="japen">일본 </option>
	 	</select> <br>
	 	<input type="submit" value="/registerSelect"> <br>
	 </form>

	 <p>6) 복수 선택이 가능한 폼 셀렉트 박스 요소값을 기본 데이터 타입인 문자열 타입 매개변수로 처리한다. </p>
	 <form action="/registerMultiSelect01" method="post">
	 	cars: <br>
	 	<select name="cars" multiple="multiple">
	 		<option value="jeep">JEEP </option>
	 		<option value="volvo">VOLVO </option>
	 		<option value="bmw">BMW </option>
	 		<option value="benz">BENZ </option>
	 		<option value="audi">AUDI </option>
	 	</select> <br>
	 	<input type="submit" value="/registerMultiSelect01"> <br>
	 </form>
	
	 <p>7) 복수 선택이 가능한 폼 셀렉트 박스 요소값을 문자열 배열 타입 매개변수로 처리한다. </p>
	 <form action="/registerMultiSelect02" method="post">
	 	cars: <br>
	 	<select name="carArray" multiple="multiple">
	 		<option value="jeep">JEEP </option>
	 		<option value="volvo">VOLVO </option>
	 		<option value="bmw">BMW </option>
	 		<option value="benz">BENZ </option>
	 		<option value="audi">AUDI </option>
	 	</select> <br>
	 	<input type="submit" value="/registerMultiSelect02"> <br>
	 </form>

	 <p>8) 복수 선택이 가능한 폼 셀렉트 박스 요소값을 문자열 요소를 가진 리스트 컬렉션 타입 매개변수로 처리한다. </p>
	 <form action="/registerMultiSelect03" method="post">
	 	cars: <br>
	 	<select name="carList" multiple="multiple">
	 		<option value="jeep">JEEP </option>
	 		<option value="volvo">VOLVO </option>
	 		<option value="bmw">BMW </option>
	 		<option value="benz">BENZ </option>
	 		<option value="audi">AUDI </option>
	 	</select> <br>
	 	<input type="submit" value="/registerMultiSelect03"> <br>
	 </form>
	 
	 <p>9) 폼 체크박스 요소값을 기본 데이터 타입인 문자열 타입 매개변수로 처리한다. </p>
	 <form action="/registerCheckbok01" method="post">
		 hobby: <br>
		 <input type="checkbox" name="hobby" value="game">Game <br>
		 <input type="checkbox" name="hobby" value="movie">Movie <br>
		 <input type="checkbox" name="hobby" value="coding">Coding <br>
		 <input type="checkbox" name="hobby" value="music">Music <br>
		 <input type="submit" value="/registerCheckbok01"> <br>
	 </form>

	 <p>10) 폼 체크박스 요소값을 배열 타입 매개변수로 처리한다. </p>
	 <form action="/registerCheckbok02" method="post">
		 hobby: <br>
		 <input type="checkbox" name="hobbyArray" value="game">Game <br>
		 <input type="checkbox" name="hobbyArray" value="movie">Movie <br>
		 <input type="checkbox" name="hobbyArray" value="coding">Coding <br>
		 <input type="checkbox" name="hobbyArray" value="music">Music <br>
		 <input type="submit" value="/registerCheckbok02"> <br>
	 </form>
	 
	 <p>11) 폼 체크박스 요소값을 문자열 요소를 가진 리스트 컬렉션 타입 매개변수로 처리한다. </p>
	 <form action="/registerCheckbok03" method="post">
		 hobby: <br>
		 <input type="checkbox" name="hobbyList" value="game">Game <br>
		 <input type="checkbox" name="hobbyList" value="movie">Movie <br>
		 <input type="checkbox" name="hobbyList" value="coding">Coding <br>
		 <input type="checkbox" name="hobbyList" value="music">Music <br>
		 <input type="submit" value="/registerCheckbok03"> <br>
	 </form>
	 
	 <p>12) 폼 체크박스 요소값을 기본데이터 타입인 문자열 타입 매개변수로 처리한다. </p>
	 <form action="/registerCheckbok04" method="post">
		 developer: <br>
		 <input type="checkbox" name="developer" value="Y"> <br>
		 <input type="submit" value="/registerCheckbok04"> <br>
	 </form>

	 <p>13) 폼 체크박스 요소값을 기본데이터 타입인 boolean 타입 매개변수로 처리한다. </p>
	 <form action="/registerCheckbok05" method="post">
		 foreigner: <br>
		 <input type="checkbox" name="foreigner" value="true"> <br>
		 <input type="submit" value="/registerCheckbok05"> <br>
	 </form>

	 <p>14) 폼 텍스트 필드 요소값을 자바빈즈 매개변수로 처리한다. </p>
	 <form action="/registerAddress" method="post">
		postCode: <input type="text" name="postCode">
		location: <input type="text" name="location">
		<input type="submit" value="/registerAddress"> <br>
	 </form>
	 
	  <p>15) 폼 텍스트 필드 요소값을 중첩된 자바빈즈 매개변수로 처리한다. </p>
	   <form action="/registerUserAddress" method="post">
		postCode: <input type="text" name="address.postCode">
		location: <input type="text" name="address.location">
		<input type="submit" value="/registerUserAddress"> <br>
	 </form>
	 
	 <p>16) 폼 텍스트 필드 요소값을 중첩된 자바빈즈 매개변수로 처리한다. </p>
	 <form action="/registerUserCardList" method="post">
		카드1 - 번호: <input type="text" name="cardList[0].no"> <br>
		카드1 - 유효년월: <input type="text" name="cardList[0].validMonth"> <br>
		카드2 - 번호: <input type="text" name="cardList[1].no"> <br>
		카드2 - 유효년월: <input type="text" name="cardList[1].validMonth"> <br>
		<input type="submit" value="/registerUserCardList"> <br>
	 </form>
	 
	 <p>17) 폼 텍스트 영역 요소값을 기본 데이터 타입인 문자열 타입 매개변수로 처리한다.</p>
	 <form action="/registerTextArea" method="post">
		introduce: <br>
		<textarea name="introduce" rows="6" cols="50"></textarea> <br>
		<input type="submit" value="/registerTextArea"> <br>
	 </form>

	 <p>18) 폼 텍스트 영역 요소값을 Date 타입 매개변수로 처리한다.</p>
	 <form action="/registerDate01" method="post">
		dateOfBirth: <br>
		<input type="text" name="dateOfBirth"> <br>
		<input type="submit" value="/registerDate01"> <br>
	 </form>
	 
	 <h3>8. 파일 업로드 폼 방식 요청 처리</h3>
	 <hr>
	 
	 <p>1)파일 업로드 폼 파일 요소값을 스프링 MVC가 지원하는 MultipartFilter 매개변수로 처리한다.  </p>
	 <form action="/registerFile01" method="post" enctype="multipart/form-data">
	 	<input type="file" name="picture">
	 	<input type="submit" value="업로드">
	 </form>

	 <p>2) 파일 업로드 폼 파일 요소값과 텍스트 필드 요소값을 MultipartFile 매개변수와 문자열 매개변수로 처리한다. </p>
	 <form action="/registerFile02" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="picture">
	 	<input type="submit" value="업로드">
	 </form>

	 <p>3) 파일 업로드 폼 파일 요소값과 텍스트 필드 요소값을 MultipartFile 매개변수와 자바빈즈 매개변수로 처리한다. </p>
	 <form action="/registerFile03" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="picture">
	 	<input type="submit" value="업로드">
	 </form>
	 
	 <p>4) 파일 업로드 폼 파일 요소값과 텍스트 필드 요소값을 FileMember 타입의 자바빈즈에 매개변수로 처리한다. </p>
	 <form action="/registerFile04" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="picture">
	 	<input type="submit" value="업로드">
	 </form>
	 
	 <p>5) 여러 개의 파일 업로드를 폼 파일 요소값을 여러 개의 MultipartFile 매개변수로 처리 </p>
	  <form action="/registerFile05" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="picture">
	 	<input type="file" name="picture2">
	 	<input type="submit" value="업로드">
	 </form>
	 
	 <p>6) 여러 개의 파일 업로드를 폼 파일 요소값을 여러 개의 MultipartFile 타입의 요소를 가진 리스트 컬렉션 타입 매개변수로 처리 </p>
	  <form action="/registerFile06" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="pictureList[0]">
	 	<input type="file" name="pictureList[1]">
	 	<input type="submit" value="업로드">
	 </form>
	 
	 <p>7) 여러개의 파일업로드 폼 파일 요소값과 텍스트 필드 요소값을 MultiFileMember 타입의 자바빈즈 매개변수로 처리한다.</p>
	 <form action="/registerFile07" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="pictureList[0]">
	 	<input type="file" name="pictureList[1]">
	 	<input type="submit" value="업로드">
	 </form>

	 <p> 7번과 동일한 URL로 요청 진행</p>
	 <form action="/registerFile07" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="pictureList" multiple="multiple">
	 	<input type="submit" value="업로드">
	 </form>
	 
	 <p>8) 파일 업로드 폼 파일 요소값과 텍스트 필드 요소값을 MultipartFile 타입의 배열 매개변수로 처리한다. </p>
	  <form action="/registerFile08" method="post" enctype="multipart/form-data">
	 	userId: <input type="text" name="userId" value="hong">
	 	password: <input type="text" name="password" value="1234">
	 	<input type="file" name="pictureList" multiple="multiple">
	 	<input type="submit" value="업로드">
	 </form>
</body>
</html>