package com.gbg.memberAdmin.dao;

import java.util.List;

import com.gbg.member.model.UsersDto;

public interface MemberAdminDao {
	
	int memberAdminDelete(String id);
	
	List<UsersDto> listMemberAdmin();
	
	UsersDto searchMemberAdmin(String id);
}
