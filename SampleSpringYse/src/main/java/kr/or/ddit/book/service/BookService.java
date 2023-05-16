package kr.or.ddit.book.service;

import java.util.Map;

public interface BookService {
	public String insertBook(Map<String, Object> map);

	public Map<String, Object> selectBook(Map<String, Object> map);
}
