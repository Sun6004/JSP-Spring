<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="errorPage_error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    	JSTL이 제공하는 태그의 종류와 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
                                	browser 변수값 설정
                                	<hr>
                                	<c:set value="${header }" var="hd"/>
                                	<c:set value="${header['User-Agent'] }" var="userAgent"/>
                                	<br> <hr>
                                	User-Agent : <c:out value="${hd['User-Agent'] }"/> <br>
                                	Host : <c:out value="${hd['Host'] }"/><br>
                                	Accept : <c:out value="${hd['Accept'] }"/><br>
                                	Accept-Language : <c:out value="${hd['Accept-Language'] }"/><br>
                                	Accept-Encoding : <c:out value="${hd['Accept-Encoding'] }"/><br>
                                	Referer : <c:out value="${hd['Referer'] }"/><br>
                                	Connection : <c:out value="${hd['Connection'] }"/><br>
                                	Cache-Control : <c:out value="${hd['Cache-Control'] }"/><br>
                                	
                                	<hr>
                                	
                                	userAgent: <c:out value="${userAgent }"/>
                                	<p>변수 값 제거 후 </p>
                                	<c:remove var="userAgent"/>
                                	userAgent : <c:out value="${userAgent }"/>
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