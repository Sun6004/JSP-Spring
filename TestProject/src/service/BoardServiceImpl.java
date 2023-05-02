package service;

import java.util.List;

import dao.BoardDao;
import dao.BoardDaoImpl;
import vo.BoardVO;
import vo.MemberVO;

public class BoardServiceImpl implements BoardService{
	
	private BoardDao dao;
	private static BoardService service;
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	public static BoardService getInstance() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}

	@Override
	public List<MemberVO> memberList(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberList();
	}

	@Override
	public int addMem(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.addMem(vo);
	}

	@Override
	public List<BoardVO> boardList() {
		// TODO Auto-generated method stub
		return dao.boardList();
	}

	@Override
	public int addBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.delBoard(vo);
	}
	@Override
	public MemberVO getMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.getMember(vo);
	}

}
