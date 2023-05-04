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
import vo.BoardVO;
import vo.MemberVO;


@WebServlet("/delBoard.do")
public class DelBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("memVo");
		
		int no = Integer.parseInt(request.getParameter("no")); 
		BoardVO vo2 = new BoardVO();
		vo2.setBo_no(no);
		
		BoardService service = BoardServiceImpl.getInstance();
		service.delBoard(vo2);
		
		response.sendRedirect(request.getContextPath()+"/views/board/boardList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
