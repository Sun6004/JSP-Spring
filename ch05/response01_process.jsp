<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 페이지에서 입력한 한글을 처리하도록 request 내장 객체의 setCharacterEncoding 메서드에 문자 인코딩유형 작성
	request.setCharacterEncoding("utf-8");
	
	// 입력한 아이디, 비밀번호를 폼 태그로부터 전송받도록 request 내장 객체의 getParameter() 메서드 작성
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("admin") && pw.equals("1234")){
		response.sendRedirect("respnse01_success.jsp");
	}else{
		response.sendRedirect("respnse01_failed.jsp");
		
	}
 %>