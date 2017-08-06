package com.gbg.member.service;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;
import com.gbg.member.model.QnaDto;

public interface AdminService {

	void sendQnaMail(QnaDto qnaDto);
	List<ListDto> address(String address);
	List<ListDto> main();
	List<ListDto> mainprice();
	int man();
	int woman();
	List<Map<String, String>> regionSelect();
	List<Map<String, String>> reservationSelect();
}
