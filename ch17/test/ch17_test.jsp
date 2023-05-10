<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="errorPage_error.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
									<h6 class="m-0 font-weight-bold text-primary">JSTL이 제공하는
										태그의 종류와 사용법</h6>
								</div>
								<div class="card-body">
									<!-- 
                                	문제)
                                	406호 전원의 이름을,로 구분하여 각각 나눈후,
                                	'김'씨 성을 가진사람 몇명: 3
                                	'박'씨 성을 가진사람 몇명: 4
                                	....
                                	으로 출력해 주세요!
                                	406호 전원의 이름을 넣을때 스크립 틀릿을 활용해도 무방 또는 JSTL로 바로 값을 넣어도 무방
                                	1. JSTL을 이용하여 작성해 주세요.
                                 -->
									<c:set var="names" value="전지혜,신국현,이지영,김지완,이성일,신현근,박정수,변정민,정은지,
															  조성희,박윤수,조윤재,정재균,박승우,황지현,김민정,김동혁,고영우,
															  진현성,이수진,오미나,김민욱,홍기태,구기현,전다미,오대환,배문기,유이현" />
										
									<c:set var="nameArr" value="${fn:split(names, ',')}" />
									<c:set var="kim" value="0" />
									<c:set var="park" value="0" />
									<c:set var="lee" value="0" />
									<c:set var="byun" value="0" />
									<c:set var="jo" value="0" />
									
									<c:forEach items="${names}" var="name" varStatus="vs">
										<c:out value="${name}" />,
									</c:forEach>
									
									<c:forEach items="${nameArr}" var="name">
										<c:choose>
											<c:when test="${fn:startsWith(name, '김')}">
												<c:set var="kim" value="${kim + 1}" />
											</c:when>
											<c:when test="${fn:startsWith(name, '박')}">
												<c:set var="park" value="${park + 1}" />
											</c:when>
											<c:when test="${fn:startsWith(name, '이')}">
												<c:set var="lee" value="${lee + 1}" />
											</c:when>
											<c:when test="${fn:startsWith(name, '변')}">
												<c:set var="byun" value="${byun + 1}" />
											</c:when>
											<c:when test="${fn:startsWith(name, '조')}">
												<c:set var="jo" value="${jo + 1}" />
											</c:when>
										</c:choose>
									</c:forEach>
									<hr> <br>
									'김'씨 성을 가진 사람 몇명? : ${kim}<br>
									'박'씨 성을 가진 사람 몇명? : ${park}<br>
									'이'씨 성을 가진 사람 몇명? : ${lee}<br>
									'변'씨 성을 가진 사람 몇명? : ${byun}<br>
									'조'씨 성을 가진 사람 몇명? : ${jo}<br>
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
	<script
		src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>