package com.gbg.memberAdmin.dao;

import java.util.List;
import java.util.Map;

import com.gbg.member.model.UsersDto;

public interface MemberAdminDao {
	
	int memberAdmindelete(String id);
	
	List<UsersDto> listMemberAdmin(Map<String, String> questString);
	
	UsersDto searchMemberAdmin(String id);
	
	int memberAdminBlack(String id);
	int memberAdminSoso(String id);
	
	List<UsersDto> blacklist(Map<String, String> questString);
}
