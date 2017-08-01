package com.gbg.list.service;

import java.util.List;
import java.util.Map;

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
	
	@Override
	public List<ListDto> roomPicture(String address1) {
		return sqlSession.getMapper(ListDao.class).roomPicture(address1);
	}

	@Override
	public String goodpm(Map<String, String> act) {
		return sqlSession.getMapper(ListDao.class).goodpm(act);
	}

	@Override
	public int change(Map<String, String> act) {
		System.out.println("service들어오나" + act.get("act1") +" " + act.get("act2") + " " + act.get("good"));
		return sqlSession.getMapper(ListDao.class).change(act);
	}

	

}


