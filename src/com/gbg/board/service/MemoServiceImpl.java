package com.gbg.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.board.dao.MemoDao;
import com.gbg.board.model.MemoDto;

@Service
public class MemoServiceImpl implements MemoService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void writeMemo(MemoDto memoDto) {
		sqlSession.getMapper(MemoDao.class).writeMemo(memoDto);
	}

	@Override
	public List<MemoDto> listMemo(int seq) {
		return sqlSession.getMapper(MemoDao.class).listMemo(seq);
	}

	@Override
	public void modifyMemo(MemoDto memoDto) {
		sqlSession.getMapper(MemoDao.class).modifyMemo(memoDto);
	}

	@Override
	public void deleteMemo(int mseq) {
		sqlSession.getMapper(MemoDao.class).deleteMemo(mseq);	
	}

}
