package kr.or.ddit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BoardVO;

@Repository
public class BoardDAOImpl implements IBoardDAO {
	
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(BoardVO boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Board.insertBoard", boardVo);
	}

	@Override
	public BoardVO selectBoard(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Board.selectBoard", boNo);
	}

	@Override
	public void incrementHit(int boNo) {
		// TODO Auto-generated method stub
		sqlSession.update("Board.incrementHit", boNo);
	}

	@Override
	public int updateBoard(BoardVO boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("Board.updateBoard", boardVo);
	}

	@Override
	public int deleteBoard(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Board.deleteBoard", boNo);
	}

	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Board.selectBoardList");
	}

	@Override
	public int selectBoardCount(BoardVO boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Board.selectBoardCount", boardVo);
	}

}
