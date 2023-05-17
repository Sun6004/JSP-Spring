package kr.or.ddit.book.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;
import org.springframework.stereotype.Service;

import kr.or.ddit.book.dao.BookDAO;

/*
 *  일반적으로 서비스 레어이는 인터페이스와 클래스를 함께 사용한다.
 *  스프링은 직접 클래스를 생성하는 것을 지양하고 인터페이스를 통해 접근하는 것을 권장하는 프레임워크이다.
 */
@Service
public class BookServiceImpl implements BookService {
	
	/*
	 * Service 클래스는 비즈니스 클래스가 위치하는 곳이다,
	 * 스프링MVC 구조에서 서비스 클래스는 컨트롤러와 DAO를 연결하는 역할을 한다.
	 * @Service는 스프링에 서비스 클래스임을 알려준다
	 * 
	 * 데이터베이스 접근을 위해 BookDao 인스턴스를 주입받는다.
	 * 클래스의 이름이 Impl로 끝나는것은 implemts의 약자로 관습에 따름
	 * Impl이 붙고 안붙고에 따라 클래스인지 인터페이스인지 구별하기 쉽다.
	 */
	@Inject
	private BookDAO bookDao;
	
	/**
	 * <p>책 등록 </p>
	 * @since SampleSpringYse 1.0
	 * @author ddit_june
	 * @param map을 등록할 책 데이터
	 * @return 성공 책ID, 실패시 null
	 */
	@Override
	public String insertBook(Map<String, Object> map) {
		// affectRowCount 변수에는 영향받은 행 수가 담긴다.
		// insertBook 구문은 입력이 성공하면 1, 실패하면 0을 리턴한다.
		int affectRowCount = bookDao.insertBook(map);
		if(affectRowCount == 1) {
			// 결과가 성공일 시, map인스턴스에 book 테이블의 pk인 book_id가 담겨져온다.
			return map.get("book_id").toString();
		}
		return null;
	}
	
	/**
	 * 
	 * 책 상세보기
	 * @since SampleSpringYse 1.0
	 * @author ddit_june
	 * @param map 책ID
	 * @return id에 해당하는 책정보
	 */
	@Override
	public Map<String, Object> selectBook(Map<String, Object> map) {
		// 서비스 내 detail 함수는 dao를 호출한 결과를 바로 리턴하는 일만 한다.
		return bookDao.selectBook(map);
	}
	
	/**
	 * 책 수정
	 * @since SampleSpringYse 1.0
	 * @author ddit_june
	 * @param map 책 id
	 * @return 성공1, 실패0
	 */
	@Override
	public boolean updateBook(Map<String, Object>map) {
		int affectRowCount = bookDao.updateBook(map);
		return affectRowCount == 1;
	}
	
	/**
	 * 책 삭제
	 * @since SampleSpringYse 1.0
	 * @author ddit_june 
	 * @param map 책 id
	 * @return 성공1, 실패0
	 */
	@Override
	public boolean removeBook(Map<String, Object>map) {
		int affectRowCount = bookDao.removeBook(map);
		return affectRowCount == 1;
	}
	
	/**
	 * 책 목록
	 * @since SampleSpringYse 1.0
	 * @author ddit_june 
	 * @param map 책 키워드
	 * @return 성공 리스트(책들), 실패null
	 */
	@Override
	public List<Map<String, Object>> selectBookList(Map<String,Object> map) {
		// TODO Ao-generated method stub
		return bookDao.selectBookList(map);
	}
	
}
