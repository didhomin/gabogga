package com.gbg.member.dao;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;
import com.gbg.member.model.UsersDto;

public interface AdminDao {
	
	List<ListDto> address(String address);
}
