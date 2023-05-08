package dao;

import java.util.ArrayList;

import vo.MemberVO;

public class MemberDAO{
	
	private ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public ArrayList<MemberVO> getMemberList() {
		return memberList;
	}

	public void insertMember(MemberVO member) {
		memberList.add(member);
	}

}
