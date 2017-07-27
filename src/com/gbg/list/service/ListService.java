package com.gbg.list.service;

import java.util.List;

import com.gbg.list.model.ListDto;

public interface ListService {
	List<ListDto> photoList(int ghId);
}
