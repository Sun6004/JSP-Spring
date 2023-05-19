package kr.or.ddit.notice.dao;

import java.util.List;

import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface INoticeDAO {

	public int insertNotice(NoticeVO noticeVo);
     
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVo);
     
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVo);
     
	public void incrementHit(int boNo);
     
	public NoticeVO selectNotice(int boNo);
	 
	public int updateNotice(NoticeVO noticeVo);
	 
	public int deleteNotice(int boNo);

}
