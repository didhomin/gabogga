package com.gbg.host.service;

import java.util.List;
import java.util.Map;

import com.gbg.host.model.ConvenienceDto;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.host.model.RoomPictureDto;

public interface HostService {

	GuestHouseDto first(Map<String, String> map);
	int secondInsert(Map<String, String> map);
	int secondUpdate(Map<String, String> map);
	int thirdUpdate(Map<String, String> map);
	int fourthUpdate(Map<String, String> map);
	RoomDto roomSelect(Map<String, String> map);
	int fifthUpdate(Map<String, Object> map);
	int fifthPictureDelete(Map<String, Object> map);
	int fifthInsert(Map<String, Object> map);
	int fifthInsert2(Map<String, Object> map);
	List<RoomDto> roomSelectall(Map<String, String> map);
	List<RoomDto> roomSelectall2(Map<String, String> map);
	RoomDto roomModifySelect(Map<String, String> map);
	int roomDelete(Map<String, String> map);
	int seventhUpdate(Map<String, String> map);
	int seventhInsert(Map<String, String> map);
	ConvenienceDto conSelect(Map<String, String> map);
	RoomPictureDto pictrueSelect(Map<String, String> map);
	int finalUpdate(Map<String, String> map);

	
}
