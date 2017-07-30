package com.gbg.board.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.ReboardDao;
import com.gbg.board.model.ReboardDto;

@Service
public class ReboardServiceImpl implements ReboardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(ReboardDto reboardDto) {
		return sqlSession.getMapper(ReboardDao.class).writeArticle(reboardDto);
	}

	@Override
	public ReboardDto getArticle(int seq) {
		return null;
	}

	@Override
	public List<ReboardDto> listArticle(int bcode, int pg, String key, String word) {
		return null;
	}

	@Override
	public int replyArticle(ReboardDto reboardDto) {
		return 0;
	}

	@Override
	public int modifyArticle(ReboardDto reboardDto) {
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		return 0;
	}

}
