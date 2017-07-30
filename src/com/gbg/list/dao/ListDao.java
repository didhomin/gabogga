package com.gbg.list.dao;

import java.util.List;

import com.gbg.list.model.ListDto;

public interface ListDao {
	List<ListDto> photoList(String address1);
	
}
