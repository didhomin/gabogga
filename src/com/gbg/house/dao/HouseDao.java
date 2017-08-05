package com.gbg.house.dao;

import java.util.List;
import java.util.Map;

import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.model.HouseDto;

public interface HouseDao {

	int reservation(HouseDto houseDto);
	List<RoomDto> room(int guesthouseId);
	GuestHouseDto houseInfo(int guesthouseId);
	int hostInfo(GuestHouseDto guesthouseDto);
	List<HouseDto> hostreservationinfo(HouseDto houseDto);
	List<HouseDto> userreservationinfo(String userId);
}
