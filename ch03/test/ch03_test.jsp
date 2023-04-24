<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="page_errorPage_error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
									<h6 class="m-0 font-weight-bold text-primary">test</h6>
								</div>
								<div class="card-body">
									<!-- 
                                		1) 리스트에서 406호 반 학생 이름을 모두 Core 태그 set에 저장한 후, 전체를 출력해주세요.
                                		2)  전체 출력을 4명씩 끊어서 출력해 주세요
                                		이름 이름 이름 이름
                                		이름 이름 이름 이름
                                		이름 이름 이름 이름
                                		:
                                		3)4명씩 끊어서 출력할 때, 본인의 이름은 본인으로 출력하시오
                                		4)본인 글자를 출력 시, 굵은 글씨/ 글자 색깔 녹색으로 출력해주세요.
                                		
                                		Core테그 set에 저장 시, 스크립틀릿을 활용하여 넣어도 무관!(자유롭게)
                                	 -->
									<%
									List<String> list = new ArrayList<String>();
									list.add("이름1");
									list.add("이름2");
									list.add("이름3");
									list.add("이름4");
									list.add("이성일");
									list.add("이름6");
									list.add("이름7");
									list.add("이름8");
									list.add("이름9");
									list.add("이름10");
									list.add("이름11");
									list.add("이름12");
									list.add("이름13");
									list.add("이름14");
									list.add("이름15");
									list.add("이름16");
									list.add("이름17");
									list.add("이름18");
									list.add("이름19");
									list.add("이름20");
									list.add("이름21");
									list.add("이름22");
									list.add("이름23");
									list.add("이름24");
									list.add("이름25");
									list.add("이름26");
									list.add("이름27");
									%>
									<%=list %>
									<p></p>
									<c:forEach items="<%=list %>" var="name" varStatus="stat">
										<c:choose>
											<c:when test="${name == '이성일'}">
												<span style="font-weight: bold; color: green;">본인</span>
											</c:when>
											<c:otherwise>
												<span>${name }</span>
											</c:otherwise>
										</c:choose>

										<c:if test="${stat.count % 4 == 0}">
											<br>
										</c:if>
										
									</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>