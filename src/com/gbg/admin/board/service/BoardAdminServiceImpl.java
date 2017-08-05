package com.gbg.admin.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.admin.board.dao.BoardAdminDao;
import com.gbg.admin.board.model.*;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardListDto> boardList() {
		return sqlSession.getMapper(BoardAdminDao.class).boardList();
	}

	@Override
	public List<CategoryDto> categoryList() {
		return sqlSession.getMapper(BoardAdminDao.class).categoryList();
	}

	@Override
	public void categoryMake(String cname) {
		sqlSession.getMapper(BoardAdminDao.class).categoryMake(cname);
	}

	@Override
	public List<BoardTypeDto> boardTypeList() {
		return sqlSession.getMapper(BoardAdminDao.class).boardTypeList();
	}

	@Override
	public void boardMake(BoardListDto boardListDto) {
		sqlSession.getMapper(BoardAdminDao.class).boardMake(boardListDto);
	}

}
