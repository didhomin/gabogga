package com.gbg.member.service;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;
import com.gbg.member.model.UsersDto;

public interface MemberService {
	int register(UsersDto usersDto);
	UsersDto emailCheck(String email);
	void mailsend(String email);
	int emailAuth(String email);
	UsersDto login(Map<String, String> map);
	void passReset(String email);
	void passModify(Map<String, String> map);
	int snsRegister(String email,String name);
	int memberModify(UsersDto usersDto);
	UsersDto snslogin(String email);
	
}
