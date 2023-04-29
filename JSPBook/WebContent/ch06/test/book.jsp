<%@page import="dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String id=request.getParameter("id");
		BookRepository dao=BookRepository.getInstance();
		Book book=dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-11">
            	<img src="${pageContext.request.contextPath}/resources/images/<%=book.getFilename() %>" style="width:200px"/>
         	</div>
			<div class="col-md-6">
				<h3>[<%=book.getCategory()%>] <%=book.getName()%></h3>
				<p><%=book.getDescription()%>
				<p><b>도서 코드:</b><span class="badge badge-danger">
				
				<%=book.getBookId() %></span>
				<p><b>출판사</b> : <%=book.getPublisher()%>
				<p><b>저자</b> : <%=book.getAuthor() %>
				<p><b>재고수</b> : <%=book.getUnitsInStock() %>
				<p><b>총 페이지수</b> : <%=book.getTotalPages() %>
				<p><b>출판일</b> : <%=book.getReleaseDate() %>
				<h4><%=book.getUnitPrice()%>원</h4>
				<form name="addForm" action="./addCart.jsp" method="get">
				<input type="hidden" value="<%=book.getBookId() %>" name="id">
				<p> <a href="#" class="btn btn-info"> 도서 주문&raquo</a>
				 <a href="./books.jsp" class="btn btn-secondary">도서 목록 &raquo</a>
				 </form>
			</div>
						
		</div> 
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
</body>
</html>
