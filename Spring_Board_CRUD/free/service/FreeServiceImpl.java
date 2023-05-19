package kr.or.ddit.free.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.free.dao.IFreeDAO;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class FreeServiceImpl implements IFreeService {
	
	@Inject
	private IFreeDAO freeDao;
	
	public ServiceResult insertNotice(FreeVO freeVo) {
		ServiceResult res = null;
		
		int status = freeDao.insert(freeVo);
		if(status >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public int selectCount(PaginationInfoVO<FreeVO> pagingVo) {
		// TODO Auto-generated method stub
		return freeDao.selectCount(pagingVo);
	}

	@Override
	public List<FreeVO> selectList(PaginationInfoVO<FreeVO> pagingVo) {
		// TODO Auto-generated method stub
		return freeDao.selectList(pagingVo);
	}

	@Override
	public FreeVO select(int boNo) {
		// TODO Auto-generated method stub
		freeDao.incrementHit(boNo);
		return freeDao.select(boNo);
	}

	@Override
	public ServiceResult insert(FreeVO freeVo) {
		ServiceResult res = null;
		int status = freeDao.insert(freeVo);
		if(status >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public ServiceResult update(FreeVO freeVo) {
		ServiceResult res = null;
		int status = freeDao.update(freeVo);
		if(status >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public ServiceResult delete(int boNo) {
		ServiceResult res = null;
		int status = freeDao.delete(boNo);
		if(status >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

}
