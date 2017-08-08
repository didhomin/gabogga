package com.gbg.member.service;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;
import com.gbg.member.model.QnaDto;
import com.gbg.member.model.StatisticsDto;
import com.gbg.member.model.UsersDto;
import com.gbg.util.PageNavigationIn;

public interface AdminService {

	void sendQnaMail(QnaDto qnaDto);
	List<ListDto> address(String address);
	List<ListDto> main();
	List<ListDto> mainprice();
	List<StatisticsDto> man();
	List<StatisticsDto> woman();
	List<Map<String, String>> regionSelect();
	List<Map<String, String>> reservationSelect();
	
int memberAdmindelete(String id);
	
	List<UsersDto> listMemberAdmin(Map<String, String> questString);
	int  memberAdminDelete(String userId);
	UsersDto searchMemberAdmin(String id);
	
	int memberAdminBlack(String id);
	int memberAdminSoso(String id);
	
	List<UsersDto> blacklist(Map<String, String> questString);
	
	int getNextSeq(); 
	PageNavigationIn makePageNavigation(Map<String, String> queryString);
}
