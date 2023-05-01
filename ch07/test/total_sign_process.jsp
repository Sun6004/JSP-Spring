<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Member"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
// 		1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.	
// 		2. 전달받은 아이디, 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
// 			-dao,vo를 활용하여 진행할 수 있도록 합니다.
// 		3. 전달받은 아이디 비밀번호에 해당하는 회원인 경우엔 total_memberList.jsp로 이동하여
// 			회원 목록 페이지를 완성해 주세요.
// 			- 회원 목록 페이지로 넘어가서 해당 목록 페이지에서 'a001'님 환영합니다! 메세지를 출력해 주세요.
			
// 		4. 전달받은 아이디 비밀번호에 해당하지 않는 회원인 경우엔 total_signin.jsp로 이동하여 다시 로그인을
// 			진행할 수 있도록 해주시고, 에러 메세지를 출력해 주세요!
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	ArrayList<MemberVO> memberList = dao.getMemberList();
	if(memberList.size() >0 ){
		boolean flag = false; //회원 목록 데이터가 존재하지 않을떄 (스위칭)
		
		for(MemberVO memVo : memberList){
			if(id.equals(memVo.getMem_id()) &&pw.equals(memVo.getMem_pw())){
				flag = true; //회원정보가 존재
				break; //회원목록이 존재할경우 for문이 계속돌지 않게함
			}
		}
		if(flag){
			response.sendRedirect("total_memberList.jsp");
		}else{
			request.getRequestDispatcher("total_sign.jsp?error=1").forward(request, response);
		}
	}else{
		request.getRequestDispatcher("total_sign.jsp?error=1").forward(request, response);
	}
	 

	%>
</body>
</html>