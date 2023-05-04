package dao;

import java.util.List;

import vo.BoardVO;
import vo.MemberVO;

public interface BoardDao {
	public List<MemberVO> memberList();
	
	public MemberVO getMember(MemberVO vo);
	
	public BoardVO boardDetail(String writer);
	
	public int addMem(MemberVO vo);
	
	public List<BoardVO> boardList();
	
	public int addBoard(BoardVO vo);
	
	public int delBoard(BoardVO vo);
	
	public int updateBoard(BoardVO vo);
}
