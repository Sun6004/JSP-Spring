package kr.or.ddit.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.notice.dao.INoticeDAO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class NoticeServiceImpl implements InoticeService {
	
	@Inject
	private INoticeDAO noticeDao;
	
	public ServiceResult insertNotice(NoticeVO noticeVo) {
		ServiceResult res = null;
		
		int status = noticeDao.insertNotice(noticeVo);
		if(status >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVo) {
		// TODO Auto-generated method stub
		return noticeDao.selectNoticeCount(pagingVo);
	}

	@Override
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVo) {
		// TODO Auto-generated method stub
		return noticeDao.selectNoticeList(pagingVo);
	}

	@Override
	public NoticeVO selectNotice(int boNo) {
		// TODO Auto-generated method stub
		noticeDao.incrementHit(boNo);
		return noticeDao.selectNotice(boNo);
	}

	@Override
	public ServiceResult updateNotice(NoticeVO noticeVo) {
		ServiceResult res = null;
		int status = noticeDao.updateNotice(noticeVo);
		if(status >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public ServiceResult deleteNotice(int boNo) {
		ServiceResult res = null;
		int status = noticeDao.deleteNotice(boNo);
		if(status >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

}
