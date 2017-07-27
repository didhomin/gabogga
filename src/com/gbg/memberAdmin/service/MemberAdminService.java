package com.gbg.memberAdmin.service;

import java.util.List;

import com.gbg.member.model.UsersDto;

public interface MemberAdminService {
	
	int memberAdminDelete(String id);
	
	List<UsersDto> listMemberAdmin();
	
	UsersDto searchMemberAdmin(String id);
}
