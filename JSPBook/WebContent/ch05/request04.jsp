<%@page import="java.util.Enumeration"%>
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
                                    	request 내장 객체의 기능과 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
                               	<ul>
                               		<li>
                               			클라이언트 ip <br>
                               			- 웹 브라우저의 ip 주소를 가져옵니다. <br>
                               			- <%= request.getRemoteAddr() %>
                               		 </li>
                               		<li>
                               			요청 정보 길이 <br>
                               			- 웹 브라우저의 요청 파라미터 길이를 가져옵니다. <br>
                               			- <%= request.getContentLength() %>
                               		 </li>
                               		<li>
                               			요청 정보 인코딩 <br>
                               			- 웹 브라우저의 문자 인코딩을 가져옵니다. <br>
                               			- <%= request.getCharacterEncoding() %>
                               		 </li>
                               		<li>
                               			요청 정보 콘텐츠 유형 <br>
                               			- 웹 브라우저의 콘텐츠 유형을 가져옵니다. <br>
                               			- <%= request.getContentType() %>
                               		 </li>
                               		<li>
                               			요청 정보 프로토콜 <br>
                               			- 웹 브라우저의 요청 프로토콜을 가져옵니다. <br>
                               			- <%= request.getProtocol() %>
                               		 </li>
                               		<li>
                               			요청 정보 전송방식 <br>
                               			- 웹 브라우저의 요청 메서드(get,post)를 가져옵니다. <br>
                               			- <%= request.getMethod() %>
                               		 </li>
                               		<li>
                               			요청 Url<br>
                               			- 웹 브라우저가 요청한 url 주소를 가져옵니다. <br>
                               			- <%= request.getRequestURI() %>
                               		 </li>
                               		<li>
                               			컨텍스트 경로<br>
                               			- 현재 jsp 페이지의 웹 애플리케이션 컨텍스트 경로를 가져옵니다. <br>
                               			- <%= request.getContextPath() %>
                               		 </li>
                               		<li>
                               			서버이름<br>
                               			- 서버이름을 가져옵니다. <br>
                               			- <%= request.getServerName() %>
                               		 </li>
                               		<li>
                               			서버포트<br>
                               			- 실행중인 서버포트를 가져옵니다. <br>
                               			- <%= request.getServerPort() %>
                               		 </li>
                               		<li>
                               			쿼리문(Query String)<br>
                               			- 웹 브라우저의 전체 요청 파라미터 문자열[물음표(?) 다음 url에 할당된 문자열]을 가져옵니다. <br>
                               			- <%= request.getQueryString() %>
                               		 </li>                           		 
                               	</ul>
                                
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