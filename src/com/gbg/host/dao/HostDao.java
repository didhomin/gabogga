package com.gbg.host.dao;

import java.util.List;
import java.util.Map;

import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;

public interface HostDao {

	GuestHouseDto first(Map<String, String> map);
	int secondInsert(Map<String, String> map);
	int secondUpdate(Map<String, String> map);
	int thirdUpdate(Map<String, String> map);
	int fourthUpdate(Map<String, String> map);
	RoomDto roomSelect(Map<String, String> map);
	int fifthUpdate(Map<String, String> map);
	int fifthInsert(Map<String, String> map);
	int sixthmodal(Map<String, String> map);
	List<RoomDto> roomSelectall(Map<String, String> map);


}
