package kr.or.ddit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.dao.BoardDAOImpl;
import kr.or.ddit.dao.IBoardDAO;
import kr.or.ddit.vo.BoardVO;

@Service
public class BoardServiceImpl implements IBoardService {
	
	@Inject
	private IBoardDAO BoardDao;
	
	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return BoardDao.selectBoardList();
	}

	@Override
	public BoardVO selectBoard(int boNo) {
		// TODO Auto-generated method stub
		return BoardDao.selectBoard(boNo);
	}

	@Override
	public int selectBoardCount(BoardVO boardVo) {
		// TODO Auto-generated method stub
		return BoardDao.selectBoardCount(boardVo);
	}

	@Override
	public ServiceResult insertBoard(BoardVO boardVo) {
		// TODO Auto-generated method stub
		ServiceResult res = null;
		
		int stat = BoardDao.insertBoard(boardVo);
		if(stat >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public ServiceResult updateBoard(BoardVO boardVo) {
		ServiceResult res = null;
		
		int stat = BoardDao.updateBoard(boardVo);
		if(stat >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public ServiceResult deleteBoard(int boNo) {
		ServiceResult res = null;
		
		int stat = BoardDao.deleteBoard(boNo);
		if(stat >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

}
