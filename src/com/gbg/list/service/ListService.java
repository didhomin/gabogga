package com.gbg.list.service;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;
import com.gbg.util.PageNavigations;

public interface ListService {
	List<ListDto> photoList(Map<String, String> map);
	List<ListDto> roomPicture(String address1);
	String goodpm(Map<String, String> map);
	int change(Map<String, String> map);
	String goodnumber(Map<String, String> map);
	int insertgood(Map<String, String> map);
	
	int getNextSeq(); 
	PageNavigations makePage(Map<String, String> map);

}
