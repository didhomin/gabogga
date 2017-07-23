package com.gbg.member.dao;

import java.util.Map;

import com.gbg.member.model.UsersDto;

public interface MemberDao {
	
	int register(UsersDto usersDto);
	int emailCheck(String email);
	int emailAuth(String email);
	UsersDto login(Map<String, String> map);
	void passResert(Map<String,String> map);
	void passModefiy(Map<String, String> map);

}
