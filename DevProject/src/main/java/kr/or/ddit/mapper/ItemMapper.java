package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.Item;

public interface ItemMapper {

	public void create(Item item);

	List<Item> list();

	Item read(int itemId);

	String getPicture(int itemId);

	public void modify(Item item);

	public void remove(int itemId);

}
