<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<div class="input-group input-group-sm" style="width: 440px;">
								<select class="form-control">
									<option>제목</option>
									<option>작성자</option>
								</select> <input type="text" name="table_search"
									class="form-control float-right" placeholder="Search">
								<div class="input-group-append">
									<button type="submit" class="btn btn-default">
										<i class="fas fa-search"></i>검색
									</button>
								</div>
							</div>
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
								<tr>
									<td>10</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>9</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>8</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>7</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>6</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>5</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>4</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>3</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>2</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
								<tr>
									<td>1</td>
									<td>제목입니다1</td>
									<td>관리자</td>
									<td>2022-12-12</td>
									<td>1456</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
					<div class="card-footer clearfix">
						<ul class="pagination pagination-sm m-0 float-right">
							<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->



	</div>
	<!-- /.container-fluid -->
</section>
<!-- /.content -->