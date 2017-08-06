package com.gbg.myreservation.service;

import java.util.List;
import java.util.Map;

import com.gbg.house.model.HouseDto;


public interface MyReservationService {
	
	List<HouseDto> listMemberAdmin(Map<String, String> questString);
}
