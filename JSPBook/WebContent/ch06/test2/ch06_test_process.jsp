<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                	<%
                                  	request.setCharacterEncoding("UTF-8");
                                    
                                	String id = request.getParameter("id");
                                    String pw = request.getParameter("pw");
                                    String name = request.getParameter("name");
                                    String phone1 = request.getParameter("phone1");
                                    String phone2 = request.getParameter("phone2");
                                    String phone3 = request.getParameter("phone3");
                                    String gender = request.getParameter("gender");
                                    String[] hobby = request.getParameterValues("hobby");
                                    String comment = request.getParameter("comment");
                                    
                                    Map<String, String> errors = new HashMap<String, String>();
                                    
                                    if(id.equals("")){
                                    	errors.put("id", "아이디가 누락되었습니다!");
                                    }
                                    if(pw.equals("")){
                                    	errors.put("pw", "비밀번호가 누락되었습니다!");
                                    }
                                    if(name.equals("")){
                                    	errors.put("name", "이름이 누락되었습니다!");
                                    }
                                    
                                    if(errors.size() > 0){	// 에러가 존재한다
                                    	request.setAttribute("errors", errors);
                                    	request.getRequestDispatcher("./ch06_test.jsp?err=1").forward(request, response);
                                    }
                                	%>
                                	
                                	<p>넘겨받은 파라미터 값을 el로 바로 출력할 수 있을까?</p>
                                	id : ${id } <br/>
                                	request : ${requestScope.id }<br/>
                                	
                                	<br/><hr/>
                                	
                                	<c:set value="<%=id %>" var="ids"/>
                                	ids : ${ids }<br/>
                                	param : ${param.id }<br/>
                                	<p>아이디 : <%=id %></p>
                                	<p>비밀번호 : <%=pw %></p>
                                	<p>이름 : <%=name %></p>
                                	<p>연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
                                	<p>성별 : <%=gender %></p>
                                	<p>취미 : (스크립틀릿으로 출력)</p>
                                	<%
                                		if(hobby != null){
                                			for(int i = 0; i < hobby.length; i++){
                                				out.println(" " + hobby[i]);
                                			}
                                		}
                                	%>
                                	<p>가입인사 : <%=comment %></p>
                                	<br/><hr/>
                                	
                                	<c:set var="id" value="<%=id %>"/>
                                	<c:set var="pw" value="<%=pw %>"/>
                                	<c:set var="name" value="<%=name %>"/>
                                	<c:set var="phone1" value="<%=phone1 %>"/>
	
									<p>아이디 : ${id }</p>
                                	<p>비밀번호 : ${pw }</p>
                                	<p>이름 : ${name }</p>
                                	<p>연락처 : ${phoen1 }</p>                                	
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