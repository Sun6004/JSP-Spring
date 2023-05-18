package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IBoardDAO {
	
	public int insertBoard(BoardVO boardVo);

	public BoardVO selectBoard(int boNo);

	public void incrementHit(int boNo);

	public int updateBoard(BoardVO boardVo);

	public int deleteBoard(int boNo);

	public List<BoardVO> selectBoardList();

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVo);

	public List<BoardVO> selectBoardList2(PaginationInfoVO<BoardVO> pagingVo);

}
