package com.gbg.member.service;

import java.util.Map;

import com.gbg.member.model.UsersDto;

public interface MemberService {
	int register(UsersDto usersDto);
	int emailCheck(String email);
	void mailsend(String email);
	int emailAuth(String email);
	UsersDto login(Map<String, String> map);
	void passReset(String email);
	void passModify(Map<String, String> map);
	int kakaoRegister(String email);
}
