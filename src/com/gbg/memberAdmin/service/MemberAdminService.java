package com.gbg.memberAdmin.service;

import java.util.List;
import java.util.Map;

import com.gbg.member.model.UsersDto;

public interface MemberAdminService {
	
int memberAdmindelete(String id);
	
	List<UsersDto> listMemberAdmin(Map<String, String> questString);
	int  memberAdminDelete(String userId);
	UsersDto searchMemberAdmin(String id);
	
	int memberAdminBlack(String id);
	int memberAdminSoso(String id);
	
	List<UsersDto> blacklist(Map<String, String> questString);
	
}
