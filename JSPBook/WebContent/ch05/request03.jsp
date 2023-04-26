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
                                <%
                                // 모든 헤더 이름을 가져오도록 request 내장 객체의 getHeaderNames() 메서드를 작성하고
                                // 이를 모두 저장하도록 Enumeration 객체 타입의 변수 en을 작성
                                Enumeration en = request.getHeaderNames();
                                
                                // Enumeration 객체 타입의 변수 en의 hasMoreElements()메서드를 통해
                                // 저장된 헤더 이름이 있을 때까지 반복하도록 while 문을 작성함.
                                while(en.hasMoreElements()){
                                	// 현재 헤더 이름을 가져오도록 Enumeration 객체 타입의 변수 en의 nextElement() 메서드를 작성함
                                	String headerName = (String)en.nextElement();
                                	// 설정된 헤더 이름의 값을 가져오도록 request 내장 객체의 getHeader() 메서드를 작성함
                                	String headerValue = request.getHeader(headerName);
                                	%>
                                	<!-- 현재 헤더 이름과 값을 출력하도록 표현문 태그를 작성함. -->
                                	<%=headerName %> : <%=headerValue %> <br>
                                	<%
                                }
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