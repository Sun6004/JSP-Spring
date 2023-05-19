package kr.or.ddit.free.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Repository
public class FreeDAOImpl implements IFreeDAO{

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(FreeVO freeVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Free.insert", freeVo);
	}

	@Override
	public int selectCount(PaginationInfoVO<FreeVO> pagingVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Free.selectCount", pagingVo);
	}

	@Override
	public List<FreeVO> selectList(PaginationInfoVO<FreeVO> pagingVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Free.selectList", pagingVo);
	}

	@Override
	public void incrementHit(int boNo) {
		sqlSession.update("Free.incrementHit", boNo);
	}

	@Override
	public FreeVO select(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Free.select", boNo);
	}

	@Override
	public int update(FreeVO freeVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("Free.update", freeVo);
	}

	@Override
	public int delete(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Free.delete", boNo);
	}
	
}
