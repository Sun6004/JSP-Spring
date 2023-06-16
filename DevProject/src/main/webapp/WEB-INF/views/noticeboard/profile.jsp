<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>Profile</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">User Profile</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<section class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">

				<div class="card card-primary card-outline">
					<div class="card-body box-profile">
						<div class="text-center">
							<img class="profile-user-img img-fluid img-circle" src="${member.memProfileImg }" alt="User profile picture">
						</div>

						<h3 class="profile-username text-center">${member.memName }</h3>
						<p class="text-muted text-center">${member.memRegDate }</p>
						<br />
						<p class="text-muted text-center">작성한 게시물</p>

						<ul class="list-group list-group-unbordered mb-3">
							<li class="list-group-item">
								<b>공지사항</b> 
								<a class="float-right">356</a>
							</li>
							<li class="list-group-item">
								<b>자유게시판</b> 
								<a class="float-right">150</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="card">
					<div class="card-header p-2">
						<ul class="nav nav-pills">
							<li class="nav-item">
								<a class="nav-link active" href="#settings" data-toggle="tab">내정보</a>
							</li>
						</ul>
					</div>
					<div class="card-body">
						<div class="tab-content">
							<div class="tab-pane active" id="settings">
								<form class="form-horizontal" action="/notice/profileUpdate.do?${_csrf.parameterName }=${_csrf.token}" method="post" id="profileUdtForm" enctype="multipart/form-data">
									<input type="hidden" name="memNo" id="memNo" value="${member.memNo }">
									<div class="form-group row">
										<label for="memProfileImg" class="col-sm-2 col-form-label">프로필이미지</label>
										<div class="row">
											<a href="${member.memProfileImg }" target="_blank">
												<img class="profile-user-img img-fluid img-circle" id="profileImg" src="${member.memProfileImg }" alt="User profile picture" style="width: 150px;">
											</a>
										</div>
									</div>
									<div class="form-group row">
										<label for="memProfileImg" class="col-sm-2 col-form-label"></label>
										<div class="col-md-10">
											<br/>
											<div class="custom-file">
												<input type="file" class="custom-file-input" name="imgFile" id="imgFile" > 
												<label class="custom-file-label" for="imgFile">프로필 이미지를 선택해주세요</label>
											</div>										
										</div>
									</div>
									<div class="form-group row">
										<label for="memId" class="col-sm-2 col-form-label">아이디</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="memId" name="memId" value="${member.memId }" placeholder="아이디를 입력해주세요." readonly="readonly">
										</div>
									</div>
									<div class="form-group row">
										<label for="memPw" class="col-sm-2 col-form-label">비밀번호</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="memPw" name="memPw" value="${member.memPw }" placeholder="아이디를 입력해주세요.">
										</div>
									</div>
									<div class="form-group row">
										<label for="memName" class="col-sm-2 col-form-label">이름</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="memName" name="memName" value="${member.memName }" placeholder="비밀번호를 입력해주세요.">
										</div>
									</div>
									<div class="form-group row">
										<label for="" class="col-sm-2 col-form-label">성별</label>
										<div class="col-sm-10">
											<div class="icheck-primary d-inline">
												<input type="radio" id="memGenderM" name="memGender" value="M" <c:if test="${member.memGender eq 'M' }">checked</c:if>> 
												<label for="memGenderM">남자</label>
											</div>
											<div class="icheck-primary d-inline">
												<input type="radio" id="memGenderF" name="memGender" value="F" <c:if test="${member.memGender eq 'F' }">checked</c:if>> 
												<label for="memGenderF">여자</label>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="memEmail" class="col-sm-2 col-form-label">이메일</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="memEmail" name="memEmail" value="${member.memEmail }" placeholder="이메일을 입력해주세요.">
										</div>
									</div>
									<div class="form-group row">
										<label for="memPhone" class="col-sm-2 col-form-label">전화번호</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="memPhone" name="memPhone" value="${member.memPhone }" placeholder="전화번호를 입력해주세요.">
										</div>
									</div>
									<div class="input-group mb-3">
										<label for="" class="col-sm-2 col-form-label">주소</label>
										<div class="col-sm-10">
											<div class="input-group mb-3">
												<input type="text" class="form-control" id="memPostCode" name="memPostCode" value="${member.memPostCode }" placeholder="우편번호를 입력해주세요"> 
												<span class="input-group-append">
													<button type="button" onclick="DaumPostCode()" class="btn btn-secondary btn-flat">우편번호 찾기</button>
												</span>
											</div>
											<div class="input-group mb-3">
												<input type="text" class="form-control" id="memAddress1" name="memAddress1" value="${member.memAddress1 }" placeholder="주소를 입력해주세요">
											</div>
											<div class="input-group mb-3">
												<input type="text" class="form-control" id="memAddress2" name="memAddress2" value="${member.memAddress2 }" placeholder="상세주소를 입력해주세요">
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="offset-sm-2 col-sm-10">
											<button type="submit" class="btn btn-info">수정하기</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	var imgFile = $("#imgFile");
	
	imgFile.on('change', function(event){		
		var file = event.target.files[0];
		
		if(isImageFile(file)){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#profileImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{ // 이미지 파일을 선택하지 않음
			alert("이미지 파일을 선택해 주세요!");
		}
	})
})

// 이미지 파일 체크(확장자를 이용해서)
function isImageFile(file){
	var ext = file.name.split(".").pop().toLowerCase(); // 파일에서 확장자를 가져온다.
	return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1 ) ? false : true;
}

function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('memPostCode').value = data.zonecode;
            document.getElementById("memAddress1").value = addr;
            document.getElementById("memAddress2").focus();
        }
    }).open();
}
</script>
