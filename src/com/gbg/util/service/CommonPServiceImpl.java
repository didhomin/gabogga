package com.gbg.util.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.CommonDao;
import com.gbg.util.BoardConstance;

import com.gbg.util.PageNavigationIn;
import com.gbg.util.dao.CommonPDao;

@Service
public class CommonPServiceImpl implements CommonPService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getNextSeq() {
		return sqlSession.getMapper(CommonDao.class).getNextSeq();
	}

	@Override
	public PageNavigationIn makePageNavigation(Map<String, String> queryString) {
		PageNavigationIn pageNavigationIn = new PageNavigationIn();
		

		int newArticleCount = sqlSession.getMapper(CommonPDao.class).newArticleCount(Integer.parseInt(queryString.get("pg")));
		pageNavigationIn.setNewArticleCount(newArticleCount);

		int totalArticleCount = sqlSession.getMapper(CommonPDao.class).totalArticleCount(queryString);

		pageNavigationIn.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / BoardConstance.LIST_SIZE + 1;

		int pg = Integer.parseInt(queryString.get("pg"));
		
		pageNavigationIn.setTotalPageCount(totalPageCount);
		pageNavigationIn.setNowFirst(pg <= BoardConstance.PAGE_SIZE);
		pageNavigationIn.setNowEnd((totalPageCount - 1) / BoardConstance.PAGE_SIZE * BoardConstance.PAGE_SIZE < pg);
		pageNavigationIn.setPageNo(pg);
		return pageNavigationIn;
	}
}
