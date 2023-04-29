<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	input 태그의 기능과 사용법(form)
                                    </h6>
                                </div>
                                <%
									String errInfo = request.getParameter("err");
                                	if(errInfo != null){
                                		Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
                                		%>
                                			<c:set value="<%=errInfo %>" var="errors"/>
                                			<c:set value="<%=errors %>" var="errMap"/>
                                		<%
                                		String p_id = request.getParameter("id");
                                        String p_pw = request.getParameter("pw");
                                        String p_name = request.getParameter("name");
                                        String p_phone1 = request.getParameter("phone1");
                                        String p_phone2 = request.getParameter("phone2");
                                        String p_phone3 = request.getParameter("phone3");
                                        String p_gender = request.getParameter("gender");
                                        String[] p_hobby = request.getParameterValues("hobby");
                                        String p_comment = request.getParameter("comment");
                                        
                                        %>
                                        	<c:set value="<%=p_id %>" var="id"/>
                                        	<c:set value="<%=p_pw %>" var="pw"/>
                                        	<c:set value="<%=p_name %>" var="name"/>
                                        	<c:set value="<%=p_phone1 %>" var="phone1"/>
                                        	<c:set value="<%=p_phone2 %>" var="phone2"/>
                                        	<c:set value="<%=p_phone3 %>" var="phone3"/>
                                        	<c:set value="<%=p_gender %>" var="gender"/>
                                        	<c:set value="<%=p_hobby %>" var="hob"/>
                                        	<c:set value="<%=p_comment %>" var="comment"/>
                                        <%
                                	}
                                %>
                                <div class="card-body">
                                	<form action="ch06_test_process.jsp" name="member" method="post">
                                		아이디 : <input type="text" name="id" value="${id }"/><input type="button" value="중복확인"/><br/>
                                		<font style="font-size:10px" color="red">${errMap.id }</font>
                                		비밀번호 : <input type="text" name="pw" value="${pw }"/><br/>
                                		<font style="font-size:10px" color="red">${errMap.pw }</font>
                                		이름 : <input type="text" name="name" value="${name }"/><br/>
                                		<font style="font-size:10px" color="red">${errMap.name }</font>
                                		연락처 : <select name="phone1">
                                					<option value="010">010</option>
                                					<option value="011">011</option>
                                					<option value="016">016</option>
                                					<option value="017">017</option>
                                					<option value="019">019</option>
                                				</select> - 
                                			<input type="text" name="phone2" maxlength="4" size="4"/> - 
                                			<input type="text" name="phone3" maxlength="4" size="4"/><br/>
                                		성별 : <input type="radio" name="gender" value="남성" checked="checked"/> 남성 
                                			<input type="radio" name="gender" value="여성"/> 여성<br/>
                                		취미 : <input type="checkbox" name="hobby" value="독서" checked="checked"/> 독서
                                			<input type="checkbox" name="hobby" value="운동"/> 운동 
                                			<input type="checkbox" name="hobby" value="영화"/> 영화<br/>
                                		<!-- 
                                			textarea wrap 속성
                                			wrap = "off" : 줄바꿈 안함
                                			wrap = "soft" : 자동 줄바꿈
                                			wrap = "hard" : 서버 전송 시 캐리지 리턴(엔터문자) 문자를 전달
                                			
                                			해당 속성은 html5에서 새롭게 추가된 기능,
                                			wrap = "hard" 속성을 사용 시, cols 속성이 꼭 명시되어 있어야한다.
                                		 -->
                                		자기소개 : <textarea rows="3" cols="30" wrap="soft" name="comment" placeholder="가입인사를 입력해주세요."></textarea>
                                		<input type="submit" value="가입하기"/>
                                		<input type="reset" value="다시쓰기"/><br/> 
                                	</form>
                                	<c:if test="${errors eq '1' }">
	                                	<h3>아이디, 비밀번호, 이름 중 1개 이상의 값이 누락되었습니다!</h3>
                                	</c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>