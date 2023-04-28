<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String[] selected = request.getParameterValues("f");
%>

선택한 과일 <br>
<%
	for(String fruit : selected ){
		
%>
<%=fruit  %>
<%
	}
%>