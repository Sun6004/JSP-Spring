<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script> -->
<section class="content">
	<div class="row mb-2">
		<div class="col-sm-6">
			<h1>General Form</h1>
		</div>
		<div class="col-sm-6">
			<ol class="breadcrumb float-sm-right">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active">General Form</li>
			</ol>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row" style=" justify-content: center; " >

			<div class="col-md-6" style="width: 800px">

				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title"> 공지사항 등록</h3>
					</div>

					<form id="frm" name="frm" action="/notice/generalFormPost" method="post" enctype="multipart/form-data">
						<div class="card-body">
							<div class="form-group">
								<label for="exampleInputEmail1">제목</label> <input
									type="text" class="form-control" id="boTitle" name="boTitle"
									placeholder="제목을 입력해주세요" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">내용</label>
								<textarea id="boContent" name="boContent" rows="3" cols="5" placeholder="내용을 입력해주세요.">
								</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">작성자</label> <input
									type="text" class="form-control" id="boWriter" name="boWriter"
									placeholder="작성자를 입력해주세요" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputFile">File input</label>
								<div class="input-group">
									<div class="custom-file">
										<input type="file" name="" class="custom-file-input" id="exampleInputFile" multiple="multiple">
										<label class="custom-file-label" for="exampleInputFile">
											Choose file
										</label>
									</div>
								</div>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
						</div>

						<div class="card-footer">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	CKEDITOR.replace("boContent")
</script>