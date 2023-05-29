package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BoardVO;

public interface IBoardService {
	public ServiceResult insertBoard(BoardVO boardVo);

	public ServiceResult updateBoard(BoardVO boardVo);

	public ServiceResult deleteBoard(int boNo);

	public List<BoardVO> selectBoardList();

	BoardVO selectBoard(int boNo);

	public int selectBoardCount(BoardVO boardVo);

}
