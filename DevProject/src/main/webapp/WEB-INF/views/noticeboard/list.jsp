<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Header (Page header) -->
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>공지사항 게시판</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">DDIT HOME</a></li>
					<li class="breadcrumb-item active">공지사항 게시판</li>
				</ol>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="card-tools">				
							<form method="post" id="searchForm" class="input-group input-group-sm" style="width: 440px;">
								<input type="hidden" name="page" id="page">
								<select class="form-control" name="searchType">
									<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
									<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
								</select> <input type="text" name="searchWord"
									class="form-control float-right" placeholder="Search" value="${searchWord }">
								<div class="input-group-append">
									<button type="submit" class="btn btn-default">
										<i class="fas fa-search"></i>검색
									</button>
								</div>
							</form>
						</div>
						<h3 class="card-title">공지사항</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="width: 6%">#</th>
									<th style="width: px">제목</th>
									<th style="width: 12%">작성자</th>
									<th style="width: 12%">작성일</th>
									<th style="width: 10%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:set value="${pagingVo.dataList }" var="noticeList"></c:set>
								<c:choose>
									<c:when test="${empty noticeList }">
										<tr>
											<td colspan="5">조회하신 게시글이 존재하지 않습니다. </td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${noticeList }" var="notice">
											<tr>
												<td>${notice.boNo } </td>
												<td>
													<a href="/notice/detail.do?boNo=${notice.boNo }">
														${notice.boTitle } 
													</a> 
												</td>
												<td>${notice.boWriter } </td>
												<td>${notice.boDate } </td>
												<td>${notice.boHit } </td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>	
							</tbody>
						</table>
					</div>
					<div class="card-body">
						<button type="button" class="btn btn-primary" id="newBtn">등록</button>
					</div>
					<!-- /.card-body -->
					<div class="card-footer clearfix" id="pagingArea">
						${pagingVo.pagingHTML }
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
$(function(){
	var searchForm = $('#searchForm');
	var pagingArea = $('#pagingArea');
	var newBtn = $('#newBtn');
	
	pagingArea.on('click',"a", function(){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find('#page').val(pageNo);
		searchForm.submit();
	})
	
	newBtn.on('click', function(){
		location.href = "/notice/form.do";
	})
})

</script>