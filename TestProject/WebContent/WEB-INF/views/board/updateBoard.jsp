<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#update').on('click', function(){
			$.ajax({
				 type: 'POST',
			      url: '<%=request.getContextPath()%>/updateBoard.do',
			      data: $('#form').serialize(),
			      succes: function(res){
			    	  alert("게시글 수정완료!");
			      },
			      error: function(xhr){
			    	  alert("게시글 수정 실패!");
			      },
			      dataType: 'json'
			})
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="" method="post">
			<p> </p>
			<p>제목: <input type="text" name="title"> </p>
			<p>내용: <input type="text" name="content"> </p>
			<button type="button" value="수정완료" id="update"></button>
		</form>
	</div>
</body>
</html>