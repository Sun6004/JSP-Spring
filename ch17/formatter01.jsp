<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="errorPage_error.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <%
                                	int num1 = 123456789;
                                	int num2 = 123;
                                	double num3 = 123.45;
                                	double num4 = 123456.123;
                                %>
                                <c:set value="<%=num1 %>"  var="num1"/>
                                <c:set value="<%=num2 %>"  var="num2"/>
                                <c:set value="<%=num3 %>"  var="num3"/>
                                <c:set value="<%=num4 %>"  var="num4"/>
                                <!-- 
                                	formatNumber 태그
                                	-type: type속성이 "currency" 일 경우 인식할 화폐 단위
                                		> 해당 화폐 단위는 브라우저에서 설정되어 있는 통화 기호를 기준으로 설정
                                	- groupingUsed: ','와 같은 각 숫자 단위의 구분자 표시여부
                                	- minFractionDigits: 화면에 표시할 소숫점 이하 숫자의 최소 개수
                                	- maxFractionDigits: 화면에 표시할 소숫점 이하 숫자의 최대 개수
                                 -->
                                
                                <h3>FormatNumber</h3>
                                <fmt:formatNumber value="${num1 }"/> <br>
                                <fmt:formatNumber value="${num1 }" groupingUsed="false"/> <br>
                                <fmt:formatNumber value="${num1 }" type="currency"/> <br>
                                <fmt:formatNumber value="${num4 }" minFractionDigits="6"/> <br>
                                <fmt:formatNumber value="${num4 }" maxFractionDigits="3"/> <br>
                                
                                <h3>FormatDate</h3>
                                <c:set value="<%=new java.util.Date() %>" var="date"/>
                                기본: <fmt:formatDate value="${date }"/> <br>
                                날짜: <fmt:formatDate value="${date }" type="date"/> <br>
                                시간: <fmt:formatDate value="${date }" type="time"/> <br>
                                날짜/시간: <fmt:formatDate value="${date }" type="both"/> <br>
                                패턴: <fmt:formatDate value="${date }" pattern="yyyy-MM-dd hh:mm:ss"/> <br>
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