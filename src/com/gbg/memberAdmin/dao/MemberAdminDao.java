package com.gbg.memberAdmin.dao;

import java.util.List;

import com.gbg.member.model.UsersDto;

public interface MemberAdminDao {
	
	int memberAdmindelete(String id);
	
	List<UsersDto> listMemberAdmin();
	
	UsersDto searchMemberAdmin(String id);
	
	int memberAdminBlack(String id);
	int memberAdminSoso(String id);
	
	List<UsersDto> blacklist();
}
