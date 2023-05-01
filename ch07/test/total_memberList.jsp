<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
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
	MemberDAO dao = MemberDAO.getInstance();
	ArrayList<MemberVO> list = dao.getMemberList();
%>
	<!-- 
	 	1. 로그인 성공 후, 넘어왔을 때 a001님 환영합니다! 메세지 출력을 완성해 주세요
	 	
	 	2. 회원 목록에 저장되어 있는 회원 모두를 출력해주세요.
	 	
	 		이미지		|	회원정보	|	버튼
	 	------------------------------------------
	 					| 아이디: a001	|
	 		이미지		| 비번: 1234	|	[상세정보]
	 					| 이름: 홍길동	|
	 					| 성별: 남자	|
	 -----------------------------------------------	
	 -->
	 <%
	 for(int i = 0; i<list.size(); i++){
	%>
		
	<%  
	 }
	 %>
	 
</body>
</html>