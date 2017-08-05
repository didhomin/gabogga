package com.gbg.house.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.host.dao.HostDao;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.dao.HouseDao;
import com.gbg.house.model.HouseDto;
import com.gbg.member.model.UsersDto;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int reservation(HouseDto houseDto) {
		// System.out.println(houseDto);
		return sqlSession.getMapper(HouseDao.class).reservation(houseDto);

	}

	@Override
	public int hostInfo(GuestHouseDto guesthouseDto) {
		return sqlSession.getMapper(HouseDao.class).hostInfo(guesthouseDto);
	}

	@Override
	public List<RoomDto> room(int guesthouseId) {
		return sqlSession.getMapper(HouseDao.class).room(guesthouseId);
	}

	@Override
	public GuestHouseDto houseInfo(int guesthouseId) {
		return sqlSession.getMapper(HouseDao.class).houseInfo(guesthouseId);
	}
	
	@Override
	public List<HouseDto> userreservationinfo(String userId) {
		return sqlSession.getMapper(HouseDao.class).userreservationinfo(userId);
	}



	@Override
	public List<HouseDto> hostreservationinfo(HouseDto houseDto) {
		return sqlSession.getMapper(HouseDao.class).hostreservationinfo(houseDto);
	}


}
