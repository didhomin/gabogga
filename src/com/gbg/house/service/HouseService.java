package com.gbg.house.service;

import java.util.List;

import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.model.HouseDto;

public interface HouseService {

	int reservation(HouseDto houseDto);
	GuestHouseDto houseInfo(int guesthouseId);
	int hostInfo(GuestHouseDto guesthouseDto);
	List<RoomDto> room(int guesthouseId);
	List<HouseDto> reservationinfo(String userId);
	
}
