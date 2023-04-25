<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath }/resources/images/<%-- P_FILENAME --%>" style="width: 98%">
				<h3><%-- P_NAME --%></h3>
				<p><%-- P_DESCRIPTION --%>
				<p><%-- P_UNITPRICE --%>원
				<p><a href="./product.jsp?id=<%-- P_ID --%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
