package com.gbg.member.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.gbg.member.service.MemberServiceImpl;

public class MemberDaoImpl extends SqlMapClientDaoSupport implements MemberDao {


	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
