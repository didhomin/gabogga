package com.gbg.list.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.list.dao.ListDao;
import com.gbg.list.model.ListDto;

@Service
public class ListServiceImpl implements ListService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ListDto> photoList(String address1) {
		return sqlSession.getMapper(ListDao.class).photoList(address1);
	}
	
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

	

}


