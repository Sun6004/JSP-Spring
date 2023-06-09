<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Blank Page</title>

</head>
<body class="hold-transition sidebar-mini">
  </aside>
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
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">${notice.boTitle }</h3>
							<div class="card-tools"> ${notice.boWriter } ${notice.boDate } ${notice.boHit } </div>
						</div>
						<form id="quickForm" novalidate="novalidate">
							<div class="card-body">${notice.boContent }</div>
							<div class="card-footer bg-white">
							<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
								<c:if test="${not empty notice.noticeFileList }">
									<c:forEach items="${notice.noticeFileList }" var="noticeFile" varStatus="vs">
									<li>
										<span class="mailbox-attachment-icon">
											<i class="far fa-file-pdf"></i>
										</span>
										<div class="mailbox-attachment-info">
											<a href="#" class="mailbox-attachment-name">
												<i class="fas fa-paperclip"></i> ${noticeFile.fileName }
												
											</a> 
											<span class="mailbox-attachment-size clearfix mt-1"> 
												<span>${noticeFile.fileFancysize }</span> 
												<c:url value="/notice/download.do" var="downloadURL">
													<c:param name="fileNo" value="${noticeFile.fileNo }"/>
												</c:url>
												<a href="${downloadURL }"> 
													<span class="btn btn-default btn-sm float-right">
														<i class="fas fa-download"></i>
													</span>
												</a>
											</span>
										</div>
									</li>
									</c:forEach>							
								</c:if>
							</ul>
						</div>
							<div class="card-footer">
								<button type="button" id="btnList" class="btn btn-primary">목록</button>
								<button type="button" id="btnModify" class="btn btn-info">수정</button>
								<button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
							</div>
						</form>
					</div>
				</div>
				<form action="/notice/delete.do" method="post" id="noticeForm">
					<input type="hidden" name="boNo" value="${notice.boNo }"/>
				</form>
				<div class="col-md-6"></div>
			</div>
		</div>
    </section>
</body>
<script type="text/javascript">
$(function(){
	var btnList = $('#btnList');
	var btnModify = $('#btnModify');
	var btnDelete = $('#btnDelete');
	var noticeForm = $('#noticeForm');
	
	btnList.on('click', function(){
		location.href = "/notice/list.do";
	})
	
	btnModify.on('click', function(){
		noticeForm.attr("method", "get");
		noticeForm.attr("action", "/notice/update.do");
		noticeForm.submit();
	})
	btnDelete.on('click', function(){
		if(confirm("정말 삭제하시겠습니까?")){
			noticeForm.submit();
		}
	})
})

</script>
</html>
