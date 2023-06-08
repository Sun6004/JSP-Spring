package kr.or.ddit.controller.noticeboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.DDITMemberVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface INoticeService {

	ServiceResult insertNotice(NoticeVO noticeVo);

	NoticeVO selectNotice(int boNo);

	ServiceResult updateNotice(NoticeVO noticeVo);

	ServiceResult deleteNotice(int boNo);

	int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVo);

	List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVo);

	ServiceResult idCheck(String memId);

	ServiceResult signup(HttpServletRequest req, DDITMemberVO memberVo);

	DDITMemberVO loginCheck(DDITMemberVO memberVo);

}
