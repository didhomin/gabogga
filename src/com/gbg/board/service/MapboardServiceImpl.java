package com.gbg.board.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.ReboardDao;
import com.gbg.board.model.MapboardDto;
import com.gbg.board.model.ReboardDto;

@Service
public class MapboardServiceImpl implements MapboardService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int writeArticle(MapboardDto mapboardDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MapboardDto getArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MapboardDto> listArticle(int bcode, int pg, String key, String word) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyArticle(MapboardDto mapboardDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyArticle(MapboardDto mapboardDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
