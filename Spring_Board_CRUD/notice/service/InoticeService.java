package kr.or.ddit.notice.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface InoticeService {

	int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVo);

	List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVo);

	NoticeVO selectNotice(int boNo);
	
	public ServiceResult insertNotice(NoticeVO noticeVo);

	public ServiceResult updateNotice(NoticeVO noticeVo);

	public ServiceResult deleteNotice(int boNo);

}
