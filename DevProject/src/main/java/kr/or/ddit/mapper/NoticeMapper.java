package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface NoticeMapper {

	int insertNotice(NoticeVO noticeVo);

	void incrementHit(int boNo);

	NoticeVO selectNotice(int boNo);

	int updateNotice(NoticeVO noticeVo);
	
	int deleteNotice(int boNo);

	int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVo);

	List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVo);
	
	
}
