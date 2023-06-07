package kr.or.ddit.controller.file.item03.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ItemMapper3;
import kr.or.ddit.vo.Item3;

@Service
public class ItemServiceImpl3 implements ItemService3 {
	
	@Inject
	private ItemMapper3 mapper;
	
	@Override
	public void register(Item3 item) {
		mapper.register(item);
		
		String[] files = item.getFiles();
		if(files == null) {
			return;
		}
		for (String fileName : files) {
			mapper.addAttach(fileName);
		}
	}

	@Override
	public List<Item3> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public Item3 read(int itemId) {
		// TODO Auto-generated method stub
		return mapper.read(itemId);
	}

	@Override
	public List<String> getAttach(int itemId) {
		// TODO Auto-generated method stub
		return mapper.getAttach(itemId);
	}

	@Override
	public void modify(Item3 item) {
		mapper.modify(item);
		
		int itemId = item.getItemId();
		mapper.deleteAttach(itemId);
		String[] files = item.getFiles();
		
		if(files == null) {
			return;
		}
		for (String fileName : files) {
			mapper.modifyAttach(fileName, itemId);
		}
		
	}

	@Override
	public void remove(Item3 item) {
		mapper.deleteAttach(item.getItemId());
		mapper.delete(item.getItemId());
		
	}

}
