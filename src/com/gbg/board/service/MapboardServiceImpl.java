package com.gbg.board.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.CommonDao;
import com.gbg.board.dao.MapboardDao;
import com.gbg.board.dao.ReboardDao;
import com.gbg.board.model.BoardDto;
import com.gbg.board.model.ReboardDto;
import com.gbg.board.model.StopbyDto;
import com.gbg.util.BoardConstance;

@Service
public class MapboardServiceImpl implements MapboardService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int writeArticle(Map<String, Object> map) {
		return sqlSession.getMapper(MapboardDao.class).writeArticle(map);
	}

	@Override
	public BoardDto getArticle(int seq) {
		sqlSession.getMapper(CommonDao.class).updateHit(seq);
		return sqlSession.getMapper(MapboardDao.class).getArticle(seq);
	}
	
	@Override
	public List<StopbyDto> getXY(int seq) {
		return sqlSession.getMapper(MapboardDao.class).getXY(seq);
	}

	@Override
	public List<BoardDto> listArticle(Map<String, String> queryString) {
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstance.LIST_SIZE;
		int start = end - BoardConstance.LIST_SIZE;
		queryString.put("start", start+"");
		queryString.put("end", end+"");
		return sqlSession.getMapper(MapboardDao.class).listArticle(queryString);
	}

	@Override
	public int replyArticle(StopbyDto stopbyDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyArticle(StopbyDto stopbyDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
