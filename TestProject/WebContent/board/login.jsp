<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인</h2>
		<form action="<%=request.getContextPath() %>/src/controller/login.do" method="post" name="loginForm" id="loginForm" onsubmit="return CheckLogin()">
		아이디: <input type="text" name="id"> <br>
		비밀번호: <input type="text" name="pw"> <br>
		<input type="submit" value="로그인">
		<a href="./signin.jsp"><input type="button" value="회원가입"> </a>
	</form>
</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
function CheckLogin(){
    var form = document.loginForm;
    
    if(form.id.value == ""){
        alert("아이디를 입력하세요.");
        form.id.focus();
        return false;
    }
    if(form.pw.value == ""){
        alert("비밀번호를 입력하세요.");
        form.pw.focus();
        return false;
    }
    return true;
}
</script>
</html>