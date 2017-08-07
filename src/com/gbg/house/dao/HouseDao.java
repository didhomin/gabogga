package com.gbg.house.dao;

import java.util.List;
import java.util.Map;

import com.gbg.host.model.ConvenienceDto;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.model.HouseDto;

public interface HouseDao {

	int reservation(HouseDto houseDto);
	List<RoomDto> room(int guesthouseId);
	List<RoomDto> roomInfo(int guesthouseId);
	ConvenienceDto houseInfo(int guesthouseId);
	int hostInfo(GuestHouseDto guesthouseDto);
	List<HouseDto> hostreservationinfo(Map<String, String> map);
	List<HouseDto> userreservationinfo(String userId);
	HouseDto ghid(String userId);
	int oksign(String reservationId);
	int nosign(String reservationId); 
}
