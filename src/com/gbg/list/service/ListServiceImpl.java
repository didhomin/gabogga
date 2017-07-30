package com.gbg.list.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.list.dao.ListDao;
import com.gbg.list.model.ListDto;
import com.gbg.member.dao.MemberDao;
import com.gbg.member.model.UsersDto;

@Service
public class ListServiceImpl implements ListService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ListDto> photoList(String address1) {
		return sqlSession.getMapper(ListDao.class).photoList(address1);
	}

}


