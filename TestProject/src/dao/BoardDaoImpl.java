package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.BoardVO;
import vo.MemberVO;

public class BoardDaoImpl implements BoardDao{
	
	private static BoardDao dao;
	private BoardDaoImpl() {
		
	}
	public static BoardDao getDao() {
		if(dao == null) dao = new BoardDaoImpl();
		return dao;
	}

	@Override
	public List<MemberVO> memberList() {
		SqlSession session = null;
		List<MemberVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("board.memberList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public int addMem(MemberVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("board.addMem", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}

	@Override
	public List<BoardVO> boardList() {
		SqlSession session = null;
		List<BoardVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("board.boardList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public int addBoard(BoardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("board.addBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}

	@Override
	public int delBoard(BoardVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("board.delBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}
	@Override
	public MemberVO getMember(MemberVO vo) {
		SqlSession session = null;
		MemberVO res = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("board.getMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}
	
}
