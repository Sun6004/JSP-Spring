package kr.or.ddit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.Item3;

public interface ItemMapper3 {

	void register(Item3 item);

	void addAttach(String fileName);

	List<Item3> list();

	Item3 read(int itemId);

	List<String> getAttach(int itemId);

	void modify(Item3 item);

	void deleteAttach(int itemId);

	void modifyAttach(@Param("fullName") String fileName, @Param("itemId") int itemId);

	void delete(int itemId);

}
