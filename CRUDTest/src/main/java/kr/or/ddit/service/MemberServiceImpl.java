package kr.or.ddit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.dao.IMemberDAO;
import kr.or.ddit.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService{
	
	@Inject
	private IMemberDAO memberDao;
	
	@Override
	public MemberVO selectMember(MemberVO memberVo) {
		System.out.println("service: "+ memberVo.getMemId());
		System.out.println("service: "+ memberVo.getMemPw());
		return memberDao.selectMember(memberVo);
	}

}
