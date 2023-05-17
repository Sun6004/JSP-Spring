package kr.or.ddit.book.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAO {
	
	/*
	 * Mapper xml을 실행시키기 위해서 SqlSessionTemplate 객체를 멤버 변수로 선언한다.
	 * @Inject 어노테이션을 붙여서 SqlSessionTemplate 객체를 사용할 수 있게 한다.
	 */
	@Inject
	SqlSessionTemplate sqlSessionTemplate;
	
	/*
	 * sqlSessionTemplate.insert()
	 *  1)  첫번째 파라미터는 SQL Mapper의 id이다.
	 * 		book_SQL.xml에서 namespace로 설정한 Book 과 insert쿼리를 실행하기 위해 만든 insert문의 id의 값 insert이다
	 * 		mybatis는 네임스페이스 +id 조합으로 쿼리를 찾아 실행한다.
	 *  2)  두번째 파라미터는 쿼리에 전달할 데이터다.
	 *  	mapper내 insert 쿼리를 실행하기 위해 전달되어지는 parameterType의map이다
	 *  
	 *  외부에서 dao까지 map에 title, category, price가 담겨져서 넘어옴
	 *  그리고, useGeneratedkey의 keyProperty 의 설정으로 book테이블의 pk인 book_id항목을 생성할 수 있다.(mapper xml 참고)
	 */
	public int insertBook(Map<String, Object>map) {  
		return sqlSessionTemplate.insert("Book.insert", map);
	}

	
	public Map<String, Object> selectBook(Map<String, Object> map) {
		// sqlSessionTemplate의 selectOne 메서드는 데이터를 한개만 가져올 때 사용한다.
		// 만약 쿼리 결과 행 수가 0개면 selectOne 메서드는 null을 반환하게 되고,
		// 쿼리 결과가 여러 개면 ToomanyResultException 예외를 던진다.
		// 우리가 작성한 쿼리는 조건이 pk이고, pk는 무조건 행이 유일함을 보장하기 때문에 결과는 0개 아니면 1개이다.
		return sqlSessionTemplate.selectOne("Book.selectBook", map);
	}


	public int updateBook(Map<String, Object> map) {
		/*
		 * sqlSessionTemplate객체의 UpdateBook 메서드는 insert메서드와 사용방법이 동일하다.
		 * 첫번째 파라미터는 쿼리ID, 두번째 파라미터는 쿼리 파라미터이고 반환값은 영향받은 행 수이다.
		 */
		return sqlSessionTemplate.update("Book.updateBook", map);
	}


	public int removeBook(Map<String, Object> map) {
		// sqlSessionTemplate객체의 deleteBook 메서드는 update메서드와 사용방법이 동일하다.
		// 첫번째 파라미터는 쿼리ID, 두번째 파라미터는 쿼리 파라미터이고 반환값은 영향받은 행 수이다.
		return sqlSessionTemplate.delete("Book.removeBook", map);
	}

	
	public List<Map<String, Object>> selectBookList(Map<String,Object> map) {
		// 쿼리 결과를 목록으로 받기 위해서는 sqlSessionTemplate.selectList를 사용할 수 있다.
		// 첫번째 파라미터는 쿼리 id, 두 번째 파라미터는 쿼리 파라미터 이다.
		// 리턴타입을 list타입으로 설정한 건, selectList 메서드의 결과가 집합 목록을 반환하기 때문이다.
		return sqlSessionTemplate.selectList("Book.selectBookList", map);
	}
	
}
