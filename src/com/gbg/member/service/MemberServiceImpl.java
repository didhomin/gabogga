package com.gbg.member.service;

import org.springframework.stereotype.Service;

import com.gbg.member.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	@Override
	public int idCheck(String id) {
		return memberDao.idCheck(id);
	}

	
}
