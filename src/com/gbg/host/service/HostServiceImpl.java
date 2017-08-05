package com.gbg.host.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.host.dao.HostDao;
import com.gbg.host.model.ConvenienceDto;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.host.model.RoomPictureDto;

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
	public int fifthUpdate(Map<String, Object> map) {
		return sqlSession.getMapper(HostDao.class).fifthUpdate(map);
	}

	@Override
	public int fifthInsert(Map<String, Object> map) {
		return sqlSession.getMapper(HostDao.class).fifthInsert(map);
	}

	@Override
	public List<RoomDto> roomSelectall(Map<String, String> map) {
		return (List<RoomDto>) sqlSession.getMapper(HostDao.class).roomSelectall(map);
	}

	@Override
	public List<RoomDto> roomSelectall2(Map<String, String> map) {
		return (List<RoomDto>) sqlSession.getMapper(HostDao.class).roomSelectall2(map);
	}

	@Override
	public RoomDto roomModifySelect(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).roomModifySelect(map);
	}

	@Override
	public int roomDelete(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).roomDelete(map);
	}

	@Override
	public int seventhUpdate(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).seventhUpdate(map);
	}

	@Override
	public int seventhInsert(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).seventhInsert(map);
	}

	@Override
	public ConvenienceDto conSelect(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).conSelect(map);
	}

	@Override
	public RoomPictureDto pictrueSelect(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).pictrueSelect(map);
	}

	@Override
	public int fifthInsert2(Map<String, Object> map) {
		return sqlSession.getMapper(HostDao.class).fifthInsert2(map);
	}

	@Override
	public int fifthPictureDelete(Map<String, Object> map) {
		return sqlSession.getMapper(HostDao.class).fifthPictureDelete(map);
	}

	@Override
	public int finalUpdate(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).finalUpdate(map);
	}

	@Override
	public List<GuestHouseDto> manageList(Map<String, String> map) {
		return sqlSession.getMapper(HostDao.class).manageList(map);
	}

	@Override
	public int deleteGuesthouse(Map<String, String> map) {
		return  sqlSession.getMapper(HostDao.class).deleteGuesthouse(map);
	}

	@Override
	public int deleteRoom(Map<String, String> map) {
		return  sqlSession.getMapper(HostDao.class).deleteRoom(map);
	}

	@Override
	public int deleteConvenience(Map<String, String> map) {
		return  sqlSession.getMapper(HostDao.class).deleteConvenience(map);
	}


}
