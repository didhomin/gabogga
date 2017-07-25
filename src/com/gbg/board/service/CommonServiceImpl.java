package com.gbg.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gbg.board.dao.CommonDao;
import com.gbg.util.BoardConstance;
import com.gbg.util.PageNavigation;

@Service
public class CommonServiceImpl implements CommonService {

	private CommonDao commonDao;
	
	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public PageNavigation makePageNavigation(int bcode, int pg, String key, String word) {
//		PageNavigation pageNavigation = new PageNavigation();
//		
////		pageNavigation.setRoot(root); //���⼭ ����  reboardlistaction���� �ؾߵ�
//		int newArticleCount = CommonDaoImpl.getCommonDao().newArticleCount(bcode);
//		pageNavigation.setNewArticleCount(newArticleCount);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("bcode", bcode + "");
//		map.put("key", key);
//		map.put("word", word);
//		int totalArticleCount = CommonDaoImpl.getCommonDao().totalArticleCount(map);
//		pageNavigation.setTotalArticleCount(totalArticleCount);
////		int totalPageCount = totalArticleCount%BoardConstance.LIST_SIZE == 0 ? totalArticleCount/BoardConstance.LIST_SIZE : totalArticleCount/BoardConstance.LIST_SIZE+1;//����ؼ� ����  db���� �����°� �ƴ�
//		int totalPageCount = (totalArticleCount - 1) / BoardConstance.LIST_SIZE + 1;
//		pageNavigation.setTotalPageCount(totalPageCount);
//		pageNavigation.setNowFirst(pg <= BoardConstance.PAGE_SIZE);
//		pageNavigation.setNowEnd((totalPageCount - 1) / BoardConstance.PAGE_SIZE * BoardConstance.PAGE_SIZE < pg);
//		pageNavigation.setPageNo(pg);
////		pageNavigation.setNavigator(); //���� ���� ������ (��Ʈ ���� �Ѵ�����) �ؾߵ�
		return null;
	}

}
