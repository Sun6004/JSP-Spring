package kr.or.ddit.controller.noticeboard.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.noticeboard.web.TelegramSendController;
import kr.or.ddit.mapper.NoticeMapper;
import kr.or.ddit.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Inject
	private NoticeMapper noticeMapper;
	
	TelegramSendController tst = new TelegramSendController();
	
	@Override
	public ServiceResult insertNotice(NoticeVO noticeVo) {
		// TODO Auto-generated method stub
		ServiceResult res = null;
		int status = noticeMapper.insertNotice(noticeVo);
		if(status >0) {
			// 성공 했다는 메시지를 텔레그램 BOT API를 이용하여 알림!
			try {
				tst.sendGet("빔프로젝트 리모컨 도둑", noticeVo.getBoTitle());
			} catch (Exception e) {
				e.printStackTrace();
			}
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public NoticeVO selectNotice(int boNo) {
		// TODO Auto-generated method stub
		noticeMapper.incrementHit(boNo);
		return noticeMapper.selectNotice(boNo);
	}

	@Override
	public ServiceResult updateNotice(NoticeVO noticeVo) {
		ServiceResult res = null;
		int stat =  noticeMapper.updateNotice(noticeVo);
		if(stat > 0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

}
