package kr.or.ddit.free.dao;

import java.util.List;

import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IFreeDAO {

	public int insert(FreeVO freeVo);
     
	public int selectCount(PaginationInfoVO<FreeVO> pagingVo);
     
	public List<FreeVO> selectList(PaginationInfoVO<FreeVO> pagingVo);
     
	public void incrementHit(int boNo);
     
	public FreeVO select(int boNo);
	 
	public int update(FreeVO freeVo);
	 
	public int delete(int boNo);

}
