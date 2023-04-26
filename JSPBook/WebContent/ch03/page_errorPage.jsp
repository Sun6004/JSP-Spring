<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page errorPage="page_errorPage_error.jsp" %>
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
                                    	page 디렉티브 태그의 기능과 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
                                	<%
                                		// 기본적으로 500, NullPointerException이 발생하여 브라우저 화면상에서 500 에러 페이지가 나타나야 하지만,
                                		// out.println(str.toString());에서 발생한 에러를 크롬에서 제대로 된 소스로 인식하지 않고.
                                		// 완전하지 않은 소스라고 분류하여 에러가 난 시점에서 브라우저상의 화면 그리기를 멈추고 아래와 같은 에러를 
                                		// 발생시킬 수 있다.
                                		// to load resource : net::ERR_IMCOMPLETE_CHUNKED_ENCODING
                                		// 여러가지 상황에 의해서 발생할 수 있는 에러로, 페이지를 그려낼 때 완전하지 못한 소스가 존재할 경우 발생한다.
                                		//
                                		// 1.화면에서 500에러페이지를 확인하지 않고 이클립스 콘솔에서 500에러 확인가능
                                		// 2.화면에서 500에러 확인가능
                                		// 3.에러가 발생한 시점에서 errorPage에 설정된 에러 페이지로 이동하여 커스텀 에러 페이지를 확인할 수 있다.
                                		
                                		String str = null;
                                		out.println(str.toString());
                                	%>
                                	
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