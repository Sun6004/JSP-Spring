package kr.or.ddit.controller.noticeboard.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.noticeboard.web.TelegramSendController;
import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.mapper.NoticeMapper;
import kr.or.ddit.mapper.ProfileMapper;
import kr.or.ddit.vo.DDITMemberVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Inject
	private NoticeMapper noticeMapper;
	@Inject
	private LoginMapper loginMapper;
	@Inject
	private ProfileMapper profileMapper;
	@Inject
	private PasswordEncoder pe;
	
	TelegramSendController tst = new TelegramSendController();
	
	@Override
	public ServiceResult insertNotice(NoticeVO noticeVo, HttpServletRequest req) {
		// TODO Auto-generated method stub
		ServiceResult res = null;
		int status = noticeMapper.insertNotice(noticeVo);
		System.out.println("boTitle: " + noticeVo.getBoTitle());
		if(status >0) {
			List<NoticeFileVO> noticeFileList = noticeVo.getNoticeFileList();
			try {
				noticeFileUpload(noticeFileList, noticeVo.getBoNo(), req);
			} catch (IllegalStateException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	public ServiceResult updateNotice(HttpServletRequest req, NoticeVO noticeVo) {
		ServiceResult res = null;
		int stat =  noticeMapper.updateNotice(noticeVo);
		if(stat > 0) {
			List<NoticeFileVO> noticeFileList = noticeVo.getNoticeFileList();
			try {
				// 수정을 위해서 새로 추가된 파일 데이터를 먼저 업로드 처리한다
				noticeFileUpload(noticeFileList, noticeVo.getBoNo(), req);
				// 기존 추가되었던 파일들 중, 삭제를 원하는 파일번호를 가져온다.
				Integer[] delNoticeNo = noticeVo.getDelNoticeNo();
				if(delNoticeNo != null) {
					// 삭제를 원하는 파일 번호들 하나 하나씩을 데이터베이스로 던져서 파일 정보를 얻어 온 다음에
					// 데이터베이스에서 데이터를 삭제하고 서버업로드 경로에 업로드 되어있는 파일 데이터를 삭제한다.
					for (int i = 0; i < delNoticeNo.length; i++) {
						NoticeFileVO noticeFileVo = noticeMapper.selectNoticeFile(delNoticeNo[i]);
						noticeMapper.deleteNoticeFile(delNoticeNo[i]);
						File file = new File(noticeFileVo.getFileSavepath());
						file.delete();
					}
				}
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}

	@Override
	public ServiceResult deleteNotice(int boNo, HttpServletRequest req) {
		ServiceResult res = null;
		
		// 아래에서 boNo에 해당하는 파일 데이터를 삭제할 때 사용할 객체(noticeVo)
		NoticeVO noticeVo = noticeMapper.selectNotice(boNo);
		// 본체인 notice를 삭제하기 전에 File 데이터를 먼저 삭제하기 위한 요청
		noticeMapper.deleteNoticeFileByBoNo(boNo);
		
		int stat =  noticeMapper.deleteNotice(boNo);
		if(stat > 0) {
			// 파일데이터를 완벽하게 삭제처리하면 끝
			List<NoticeFileVO> noticeFileList = noticeVo.getNoticeFileList();
			if(noticeFileList != null && noticeFileList.size() >  0) {
				// '/'를 기준으로 경로가 짤리고 뒤의 파일명을 얻음
				String[] filePath = noticeFileList.get(0).getFileSavepath().split("/");
				
				// \resources\notice\{bo_no}/... 형태를 알고 있기 떄문에 filePath[0]으로 설정 가능
				String path = filePath[0];
				deleteFolder(req, path);
			}
			
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
		// 비밀번호를 암호화해서 저장
		memberVo.setMemPw(pe.encode(memberVo.getMemPw()));
		int stat = loginMapper.signup(memberVo);
		if(stat >0) {
			loginMapper.signupAuth(memberVo.getMemNo());
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

	@Override
	public String idForgetProcess(DDITMemberVO member) {
		// TODO Auto-generated method stub
		return loginMapper.idForgetProcess(member);
	}

	@Override
	public String pwForgetProcess(DDITMemberVO member) {
		// TODO Auto-generated method stub
		return loginMapper.pwForgetProcess(member);
	}
	
	private void noticeFileUpload(List<NoticeFileVO> noticeFileList, int boNo, HttpServletRequest req) throws IllegalStateException, IOException {
		String savePath ="/resources/notice/";
		if(noticeFileList != null && noticeFileList.size() >0) {
			for (NoticeFileVO noticeFileVo : noticeFileList) {
				String saveName = UUID.randomUUID().toString();
				
				saveName = saveName + "_" + noticeFileVo.getFileName().replaceAll(" ", "_");
				String endFileName = noticeFileVo.getFileName().split("\\.")[1]; //확장자(디버깅 및 확장자 추출 참고)
				
				// /resources/notice/1
				String saveLocate = req.getServletContext().getRealPath(savePath + boNo);
				File file = new File(saveLocate);
				if(!file.exists()) {
					file.mkdirs();
				}
				
				saveLocate += "/" + saveName;
				File saveFile = new File(saveLocate);
				
				noticeFileVo.setBoNo(boNo);
				noticeFileVo.setFileSavepath(saveLocate);
				noticeMapper.insertNoticeFile(noticeFileVo);
				
				noticeFileVo.getItem().transferTo(saveFile);
			}
		}
	}
	
	public static void deleteFolder(HttpServletRequest req, String path) {
		File folder = new File(path);
		if(folder.exists()) {
			File[] fileList = folder.listFiles();
			
			for (int i = 0; i < fileList.length; i++) {
				if(fileList[i].isFile()) { //폴더안의 파일이 파일일때
					// 폴더안의 파일을 차례대로 삭제
					fileList[i].delete();
				}else {			// 폴더안에 있는 파일이 폴더 일때 재귀함수 호출(폴더안으로 들어갈려고)
					deleteFolder(req, fileList[i].getPath());
				}
			}
			folder.delete(); // 폴더 삭제(boNo에 해당하는 폴더를 삭제)
		}
	}

	@Override
	public NoticeFileVO noticeDownload(int fileNo) {
		NoticeFileVO noticeFileVo = noticeMapper.noticeDownload(fileNo);
		if(noticeFileVo == null) {
			throw new RuntimeException();
		}
		noticeMapper.incrementNoticeDowncount(fileNo);//다운로드 회수 증가
		return noticeFileVo;
	}

	@Override
	public DDITMemberVO selectMember(String memId) {
		// TODO Auto-generated method stub
		return profileMapper.selectMember(memId);
	}

	@Override
	public ServiceResult profileUpdate(HttpServletRequest req, DDITMemberVO memberVo) {
		ServiceResult res = null;
		
		// 사용자가 수정한 프로필 이미지 정보에 따라서 프로필 이미지 정보 값을 설정 후 memberVo에 세팅해서 전달한다.
		String uploadPath = req.getServletContext().getRealPath("/resources/profile");
		
		// 파일을 저장할 디렉토리 생성
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String proFileImg = "";
		MultipartFile proFileImgFile = memberVo.getImgFile();
		
		// 사용자가 업로드한 파일이 존재하는 경우에만 실행
		if(proFileImgFile.getOriginalFilename() != null && !proFileImgFile.getOriginalFilename().equals("")) {
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + proFileImgFile.getOriginalFilename();
			uploadPath += "/" +fileName; // 파일의 최종 업로드경로를 설정
			try {
				proFileImgFile.transferTo(new File(uploadPath));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			proFileImg = "/resources/profile/" + fileName;
		}
		
		//선택한 프로필 이미지가 존재하지 않으면 "" 공백이 넘어가고
		// 프로필 이미지가 존재하면 업로드 경로와 파일명으로 구성된 경로가 넘어간다.
		memberVo.setMemProfileImg(proFileImg);
		
		int stat =  profileMapper.profileUpdate(memberVo);
		if(stat >0) {
			res = ServiceResult.OK;
		}else {
			res = ServiceResult.FAILED;
		}
		return res;
	}


}
