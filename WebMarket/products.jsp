<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
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
	<%
	ProductRepository productDAO = ProductRepository.getInstance();
	ArrayList<Product> listProducts = productDAO.getAllProduct();
	%>
	<div class="container">
		<div class="row" align="center">
		<%
			for(int i =0; i< listProducts.size(); i++){
				Product product = listProducts.get(i);
		%>
			<div class="col-md-4">  
				<img alt="" src="${pageContext.request.contextPath }/resources/images/<%=product.getFilename() %>" style="width:100px">
				<h3><%= product.getPname()%></h3>
				<p><%= product.getDescription() %> </p>
				<p><%=product.getUnitPrice() %> 원 </p>
				<p><a href="./product.jsp?id=<%= product.getProductId() %>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
			</div>
			<%
				} //for문
			%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
