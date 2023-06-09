package kr.or.ddit.mapper;

import kr.or.ddit.vo.DDITMemberVO;

public interface ProfileMapper {

	public DDITMemberVO selectMember(DDITMemberVO sessionMember);

	public int profileUpdate(DDITMemberVO memberVo);

}
