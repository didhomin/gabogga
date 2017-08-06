package com.gbg.myreservation.dao;

import java.util.List;
import java.util.Map;

import com.gbg.house.model.HouseDto;



public interface MyReservationDao {
	List<HouseDto> listMemberAdmin(Map<String, String> questString);
}
