package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.BoardService;
import service.BoardServiceImpl;
import vo.BoardVO;
import vo.MemberVO;

@WebServlet("/addBoard.do")
public class AddBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Gson gson = new Gson();

		HttpSession session = request.getSession();
		MemberVO vo2 = (MemberVO) session.getAttribute("memVo");	

		BoardVO vo = new BoardVO();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = vo2.getMem_name();
		
		vo.setBo_title(title);
		vo.setBo_content(content);
		vo.setBo_writer(writer);
		BoardService service = BoardServiceImpl.getInstance();
		service.addBoard(vo);
		
		response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
