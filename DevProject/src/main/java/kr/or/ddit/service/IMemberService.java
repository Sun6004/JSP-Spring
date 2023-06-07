package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {

	void register(MemberVO member);

	List<MemberVO> list();

	MemberVO read(int userNo);

	void modify(MemberVO member);

	void remove(int userNo);
	
}
