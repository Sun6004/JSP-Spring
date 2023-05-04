package service;

import java.util.List;

import vo.BoardVO;
import vo.MemberVO;

public interface BoardService {
	public List<MemberVO> memberList(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo);
	
	public int addMem(MemberVO vo);
	
	public List<BoardVO> boardList();
	
	public int addBoard(BoardVO vo);
	
	public int delBoard(BoardVO vo);
	
	public BoardVO boardDetail(String writer);
	
	public int updateBoard(BoardVO vo);
}
