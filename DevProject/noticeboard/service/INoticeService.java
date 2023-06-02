package kr.or.ddit.controller.noticeboard.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.NoticeVO;

public interface INoticeService {

	ServiceResult insertNotice(NoticeVO noticeVo);

	NoticeVO selectNotice(int boNo);

	ServiceResult updateNotice(NoticeVO noticeVo);

}
