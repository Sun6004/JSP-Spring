<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    String email = request.getParameter("mail");
   
    StringBuffer sout = new StringBuffer();
    sout.append("<div>");
    sout.append("<p>이름: " +name +"</p>");
    sout.append("<p>주소: " +addr +"</p>");
    sout.append("<p>이메일: " +email +"</p>");
    sout.append("</div>");
    
    out.print(sout.toString());
    %>
    
    