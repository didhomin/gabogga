package com.gbg.member.dao;

import java.sql.SQLException;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.gbg.member.model.UsersDto;

public class MemberDaoImpl extends SqlMapClientDaoSupport implements MemberDao {


	@Override
	public int register(UsersDto usersDto) {
		try {
			return getSqlMapClient().update("rg.register",usersDto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	
	
}
