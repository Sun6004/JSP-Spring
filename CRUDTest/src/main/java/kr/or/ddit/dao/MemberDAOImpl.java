package kr.or.ddit.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MemberVO;

@Repository
public class MemberDAOImpl implements IMemberDAO {
    
    @Inject
    private SqlSessionTemplate sqlSession;
    
    @Override
    public MemberVO selectMember(MemberVO memberVo) {
//        Map<String, String> param = new HashMap<>();
//        param.put("memId", memId);
//        param.put("memPw", memPw);
        return sqlSession.selectOne("member.selectMember", memberVo);
    }
}
