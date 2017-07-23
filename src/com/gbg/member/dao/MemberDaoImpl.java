package com.gbg.member.dao;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.gbg.member.model.UsersDto;

public class MemberDaoImpl extends SqlMapClientDaoSupport implements MemberDao {


	@Override
	public int register(UsersDto usersDto) {
		try {
			return getSqlMapClient().update("rg.register",usersDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int emailCheck(String email) {
		try {

			return (int) getSqlMapClient().queryForObject("rg.emailCheck", email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int emailAuth(String email) {
		try {
			return getSqlMapClient().update("rg.emailAuth",email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public UsersDto login(Map<String, String> map) {
		try {

			return (UsersDto) getSqlMapClient().queryForObject("rg.login", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void passResert(Map<String,String> map) {
		try {

			getSqlMapClient().update("rg.passReset", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void passModefiy(Map<String, String> map) {
		try {

			getSqlMapClient().update("rg.passModify", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	
}
