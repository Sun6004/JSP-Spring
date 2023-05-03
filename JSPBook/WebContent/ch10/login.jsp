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
                                    	선언적 시큐리티 처리
                                    </h6>
                                </div>
                                <div class="card-body">
                                <!-- 
                                	tomcat-users.xml 에서 설정한 역할당 계정들 중, 인증을 진행할 역할과 동일한 계정으로 인증 시,
                                	정상적인 요청 및 인증이므로 로그인이 진행 될 수 있다. 하지만
                                	인증을 진행 할 역할과 다른 역할의 계정으로 인증 시, 403 Forbidden 에러로 '엑세스 거부' 가 출력된다.
                                	
                                	로그인 인증 처리를 위한 form태그 작성
                                	- 폼 기반 인증을 처리하도록 action 속성값을 j_security_check로 무조건 작성해야 한다.   
                                 -->
                                	<form action="j_security_check" method="post" name="loginForm">
                                		ID: <input type="text" name="j_username"> <br>
                                		PW: <input type="text" name="j_password"> <br>
                                		<input type="submit" value="전송">
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!--     <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script> -->
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
    <script type="text/javascript">
    
    </script> 
</body>
</html>