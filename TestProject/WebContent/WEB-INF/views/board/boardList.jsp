<%@page import="vo.BoardVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
	%>
	<h3>게시판 목록</h3>
	<table border="1">
		<thead> 
		<tr>
			<th>번호 </th>
			<th>작성자 </th>
			<th>제목 </th>
			<th>작성일 </th>
			<th>조회수 </th>
		</tr>
		</thead>
		
		<tbody>
		<%
		if(list != null){
			for(BoardVO mem : list) {
		%>
		<tr>
			<td> <a class="writer" href="<%=request.getContextPath()%>/boardDetail.do?writer=<%=mem.getBo_writer() %>">
			 <%=mem.getBo_no() %></a></td>
			<td><%=mem.getBo_writer() %> </td>
			<td><%=mem.getBo_title() %> </td>
			<td><%=mem.getBo_date() %> </td>
			<td><%=mem.getBo_hit() %> </td>
		</tr>
		<%
			}
		}else{
		%>
		<tr>
			<td colspan="5">조회할 게시글이 존재하지 않습니다. </td>
		</tr>
		<%
		
		}
		%>
		</tbody>
	</table>
	
</body>
</html>