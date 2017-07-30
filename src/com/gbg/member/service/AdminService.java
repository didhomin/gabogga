package com.gbg.member.service;

import java.util.List;

import com.gbg.list.model.ListDto;
import com.gbg.member.model.QnaDto;

public interface AdminService {

	void sendQnaMail(QnaDto qnaDto);
	List<ListDto> address(String address);
}
