<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                 <div class="col-md-2">
                    <label for="title" class="col-form-label">제목</label>
                 </div>
                 <div class="col-md-10">
                	 <!-- Map에는 대문자로 저장되기 때문에 대문자로 적음 -->
                    ${book.TITLE }
                 </div>
              </div>
           </div>
           <div class="col-md-12 mb-2">
              <div class="row">
                 <div class="col-md-2">
                    <label for="category" class="col-form-label">카테고리</label>
                 </div>
                 <div class="col-md-10">
                     ${book.CATEGORY }
                 </div>
             </div>
           </div>
           <div class="col-md-12 mb-2">
              <div class="row">
                 <div class="col-md-2">
                    <label for="price" class="col-form-label">가격</label>
                 </div>
                 <div class="col-md-10">
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.PRICE }"/>
                 </div>
              </div>
           </div>
           <div class="col-md-12 mb-2">
              <div class="row">
                 <div class="col-md-2">
                    <label for="price" class="col-form-label">입력일</label>
                 </div>
                 <div class="col-md-10">
                     <fmt:formatDate value="${book.INSERT_DATE }" pattern="yyyy.MM.dd HH:mm:ss"/>
                 </div>
              </div>
           </div>
           <a href="/book/update.do?bookId=${bookId }" class="btn btn-info">수정</a>
           <a href="/book/list.do" class="btn btn-primary">목록</a>
			
			<form action="/book/delete.do" method="post" id="delForm">
	           <input type="hidden" name="bookId" value="${bookId }">			
	           <input type="button" id="delBtn" class="btn btn-danger" value="삭제">			
			</form>
        </div>
      <hr/>
   </div>
</body>

<script type="text/javascript">
	$(function(){
		var delBtn = $("#delBtn")
		var delForm = $("#delForm")
		
		delBtn.on('click', function(){
			if(confirm("정말로 삭제하시겠습니까?")){
				delForm.submit();
			}else{
				delForm.reset();
			}
		})
	})
</script>
</html>