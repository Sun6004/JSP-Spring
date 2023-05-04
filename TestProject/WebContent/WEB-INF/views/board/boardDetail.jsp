<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript">
	<%
		BoardVO vo = (BoardVO)request.getAttribute("BoardVo");
	%>
		$(function(){
			$('#del').on('click', function(){
				$.ajax({
					type: 'POST',
					url: '<%=request.getContextPath()%>/delBoard.do',
					data: {bo_no: $('p[name="no"]').text()},
					success: function(){
						alert("게시글 삭제 성공!")
					},
					error: function(xhr){
						alert("에러: "+xhr.status);
					},
					dataType: 'json'
				})
			})
			
			$('#upBtn').on('click', function(){
		        location.href = '<%=request.getContextPath()%>/updateBoard.jsp?no=<%=vo.getBo_no()%>';
		    });
		})
	</script>
</head>
<body>

	<h2> 게시판 상세정보</h2>
	<div>
		<p name="no"><%=vo.getBo_no() %> </p>
		<p>제목: <%=vo.getBo_title() %> </p>
		<p><%=vo.getBo_writer()%> <%=vo.getBo_date()%> </p>
		<p>내용:<%=vo.getBo_content() %> </p>
		<button type="button" value=" 수정" id="upBtn"></button>
		<input type="button" value="삭제" id="del">
		<a href="./boardList.jsp"><input type="button" value="목록"> </a>
	</div>
</body>
</html>