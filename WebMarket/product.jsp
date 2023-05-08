<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="vo.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
	String id = request.getParameter("id"); // 상품id를 꺼낸다
	ProductRepository productDAO = ProductRepository.getInstance();
	Product product = productDAO.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="" src="${pageContext.request.contextPath }/resources/images/<%=product.getFilename() %>" style="width:100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%= product.getProductId() %></span></p>
				<p><b>제조사</b> : <%=product.getManufacturer() %></p>
				<p><b>분류</b> : <%=product.getCategory() %></p>
				<p><b>재고 수</b> : <%=product.getUnitsInStock() %></p>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p>
					<form name="addForm" action='./addCart.jsp?id=<%=product.getProductId() %>' method="post">
						<a href="#" class="btn btn-info"> 상품 주문 &raquo;</a>
						<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a> 
						<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
					</form>
				</p>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
