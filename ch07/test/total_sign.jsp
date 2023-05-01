<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	로그인
                                    </h6>
                                </div>
                                <div class="card-body">
                              	<!-- 
								1.아이디, 비밀번호, 로그인 버튼을 이용하여 total_sign_process.jsp로 이동하여
								로그인 처리를 진행해 주세요.
								
								2. 로그인시, 등록된 회원이 존재하지 않는 경우 '존재하지 않는 회원입니다!' 메세지가 출력되게 해주세요.
								
								3. 회원가입 버튼을 생성하고, 회원 가입 버튼을 클릭 시 회원가입 페이지로 이동합니다.
								 -->
								 <form action="total_sign_process.jsp" method="post">
								 <div>
									 <p>아이디: <input type="text" name="id"> </p><br>
									 <p>비밀번호: <input type="password" name="pw"> </p><br>
								 </div>
								 <br>
								 <div>
								 	<input type="submit" value="로그인">
								 	<a href="total_signup.jsp"> <input type="button" value="회원가입"> </a>
								 </div>								 
								 </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>

