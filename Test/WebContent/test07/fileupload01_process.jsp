<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String filePath = request.getServletContext().getRealPath("/resources/images");
	MultipartRequest mult = new MultipartRequest(request,filePath, 5*1024*1024, "utf-8");
	Enumeration params = mult.getParameterNames();
	
	while(params.hasMoreElements()){
		String name = (String)params.nextElement();
		String value = mult.getParameter(name);
		out.println(name + " = " + value + "<br>");
	}
	
	Enumeration files = mult.getFileNames();
	
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
		String filename = mult.getFilesystemName(name);
		String orignal = mult.getOriginalFileName(name);
		String type = mult.getContentType(name);
		File file = mult.getFile(name);
		
		out.println("요청 파라미터 이름: "+ name + "<br>");
		out.println("실제 파일 이름: "+ orignal + "<br>");
		out.println("저장 파일 이름: "+ filename + "<br>");
		out.println("파일 콘텐츠 유형: "+ type + "<br>");
		
		if(file != null){
			out.println("파일크기: "+file.length());
			out.println("<br>");
		}
	}
%>