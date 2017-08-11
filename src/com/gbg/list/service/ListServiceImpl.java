package com.gbg.list.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.list.dao.ListDao;
import com.gbg.list.model.ListDto;
import com.gbg.util.PageNavigations;

@Service
public class ListServiceImpl implements ListService{
	
	@Autowired
	private SqlSession sqlSession;
	

	
	@Override
	public List<ListDto> roomPicture(String address1) {
		return sqlSession.getMapper(ListDao.class).roomPicture(address1);
	}

	@Override
	public String goodpm(Map<String, String> map) {
		return sqlSession.getMapper(ListDao.class).goodpm(map);
	}

	@Override
	public String goodnumber(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(ListDao.class).goodnumber(map);
	}

	@Override
	public int change(Map<String, String> map) {
		return sqlSession.getMapper(ListDao.class).change(map);
	}

	@Override
	public int insertgood(Map<String, String> map) {
		return sqlSession.getMapper(ListDao.class).insertgood(map);
	}

	@Override
	public int getNextSeq() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageNavigations makePage(Map<String, String> map) {
		PageNavigations pageNavigations = new PageNavigations();
		
		String address1 = map.get("address1");
		String pg = map.get("pg");

		int totalArticleCount = sqlSession.getMapper(ListDao.class).totalArticleCount(address1);
		pageNavigations.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / 10 + 1;
		
		int page = Integer.parseInt(pg);
		
		pageNavigations.setTotalPageCount(totalPageCount);
		pageNavigations.setNowFirst(page <= 10);
		pageNavigations.setNowEnd((totalPageCount - 1) / 10 * 10 < page);
		pageNavigations.setPageNo(page);
		return pageNavigations;
	}

	@Override
	public List<ListDto> photoList(Map<String, String> map) {
		int pg = Integer.parseInt(map.get("pg"));
		int end = pg * 10;
		int start = end - 10;
		map.put("start", start+"");
		map.put("end", end+"");
		return sqlSession.getMapper(ListDao.class).photoList(map);
	}


	

}


