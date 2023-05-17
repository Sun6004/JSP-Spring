<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
  <div class="jumbotron">
     <div class="container">
        <h1 class="display-4">책 상세보기</h1>
     </div>
  </div>
  
  <div class="container">
        <div class="row">
	        <div class="col-md-12 mb-2">
	        	<div class="row">
		        	<div class="col-md-7">
		        	<div class="col-md-5">
		        		<form action="">
		        			<div class="row">
		        				<div class="col-md-10">
		        					<input type="text" placeholder="검색" class="form-control" name="keyword" value="${keyword }">
		        				</div>
		        				<div class="col-md-2">
		        					<input type="submit" placeholder="검색" class="btn btn-secondary" value="검색">
		        				</div>
		        			</div>
		        		</form>	
		        	</div>
		        	</div>
	        	</div>
	        </div>
           <div class="col-md-12 mb-2">
              <div class="row">
                <table class="table">
                	<thead class="table-dark">
                		<tr>
                			<th>제목 </th>
                			<th>카테고리 </th>
                			<th>가격 </th>
                		</tr>
                	</thead>
                	<tbody>
                		<c:choose>
                			<c:when test="${empty list }">
                				<tr>
                					<td colspan="3">조회하신 게시글이 존재하지 않습니다. </td>
                				</tr>
                			</c:when>
                			<c:otherwise>
                				<c:forEach items="${list }" var="book">
                					<tr>
			                			<td>
			                				<a href="/book/detail.do?bookId=${book.BOOK_ID }">
			                					${book.TITLE }			                				
			                				</a>
			                			</td>
			                			<td>${book.CATEGORY } </td>
			                			<td>
			                				<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.PRICE }"/>
			                			</td>
			                		</tr>	
                				</c:forEach>
                			</c:otherwise>
                		</c:choose>     		
                	</tbody>
                </table>
              </div>
           </div>
         </div> 
         <a href="/book/form.do" class="btn btn-primary">등록</a>
      <hr/>
   </div>
</body>


</html>