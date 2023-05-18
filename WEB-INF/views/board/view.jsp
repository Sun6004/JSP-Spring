<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일반게시판 상세보기</title>

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
							<h1>공지사항 상세보기</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">DDIT HOME</a></li>
								<li class="breadcrumb-item active">공지사항 상세보기</li>
							</ol>
						</div>
					</div>
				</div>
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">${board.boTitle }</h3>
									<div class="card-tools">${board.boWriter } ${board.boDate } ${board.boHit }</div>
								</div>
								<div class="card-body">${board.boContent }</div>
								<div class="card-footer">
									<button type="button" class="btn btn-primary" id="listBtn">목록</button>
									<button type="button" class="btn btn-info" id="updateBtn">수정</button>
									<button type="button" class="btn btn-danger" id="delBtn">삭제</button>
								</div>
							</div>
						</div>
						<!-- 수정/삭제 이벤트에 공용으로 사용 -->
						<form action="/board/update.do" method="get" id="nFrm">
							<input type="hidden" name="boNo" value="${board.boNo }">
						</form>
						<div class="col-md-6"></div>
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
		var listBtn = $("#listBtn");
		var updateBtn = $("#updateBtn");
		var delBtn = $("#delBtn");
		var nFrm = $("#nFrm");
		
		listBtn.on('click', function(){
			location.href = "/board/list.do";
		})
		
		updateBtn.on('click', function(){
			// 수정처리(페이지로 이동합니다.)
			nFrm.submit();
		})
		
		delBtn.on('click', function(){
			//삭제처리
			if(confirm("정말 삭제하시겠습니까?")){
				//삭제처리 실행
				nFrm.attr("method", "post");
				nFrm.attr("action", "/board/delete.do");
				nFrm.submit();
			}else{
				//삭제 취소
				nFrm.reset();
			}
		})
	})
</script>
</html>
