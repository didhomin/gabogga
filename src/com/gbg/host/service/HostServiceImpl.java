package com.gbg.host.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.host.dao.HostDao;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;

@Service
public class HostServiceImpl implements HostService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public GuestHouseDto first(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).first(map);
	}

	@Override
	public int secondInsert(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).secondInsert(map);
	}

	@Override
	public int secondUpdate(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).secondUpdate(map);
	}

	@Override
	public int thirdUpdate(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).thirdUpdate(map);
	}

	@Override
	public int fourthUpdate(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).fourthUpdate(map);
	}

	@Override
	public RoomDto roomSelect(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).roomSelect(map);
	}

	@Override
	public int fifthUpdate(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).fifthUpdate(map);
	}

	@Override
	public int fifthInsert(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).fifthInsert(map);
	}

	@Override
	public int sixthmodal(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).sixthmodal(map);
	}

	@Override
	public List<RoomDto> roomSelectall(Map<String, String> map) {
		return (List<RoomDto>) sqlSession.getMapper(HostDao.class).roomSelectall(map);
	}


}
