package com.gbg.list.service;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;

public interface ListService {
	List<ListDto> photoList(String address1);
	List<ListDto> roomPicture(String address1);
	String goodpm(Map<String, String> act);
	int change(Map<String, String> act);
}
