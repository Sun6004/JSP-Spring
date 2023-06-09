package kr.or.ddit.controller.noticeboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.DDITMemberVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface INoticeService {


	NoticeVO selectNotice(int boNo);

	ServiceResult updateNotice(HttpServletRequest req, NoticeVO noticeVo);

	ServiceResult deleteNotice(int boNo, HttpServletRequest req);

	int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVo);

	List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVo);

	ServiceResult idCheck(String memId);

	ServiceResult signup(HttpServletRequest req, DDITMemberVO memberVo);

	DDITMemberVO loginCheck(DDITMemberVO memberVo);

	String idForgetProcess(DDITMemberVO member);

	String pwForgetProcess(DDITMemberVO member);

	ServiceResult insertNotice(NoticeVO noticeVo, HttpServletRequest req);

	NoticeFileVO noticeDownload(int fileNo);

	DDITMemberVO selectMember(DDITMemberVO sessionMember);

	ServiceResult profileUpdate(HttpServletRequest req, DDITMemberVO memberVo);

}
