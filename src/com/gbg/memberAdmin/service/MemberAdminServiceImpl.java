package com.gbg.memberAdmin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbg.member.model.UsersDto;
import com.gbg.memberAdmin.dao.MemberAdminDao;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int memberAdminDelete(String userId) {
		return sqlSession.getMapper(MemberAdminDao.class).memberAdmindelete(userId);
		
	}

	@Override
	public List<UsersDto> listMemberAdmin() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MemberAdminDao.class).listMemberAdmin();
	}

	@Override
	public UsersDto searchMemberAdmin(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(MemberAdminDao.class).searchMemberAdmin(userId);
	}

}
