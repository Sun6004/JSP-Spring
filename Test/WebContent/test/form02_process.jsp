<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    Enumeration<String> parameterNames = request.getParameterNames();
    StringBuffer sout = new StringBuffer();
    sout.append("<div>");
  	while(parameterNames.hasMoreElements()){
  		String names = parameterNames.nextElement();
  		String values = request.getParameter(names);
  		sout.append("<p>"+names+":"+values+"</p>" );
  	}
    sout.append("</div>");
    
    out.print(sout.toString());
    %>