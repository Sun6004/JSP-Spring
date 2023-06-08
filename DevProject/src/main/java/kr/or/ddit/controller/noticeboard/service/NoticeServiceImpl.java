package kr.or.ddit.controller.noticeboard.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.noticeboard.web.TelegramSendController;
import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.mapper.NoticeMapper;
import kr.or.ddit.vo.DDITMemberVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Inject
	private NoticeMapper noticeMapper;
	@Inject
	private LoginMapper loginMapper;
	
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

	@Override
	public ServiceResult deleteNotice(int boNo) {
		ServiceResult res = null;
		int stat =  noticeMapper.deleteNotice(boNo);
		if(stat > 0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVo) {
		return noticeMapper.selectNoticeCount(pagingVo);
	}

	@Override
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVo) {
		return noticeMapper.selectNoticeList(pagingVo);
	}

	@Override
	public ServiceResult idCheck(String memId) {
		// TODO Auto-generated method stub
		ServiceResult res = null;
		DDITMemberVO member = loginMapper.idCheck(memId);
		if(member != null) {
			res = ServiceResult.EXIST;
		}else {
			res = ServiceResult.NOTEXIST;
		}
		return res;
	}

	@Override
	public ServiceResult signup(HttpServletRequest req, DDITMemberVO memberVo) {
		ServiceResult res = null;
		
		// 프로필 이미지 업로드를 하기 위한 경로 설정
		String uploadPath = req.getServletContext().getRealPath("/resources/profile");
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String proFileImg = "";
		MultipartFile proFileImgFile = memberVo.getImgFile();
		if(proFileImgFile.getOriginalFilename() != null && !proFileImgFile.getOriginalFilename().equals("")) {
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + proFileImgFile.getOriginalFilename();
			uploadPath += "/" + fileName;
			try {
				proFileImgFile.transferTo(new File(uploadPath));				
			} catch (Exception e) {
				e.printStackTrace();
			}
			proFileImg = "/resources/profile/" + fileName;
		}
		memberVo.setMemProfileImg(proFileImg);
		int stat = loginMapper.signup(memberVo);
		if(stat >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;			
		}
		return res;
	}

	@Override
	public DDITMemberVO loginCheck(DDITMemberVO memberVo) {
		// TODO Auto-generated method stub
		return loginMapper.loginCheck(memberVo);
	}


}
