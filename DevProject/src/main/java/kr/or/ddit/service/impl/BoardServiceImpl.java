package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.BoardMapper;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.Board;

@Service
public class BoardServiceImpl implements IBoardService {

	@Inject
	private BoardMapper mapper;
	
	@Override
	public void register(Board board) {
		mapper.create(board);

	}

	@Override
	public List<Board> list() {
		return mapper.list();
	}

	@Override
	public Board read(int boardNo) {
		return mapper.read(boardNo);
	}

	@Override
	public void update(Board board) {
		mapper.update(board);
	}

	@Override
	public void delete(int boardNo) {
		mapper.delete(boardNo);
		
	}

	@Override
	public List<Board> search(Board board) {
		// TODO Auto-generated method stub
		return mapper.search(board);
	}

}
