<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="login-box">
	<div class="login-logo">
		<a href=""><b>DDIT</b>BOARD</a>
	</div>
	<div class="card">
		<div class="card-body login-card-body">
			<p class="login-box-msg">로그인을 진행해주세요</p>

			<form action="/notice/loginCheck.do" method="post" id="signForm">
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="memId" id="memId" value="${member.memId }" placeholder="아이디를 입력해주세요">
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-user"></span>
						</div>
					</div>
					<span class="error invalid-feedback" style="display:block;">${errors.memId }</span>
				</div>
				<div class="input-group mb-3">
					<input type="password" class="form-control" name="memPw" id="memPw" placeholder="비밀번호를 입력해주세요">
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-lock"></span>
						</div>
					</div>
					<span class="error invalid-feedback" style="display:block;">${errors.memPw }</span>
				</div>
				<div class="row">
					<div class="col-8">
						<div class="icheck-primary">
						</div>
					</div>
					<div class="col-4">
						<button type="button" class="btn btn-primary btn-block" id="signinBtn">로그인</button>
					</div>
				</div>
			</form>
			<p class="mb-1">
				<a href="/notice/forget.do">아이디 & 비밀번호 찾기</a>
			</p>
			<p class="mb-0">
				<a href="/notice/signup.do" class="text-center">회원가입</a>
			</p>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var signForm = $("#signForm");
	var signinBtn = $("#signinBtn");
	
	signinBtn.on('click', function(){
		var memId = $("#memId").val();
		var memPw = $("#memPw").val();
		
		if(memId == null || memId == ""){
			alert("아이디를 입력해주세요!");
			return false;
		}
		if(memPw == null || memPw == ""){
			alert("비밀번호를 입력해주세요!");
			return false;
		}
		signForm.submit();
	})
	
})

</script>