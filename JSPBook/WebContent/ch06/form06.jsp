<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
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
                                <div class="card-body">
                                	<form action="form06_process.jsp" name="member" method="post">
                                		아이디: <input type="text" name="id"> <input type="button" value="중복확인"> <br>
                                		비밀번호: <input type="text" name="pw"> <br>
                                		이름: <input type="text" name="name"> <br>
                                		연락처: <select name="phone1">                               		
                                			<option value="010">010 </option>
                                			<option value="011">011 </option>
                                			<option value="016">016 </option>
                                			<option value="017"> 017 </option>
                                		</select>
                                		<input type="text" name="phone2" maxlength="4" size="4"> -
                                		<input type="text" name="phone3" maxlength="4" size="4"> <br>-
                                		성별: <input type="radio" name="gender" value="male" checked="checked"> 남성
                                			  <input type="radio" name="gender" value="fmale" > 여성
                                		취미: <input type="checkbox" name="hobby"  value="독서" checked="checked"> 독서
                                			  <input type="checkbox" name="hobby" value="운동"> 운동
                                			  <input type="checkbox" name="hobby" value="영화"> 영화 <br>
                                			<!-- 
                                			wrap = off : 줄봐꿈 안함
                                			wrap = soft : 자동 줄봐꿈
                                			wrap = hard : 서버 전송시 엔터문자를 전달
                                			
                                			해당 속성은 html5에서 새롭게 추가된 기능
                                			wrap = hard 속성 사용시, cols속성이 꼭 명시되어 있어야 함.	
                                			 -->
                                		자기소개: <textarea rows="3" cols="30" wrap="soft" name="comment" placeholder="가입인사 입력"></textarea>
                                		<input type="submit" value="가입하기">
                                		<input type="reset" value="reset">
                                	</form>
                              
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