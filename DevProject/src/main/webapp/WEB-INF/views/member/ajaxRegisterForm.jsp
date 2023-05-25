<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax RegisterForm</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<body>
	<h1>9. Ajax 방식 요청 처리 </h1>
	
	<h3>Ajax 방식 요청 처리</h3>
	<hr>
	<form action="">
		<p> userId: <input type="text" name="userId" value="hong" id="userId"> </p>
		<p> password: <input type="text" name="password" value="1234" id="password"> </p>
	</form>  <br>
	
	<p>1) URL 경로 상의 경로 변수값을 @PathVariable 어노테이션을 지정하여 문자열 매개변수로 처리한다. </p>
	<button id="registerBtn01">registerBtn01</button>  <br>
	
	<p>2) URL 경로 상의 여러개의 경로 변수값을 @PathVariable 어노테이션을 지정하여 여러개의 문자열 매개변수로 처리한다. </p>
	<button id="registerBtn02">registerBtn02</button>  <br>
	
	<p>3) 객체 타입의 json 요청 데이터 @RequestBody 어노테이션을 지정하여 자바빈즈 매개변수로 처리한다. </p>
	<button id="registerBtn03">registerBtn03</button>  <br>

	<p>4) 객체 타입의 json 요청 데이터는 문자열 매개변수로 처리할 수 없다. </p>
	<button id="registerBtn04">registerBtn04</button> <br>
	
	<p>5) 요청 URL에 쿼리 파라미터를 붙여서 전달하면 문자열 매개변수로 만들 수 있다. </p>
	<button id="registerBtn05">registerBtn05</button> <br>

	<p>6) 객체 타입의 JSON 요청 데이터를 @PathVariable 어노테이션을 지정한 문자열 매개변수와 @RequestBody 어노테이션을 지정한 자바빈즈 매개변수로 처리한다. </p>
	<button id="registerBtn06">registerBtn06</button> <br>
	
	<p>7) 객체 배열 타입의 json 요청 데이터를 자바빈즈 요소를 가진 리스트 컬렉션 매개변수에 @RequestBody 어노테이션을 지정하여 처리한다. </p>
	<button id="registerBtn07">registerBtn07</button> <br>
	
	<p>8) 중첩된 객체 타입의 JSON 요청 데이터를 @RequestBody어노테이션을 지정하여 중첩된 자바빈즈 매개변수로 처리한다. </p>
	<button id="registerBtn08">registerBtn08</button> <br>

	<p>9) 중첩된 객체 타입의 JSON 요청 데이터를 @RequestBody어노테이션을 지정하여 중첩된 자바빈즈 매개변수로 처리한다.(list) </p>
	<button id="registerBtn09">registerBtn09</button> <br>
</body>
<script type="text/javascript">
	$(function(){
		// URL 경로 상의 경로 변수값을 @PathVariable 어노테이션을 지정하여 문자열 매개변수로 처리한다
		$('#registerBtn01').on('click', function(){
			$.get("/ajax/register/hong", function(res){
				console.log("res: "+ res);
				if(res === "SUCCESS"){
					alert(res);
				}
			})
		})
		
		//URL 경로 상의 여러개의 경로 변수값을 @PathVariable 어노테이션을 지정하여 여러개의 문자열 매개변수로 처리한다. 
		$('#registerBtn02').on('click', function(){
			var userId = $('#userId').val();
			var password = $('#password').val();
			var userObject = {
				userId : userId,
				password : password
			}
			
			$.ajax({
				type : "post",
				url : "/ajax/register/" + userId + "/" + password,
				data : JSON.stringify(userObject),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
			
		})
		
		$('#registerBtn03').on('click', function(){
			var userId = $('#userId').val();
			var password = $('#password').val();
			var userObject = {
				userId : userId,
				password : password
			}
			
			$.ajax({
				type : "post",
				url : "/ajax/register03",
				data : JSON.stringify(userObject),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
		})
	
		$('#registerBtn04').on('click', function(){
			var userId = $('#userId').val();
			var password = $('#password').val();
			var userObject = {
				userId : userId,
				password : password
			}
			
			$.ajax({
				type : "post",
				url : "/ajax/register04",
				data : JSON.stringify(userObject),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
		})
		
		//5) 요청 URL에 쿼리 파라미터를 붙여서 전달하면 문자열 매개변수로 만들 수 있다.
		$('#registerBtn05').on('click', function(){
			var userId = $('#userId').val();
			var password = $('#password').val();
			var userObject = {
				userId : userId,
				password : password
			}
			
			$.ajax({
				type : "post",
				url : "/ajax/register05?userId="+userId,
				data : JSON.stringify(userObject),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
		})

		//6) 객체 타입의 JSON 요청 데이터를 @PathVariable 어노테이션을 지정한 문자열 매개변수와 @RequestBody 어노테이션을 지정한 자바빈즈 매개변수로 처리한다.
		$('#registerBtn06').on('click', function(){
			var userId = $('#userId').val();
			var password = $('#password').val();
			var userObject = {
				userId : userId,
				password : password
			}
			
			$.ajax({
				type : "post",
				url : "/ajax/register06/" +userId,
				data : JSON.stringify(userObject),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
		})
		
		//7) 객체 배열 타입의 json 요청 데이터를 자바빈즈 요소를 가진 리스트 컬렉션 매개변수에 @RequestBody 어노테이션을 지정하여 처리한다.
		$('#registerBtn07').on('click', function(){
			var userObjectArray = [
				{userId: "name01", password: "pw123"},
				{userId: "name02", password: "pw234"}
			];
			
			$.ajax({
				type : "post",
				url : "/ajax/register07",
				data : JSON.stringify(userObjectArray),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
		})
		
		//8) 중첩된 객체 타입의 JSON 요청 데이터를 @RequestBody어노테이션을 지정하여 중첩된 자바빈즈 매개변수로 처리한다.
		$('#registerBtn08').on('click', function(){
			var userId = $('#userId').val();
			var password = $('#password').val();
			var userObject = {
				userId : userId,
				password : password,
				address:{
					postCode: "12345",
					location: "Daejeon"
				}
			}
			
			$.ajax({
				type : "post",
				url : "/ajax/register08",
				data : JSON.stringify(userObject),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
		})

		//9) 중첩된 객체 타입의 JSON 요청 데이터를 @RequestBody어노테이션을 지정하여 중첩된 자바빈즈 매개변수로 처리한다.(List)
		$('#registerBtn09').on('click', function(){
			var userId = $('#userId').val();
			var password = $('#password').val();
			var userObject = {
				userId : userId,
				password : password,
				cardList : [
					{no: "1234-1234-123", validMonth: "20240321"},
					{no: "1234-5656-555", validMonth: "20240322"}
				]
			}
			
			$.ajax({
				type : "post",
				url : "/ajax/register09",
				data : JSON.stringify(userObject),
				contentType: "application/json; charset=utf-8",
				success: function(res){
					console.log(res);
					if(res === "SUCCESS"){
						alert(res);
					}
				}
			})
		})
	})
</script>
</html>