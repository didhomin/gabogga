package com.gbg.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.BoardDao;
import com.gbg.board.model.BoardDto;
import com.gbg.member.dao.AdminDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(BoardDto boardDto) {
		return sqlSession.getMapper(BoardDao.class).writeArticle(boardDto);
	}

	@Override
	public BoardDto getArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> listArticle(Map<String, String> queryString) {
		
		return sqlSession.getMapper(BoardDao.class).listArticle(queryString);
	}

	@Override
	public int modifyArticle(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(String seq) {
		
		return sqlSession.getMapper(BoardDao.class).deleteArticle(seq);
	}

}
