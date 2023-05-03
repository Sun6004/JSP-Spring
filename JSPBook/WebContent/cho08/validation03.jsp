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
                                    	요효성 검사의 개요
                                    </h6>
                                </div>
                                <div class="card-body">
                                	<h3>javascript</h3>
                                	<form action="validation03_process2.jsp" method="post" name="loginForm">
	                                	아이디: <input type="text" name="id"> <br>
	                                	비밀번호: <input type="text" name="pw"> <br>
	                                	<input type="button" value="전송" onclick="CheckLogin()">
                                	</form>
                                	
                                	<hr>

									<h3>JQuery</h3>
                                	<form action="validation03_process2.jsp" method="post" id="loginForm2">
	                                	아이디: <input type="text" name="id2" id="id2"> <br>
	                                	비밀번호: <input type="text" name="pw2" id="pw2"> <br>
	                                	<input type="button" value="전송" id="btn">
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
<!--     <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<!--     <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script> -->
<!--     <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script> -->
<!--     <script type="text/javascript"> -->
    	
    <script type="text/javascript">
    function CheckLogin(){
    	var form = document.loginForm;
    	
    	if(form.id.value.length < 4 || form.id.value.length > 12){
    		alert("아이디는 4~12자 이내로 입력 가능합니다!")
    		form.id.selecr();
    		return false;
    	}
    	
    	if(form.pw.value.length < 4 ){
    		alert("비밀번호는 4자 이상 입력해야 합니다!")
    		form.id.selecr();
    		return false;
    	}
    	
    	form.submit();
    }
    
    </script>
</body>
</html>