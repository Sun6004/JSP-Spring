package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.BoardService;
import service.BoardServiceImpl;
import vo.MemberVO;


@WebServlet("/signIn.do")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Gson gson = new Gson();
		
		MemberVO vo = new MemberVO();
		String newId = request.getParameter("id");
		String newPw = request.getParameter("pw");
		String newName = request.getParameter("name");
		
		vo.setMem_id(newId);
		vo.setMem_pw(newPw);
		vo.setMem_name(newName);		
		BoardService service = BoardServiceImpl.getInstance();
		MemberVO idCk = (MemberVO) service.memberList(vo);
		if(idCk == null) {
			service.addMem(vo);			
		}
		response.sendRedirect(request.getContextPath()+"/board/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
