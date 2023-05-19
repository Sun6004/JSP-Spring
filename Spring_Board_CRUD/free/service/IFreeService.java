package kr.or.ddit.free.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IFreeService {

	int selectCount(PaginationInfoVO<FreeVO> pagingVo);

	List<FreeVO> selectList(PaginationInfoVO<FreeVO> pagingVo);

	FreeVO select(int boNo);
	
	public ServiceResult insert(FreeVO freeVo);

	public ServiceResult update(FreeVO freeVo);

	public ServiceResult delete(int boNo);

}
