package com.gbg.board.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.MapboardDao;
import com.gbg.board.dao.ReboardDao;
import com.gbg.board.model.MapboardDto;
import com.gbg.board.model.ReboardDto;
import com.gbg.board.model.StopbyDto;

@Service
public class MapboardServiceImpl implements MapboardService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int writeArticle(StopbyDto stopbyDto) {
		return sqlSession.getMapper(MapboardDao.class).writeArticle(stopbyDto);
	}

	@Override
	public StopbyDto getArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StopbyDto> listArticle(int bcode, int pg, String key, String word) {
		// TODO Auto-generated method stub
		return null;
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
