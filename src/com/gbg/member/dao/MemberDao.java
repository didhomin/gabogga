package com.gbg.member.dao;

import java.util.Map;

import com.gbg.member.model.UsersDto;

public interface MemberDao {
	
	int register(UsersDto usersDto);
	int snsRegister(UsersDto usersDto);
	UsersDto emailCheck(String email);
	int emailAuth(String email);
	UsersDto login(Map<String, String> map);
	void passReset(Map<String,String> map);
	void passModify(Map<String, String> map);
	int memberModify(UsersDto usersDto);

}
