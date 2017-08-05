package com.gbg.memberAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.member.model.UsersDto;
import com.gbg.memberAdmin.dao.MemberAdminDao;
import com.gbg.util.BoardConstance;


@Service
public class MemberAdminServiceImpl implements MemberAdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int memberAdminDelete(String userId) {
		return sqlSession.getMapper(MemberAdminDao.class).memberAdmindelete(userId);
		
	}

	@Override
	public List<UsersDto> listMemberAdmin(Map<String, String> queryString) {
		// TODO Auto-generated method stub
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstance.LIST_SIZE;
		int start = end - BoardConstance.LIST_SIZE;
		queryString.put("start", start + "");
		queryString.put("end", end + "");
		return sqlSession.getMapper(MemberAdminDao.class).listMemberAdmin(queryString);
	}

	@Override
	public UsersDto searchMemberAdmin(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MemberAdminDao.class).searchMemberAdmin(userId);
	}

	@Override
	public int memberAdminBlack(String userId) {
		
		return sqlSession.getMapper(MemberAdminDao.class).memberAdminBlack(userId);
	}

	@Override
	public List<UsersDto> blacklist(Map<String, String> queryString) {
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstance.LIST_SIZE;
		int start = end - BoardConstance.LIST_SIZE;
		queryString.put("start", start + "");
		queryString.put("end", end + "");
		return sqlSession.getMapper(MemberAdminDao.class).blacklist( queryString);
	}

	@Override
	public int memberAdminSoso(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MemberAdminDao.class).memberAdminSoso(userId);
	}

	@Override
	public int memberAdmindelete(String id) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MemberAdminDao.class).memberAdmindelete(id);
	}

}
