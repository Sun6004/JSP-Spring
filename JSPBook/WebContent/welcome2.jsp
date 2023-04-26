<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<!-- menu 부분 -->
	<nav class="navbar navbar-expand  navbar-dark bg-dark">
		<div class="container">			
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp">Home</a>
			</div>
		</div>	
	</nav>
	<!-- menu 부분 End -->
<%-- 	<%@include file="../menu.jsp" %> --%>
	<!-- 
		선언문 태그를 선언하고
		문자열 greeting 변수에 "Book Market Mall"을 초기화해주세요.
		문자열 tagline 변수에 "Welcome to Web Market!"을 초기화해주세요.
	-->
	<%!
		String greeting = "Book Market Mall!";
		String tagline = "Welcome to Web Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<!-- 표현문을 이용하여 greeting 변수를 출력해주세요. -->
				<%=greeting %>
			</h1>
		</div>
	</div>
	<main role="main">
	<div class="container">
		<div class="text-center">
			<h3>
				<!-- 표현문을 이용하여 tagline 변수를 출력해주세요. -->
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
				hour = hour -12;
				
			}
			String ct = hour + ":" + min + ":" + sec + " "+am_pm;
			out.println("현재 접속하신 시간은 " +ct+"입니다. \n");
			
			%>		
		</div>
		<hr>
	</div>
	</main>
	<!-- footer 부분 -->
	<footer class="container">
		<p>&copy; BookMarket</p>
	</footer>
	<!-- footer 부분 End -->
</body>
</html>