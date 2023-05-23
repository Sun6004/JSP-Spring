<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일반게시판 목록</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" data-widget="pushmenu" href="#" role="button">
						<i class="fas fa-bars"></i>
					</a>
				</li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" data-widget="navbar-search" href="#" role="button"> 
						<i class="fas fa-search"></i>
					</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button" data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>
				<li class="nav-item">
					<a class="nav-link" data-widget="fullscreen" href="#" role="button"> 
						<i class="fas fa-expand-arrows-alt"></i>
					</a>
				</li>
			</ul>
		</nav>

		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<a href="#" class="brand-link"> 
				<img src="${pageContext.request.contextPath}/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">DDIT BOARD</span>
			</a>

			<div class="sidebar">
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">홍길동</a>
					</div>
				</div>

				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-header">MAIN MENU</li>
						<li class="nav-item">
							<a href="#" class="nav-link"> 
								<i class="nav-icon fas fa-tachometer-alt"></i>
								<p>일반게시판 <i class="right fas fa-angle-left"></i></p>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</aside>

		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>일반게시판</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">DDIT HOME</a></li>
								<li class="breadcrumb-item active">일반게시판</li>
							</ol>
						</div>
					</div>
				</div>
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-tools">
										<form class="input-group input-group-sm" method="post" id="searchForm" style="width: 440px;">
											<input type="hidden" name="page" id="page" />
											<select class="form-control" name="searchType">
												<option value="title" <c:if test="${searchType == 'title' }"><c:out value="selected"/></c:if>>제목</option>
												<option value="writer" <c:if test="${searchType == 'writer' }"><c:out value="selected"/></c:if>>작성자</option>
											</select>
											<input type="text" name="searchWord" class="form-control float-right" value="${searchWord }" placeholder="Search">
											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>검색
												</button>
											</div>
										</form>
									</div>
									<h3 class="card-title">일반게시판</h3>
								</div>
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
										<c:set value="${pagingVo.dataList }" var="boardList"/>
										<c:choose>
											<c:when test="${empty boardList }">
												<tr>
													<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${boardList }" var="board">
													<tr>
														<td>${board.boNo } </td>
														<td>
															<a href="/board/detail.do?boNo=${board.boNo }">
																${board.boTitle } 
															</a>
														</td>
														<td>${board.boWriter } </td>
														<td>${board.boDate } </td>
														<td>${board.boHit } </td>
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
								<div class="card-footer clearfix" id="pagingArea">
									${pagingVo.pagingHTML }
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>DDIT Spring1</b> 1.0.0
			</div>
			<strong>Copyright &copy; 2023 DDIT SPRING.</strong> All rights reserved.
		</footer>

		<aside class="control-sidebar control-sidebar-dark">
		</aside>
	</div>

	<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
</body>
<script type="text/javascript">
	$(function(){
		var newBtn = $("#newBtn");
		var searchForm = $("#searchForm");
		var pagingArea = $("#pagingArea");
		
		pagingArea.on('click','a',function(){
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find('#page').val(pageNo);
			searchForm.submit();
		})
		
		newBtn.on('click', function(){
			location.href="/board/form.do";
		})
	})
</script>
</html>
