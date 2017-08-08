package com.gbg.member.dao;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;
import com.gbg.member.model.StatisticsDto;
import com.gbg.member.model.UsersDto;

public interface AdminDao {
	
	List<ListDto> address(String address);
	List<ListDto> main();
	List<ListDto> mainprice();

	List<Map<String, String>> regionSelect();
	List<Map<String, String>> reservationSelect();

	List<StatisticsDto> man();
	List<StatisticsDto> woman();
	
int memberAdmindelete(String id);
	
	List<UsersDto> listMemberAdmin(Map<String, String> questString);
	
	UsersDto searchMemberAdmin(String id);
	
	int memberAdminBlack(String id);
	int memberAdminSoso(String id);
	
	List<UsersDto> blacklist(Map<String, String> questString);
	
	int getNextSeq();
	void updateHit(int seq);
	int newArticleAdCount(int bcode);
	int totalArticleAdCount(Map<String, String> map);

}
