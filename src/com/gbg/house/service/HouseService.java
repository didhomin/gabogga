package com.gbg.house.service;

import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.model.HouseDto;

public interface HouseService {

	int reservation(HouseDto houseDto);
	GuestHouseDto houseInfo(String guesthouseId);
	int hostInfo(GuestHouseDto gusethouseDto);
	int reservation(RoomDto roomDto);
	
}
