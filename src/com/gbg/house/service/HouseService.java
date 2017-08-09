package com.gbg.house.service;

import java.util.List;
import java.util.Map;

import com.gbg.host.model.ConvenienceDto;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.model.HouseDto;
import com.gbg.util.HostPageNavigation;
import com.gbg.util.MyPageNavigation;

public interface HouseService {

	int reservation(HouseDto houseDto);
	ConvenienceDto houseInfo(int guesthouseId);
	int hostInfo(GuestHouseDto guesthouseDto);
	List<RoomDto> room(int guesthouseId);
	List<RoomDto> roomInfo(int guesthouseId);
	List<HouseDto> hostreservationinfo(Map<String, String> map);
	List<HouseDto> userreservationinfo(Map<String, String> map);
	HouseDto ghid(String userId);
	int oksign(String reservationId);
	int nosign(String reservationId);
	void hostqna(Map<String,String> map);
	void reservationroom(Map<String, String> map);
	int reid();
	List<Map<String, String>> calSelect(Map<String, String> map);
	MyPageNavigation myPageNavigation(Map<String, String> map);
	HostPageNavigation hostPageNavigation(Map<String, String> map);
}
