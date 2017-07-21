package com.gbg.member.service;

import org.springframework.stereotype.Service;

import com.gbg.member.dao.MemberDao;
import com.gbg.member.model.UsersDto;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	@Override
	public int register(UsersDto usersDto) {
		return memberDao.register(usersDto);
	}

	
}
