package kr.or.ddit.dao;

import java.util.List;

import kr.or.ddit.vo.BoardVO;

public interface IBoardDAO {
	
	public int insertBoard(BoardVO boardVo);

	public BoardVO selectBoard(int boNo);

	public void incrementHit(int boNo);

	public int updateBoard(BoardVO boardVo);

	public int deleteBoard(int boNo);

	public List<BoardVO> selectBoardList();

	public int selectBoardCount(BoardVO boardVo);

}
