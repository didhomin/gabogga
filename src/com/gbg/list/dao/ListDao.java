package com.gbg.list.dao;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;

public interface ListDao {
	List<ListDto> photoList(String address1);
	List<ListDto> roomPicture(String address1);
	List<ListDto> goodFunc(String address1);
	String goodpm(Map<String, String> act);
	int change(Map<String, String> act);

}
