<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("cartId");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("cart.jsp");
	}
	
	session.invalidate();
	response.sendRedirect("cart.jsp");
%>