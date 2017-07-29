package com.gbg.house.dao;

import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.model.HouseDto;

public interface HouseDao {

	int reservation(HouseDto houseDto);
	GuestHouseDto houseInfo(String guesthouseId);
	int hostInfo(GuestHouseDto guesthouseDto);
	int reservation(RoomDto roomDto);
	
}
