package com.gbg.board.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.CommonDao;
import com.gbg.board.dao.ReboardDao;
import com.gbg.board.model.ReboardDto;
import com.gbg.util.BoardConstance;

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
		sqlSession.getMapper(CommonDao.class).updateHit(seq);
		return sqlSession.getMapper(ReboardDao.class).getArticle(seq);
	}

	@Override
	public List<ReboardDto> listArticle(Map<String, String> queryString) {
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstance.LIST_SIZE;
		int start = end - BoardConstance.LIST_SIZE;
		queryString.put("start", start+"");
		queryString.put("end", end+"");
		return sqlSession.getMapper(ReboardDao.class).listArticle(queryString);
	}

	@Override
	public void replyArticle(ReboardDto reboardDto) {
		ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);
		sqlSession.getMapper(ReboardDao.class).updateStep(reboardDto);
		sqlSession.getMapper(ReboardDao.class).replyArticle(reboardDto);
		sqlSession.getMapper(ReboardDao.class).updateReply(reboardDto.getSeq());
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
