<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>대덕인재개발원 JSP</title>
<link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="/include/header.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="/include/nav.jsp"%>
				<div class="container-fluid">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<!-- Basic Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">유효성 검사의 개요</h6>
								</div>
								<div class="card-body">
									<h3>문제 풀어보기</h3>
									<form action="ch08_test__process.jsp" method="post" name="test">
										<h4>숫자만 입력하되, 7~12자리까지만 입력 받을수 있게 설정하시오.</h4>
										<input type="text" id="q1" name="q1"> <br>

										<h4>시작은 영소문자 a,b,c 이고 영소대문자 8~12자리까지만 입력받을 수 있게 설정하시오.</h4>
										<input type="text" id="q2" name="q2"> <br>

										<h4>아이디는 영소문자로 시작하고 영소문자, 숫자 8-16자로 설정하시오.</h4>
										아이디: <input type="text" id="id" name="id"> <br>

										<h4>비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정하시오.</h4>
										비밀번호: <input type="text" id="pw" name="pw"> <br>

										<h4>이름은 한글 2-5글자로 설정하시오.</h4>
										이름: <input type="text" id="name" name="name"> <br>

										<h4>
											폰번호의 첫번째 자리는 010,016,017,019,070,010으로 시작하고, <br> 두번째
											자리는 숫자 3자리 또는 4자리로 시작하고 <br> 세번째 자리는 숫자 4자리로 설정해주세요. <br>

										</h4>
										phone: <input type="text" id=ph1 name="phone"> - <input
											type="text" name="ph2" size="4" maxlength="4">- <input
											type="text" name="ph3" size="4" maxlength="4"><br>

										<input type="button" id="btn" value="전송" />
										<!-- 
	                                		정규식테스트 사이트
	                                		작성하고자 하는 정규식 사이트는 여기서 참고!
	                                		http://regexr.com
	                                	 -->
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="/include/footer.jsp"%>
		</div>
	</div>

	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

	<script type="text/javascript">
		$(function(){
		
			//숫자만 입력하되, 7~12자리까지만 입력 받을수 있게 설정
			var Expq1 = /^[0-9]{7,12}$/;
			//시작은 영소문자 a,b,c 이고 영소대문자 8~12자리까지만 입력받을 수 있게 설정
			var Expq2 = /^[a-c]*[a-zA-Z]{8,12}$/;
			//아이디는 영소문자로 시작하고 영소문자, 숫자 8-16자로 설정하시오.
			var Expq3 = /^[a-z]*[0-9a-zA-Z]{8,16}$/;
			//비밀번호는 영대문자로 시작하고 영문 대소문자, 숫자, 특수문자 8~16자로 설정 
			var Expq4 = /^[A-Z]*([-_/.]?[0-9a-zA-Z]){8,16}$/;
			//이름은 한글 2-5글자로 설정
			var Expq5 = /^[가-힣]{2,5}$/;
			//폰번호의 첫번째 자리는 010,016,017,019,070,010으로 시작하고,
			//두번째 자리는 숫자 3자리 또는 4자리로 시작하고
			//세번째 자리는 숫자 4자리로 설정해주세요.
			var Expq6 = /^(010|016|017|019|070)-\d{3,4}-\d{4}$/;

			$("q1").focusout(function(){
				if(!Expq1.test($("#q1").val())){
					$("#err_q1").html("숫자만입력하되, 7-12자리까지만 입력받을 수 있게 설정");
					$("#err_q1").css("color","red");
					return false;
				}else{
					$("#err_q1").html("정상");
					$("#err_q1").css("color","green");
				}
			});
			var form = document.test;

			var q1 = form.q1.value;
			var q2 = form.q2.value;
			var id = form.id.value;
			var pw = form.pw.value;
			var name = form.name.value;
			var phone = form.ph1.value + "-" + form.ph2.value + "-"
					+ form.ph2.value;

			if (!Expq1.test(q1)) {
				alert("정규식 규칙에 맞지 않습니다!");
				form.q1.select();
				return false;
			}
			if (!Expq2.test(q2)) {
				alert("정규식 규칙에 맞지 않습니다!");
				form.q2.select();
				return false;
			}
			if (!Expq3.test(id)) {
				alert("정규식 규칙에 맞지 않습니다!");
				form.id.select();
				return false;
			}
			if (!Expq4.test(pw)) {
				alert("정규식 규칙에 맞지 않습니다!");
				form.pw.select();
				return false;
			}
			if (!Expq5.test(name)) {
				alert("정규식 규칙에 맞지 않습니다!");
				form.name.select();
				return false;
			}
			if (!Expq6.test(phone)) {
				alert("정규식 규칙에 맞지 않습니다!");
				form.phone.select();
				return false;
			}
			form.submit();
			});
		}
	</script>
</body>
</html>