package kr.or.ddit.controller.file.item02.service;

import java.util.List;

import kr.or.ddit.vo.Item2;

public interface ItemService2 {

	public List<Item2> list();
     
	public void register(Item2 item);
     
	public Item2 read(int itemId);
     
	public String getPicture2(int itemId);
     
	public void modify(Item2 item);
     
	public String getPicture(int itemId);

	public void remove(int itemId);

}
