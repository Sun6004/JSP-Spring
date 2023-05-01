package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.BoardServiceImpl;
import vo.MemberVO;


@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("id");
		String memPw = request.getParameter("pw");
		
		MemberVO vo = new MemberVO();
	
		vo.setMem_id(memId);
		vo.setMem_pw(memPw);
	
		BoardService service = BoardServiceImpl.getInstance();
		MemberVO res = service.getMember(memId, memPw);
		
		if (res != null) {
		    // 로그인 성공
		    HttpSession session = request.getSession();
		    session.setAttribute("memberVo", res);
		    session.setMaxInactiveInterval(10 * 60);
		} else {
		    // 로그인 실패
		    // TODO: 실패 처리 코드 작성
		}
			
	   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
