<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="login-box">
	<div class="card card-outline card-primary">
		<div class="card-header text-center">
			<p class="h4">
				<b>아이디찾기</b>
			</p>
		</div>
		<div class="card-body">
			<p class="login-box-msg">아이디 찾기는 이메일, 이름을 입력하여 찾을 수 있습니다.</p>
			<form action="" method="post">
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="memEmail" id="memEmail" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="memName" id="memName" placeholder="이름을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<p>
						회원님의 아이디는 [<font id="id" color="red" class="h2"></font>] 입니다.
					</p>
				</div>
				<div class="row">
					<div class="col-12">
						<button type="button" class="btn btn-primary btn-block" id="idFindBtn">아이디찾기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br />
	<div class="card card-outline card-primary">
		<div class="card-header text-center">
			<p href="" class="h4">
				<b>비밀번호찾기</b>
			</p>
		</div>
		<div class="card-body">
			<p class="login-box-msg">비밀번호 찾기는 아이디, 이메일, 이름을 입력하여 찾을 수 있습니다.</p>
			<form action="" method="post">
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="memId" name="memId" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="memEmail2" name="memEmail" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="memName2" name="memName" placeholder="이름을 입력해주세요.">
				</div>
				<div class="input-group mb-3">
					<p>
						회원님의 비밀번호는 [<font color="red" class="h2" id="password"></font>] 입니다.
					</p>
				</div>
				<div class="row">
					<div class="col-12">
						<button type="button" class="btn btn-primary btn-block" id="pwFindBtn">비밀번호찾기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br/>
	<div class="card card-outline card-secondary">
		<div class="card-header text-center">
			<h4>MAIN MENU</h4>
			<button type="button" class="btn btn-secondary btn-block" id="loginBtn" onclick="javascript:location.href='/notice/login.do'">로그인</button>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var idFindBtn = $("#idFindBtn");
	var pwFindBtn = $("#pwFindBtn");
	
	idFindBtn.on('click', function(){
		var memEmail = $("#memEmail").val();
		var memName = $("#memName").val();
		
		if(memEmail == null || memEmail == ""){
			alert("이메일을 입력하세요 ㅡㅡ");
			return false;
		}
		if(memName == null || memName == ""){
			alert("이름을 입력하세요 ㅡㅡ");
			return false;
		}
		
		var data = {
				memEmail: memEmail,
				memName: memName
		}
		
		$.ajax({
			type: "post",
			url: "/notice/idForget.do",
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function(res){
				$("#id").html(res);
			}
		})
	})
	
	pwFindBtn.on('click', function(){
		var memEmail = $("#memEmail2").val();
		var memName = $("#memName2").val();
		var memId = $("#memId").val();
		
		if(memEmail2 == null || memEmail2 == ""){
			alert("이메일을 입력하세요 ㅡㅡ");
			return false;
		}
		if(memName2 == null || memName2 == ""){
			alert("이름을 입력하세요 ㅡㅡ");
			return false;
		}
		if(memId == null || memId == ""){
			alert("아이디 왜 안입력함? ㅡㅡ");
			return false;
		}
		
		var data = {
				memId: memId,
				memEmail: memEmail,
				memName: memName
		}
		$.ajax({
			type: "post",
			url: "/notice/pwForget.do",
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function(res){
				$("#password").html(res);
			}
		})
	})
})

</script>