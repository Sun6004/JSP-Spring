<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<%@include file="/menu.jsp" %>
	<%!
		// 변수 greeting, tagline에 각각 문자열을 저장하도록 선언문 태그를 작성한다.
		String greeting = "Welcome to Web Shopping Mall!";
		String tagline = "Welcome to Web Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline %>
			</h3>
			<%
				Date day = new Date();
				String am_pm;
				int hour = day.getHours();
				int min = day.getMinutes();
				int sec = day.getSeconds();
				if(hour / 12 == 0){
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour - 12;
				}
				String ct = hour + ":" + min + ":" + sec + " "+am_pm;
 				out.println("현재 접속 시각: " + ct + "\n");
			%>
				<br>
			<% 
 				Calendar now = Calendar.getInstance();
 				out.println("현재시간: " + now.getTime());
				
			%>
		</div>
		<hr/>
	</div>
	<%@ include file="/footer.jsp" %>
</body>
</html>










