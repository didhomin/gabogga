package com.gbg.admin.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gbg.admin.board.dao.BoardAdminDao;
import com.gbg.admin.board.model.*;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {

	private BoardAdminDao boardAdminDao;
	
	@Override
	public List<BoardListDto> boardList() {
		System.out.println("서비스까지 왓다아아아ㅏㅏㅏ");
		return null;
	}

	@Override
	public List<CategoryDto> categoryList() {
		return null;
	}

	@Override
	public void categoryMake(String cname) {
		
	}

	@Override
	public List<BoardTypeDto> boardTypeList() {
		return null;
	}

	@Override
	public void boardMake(BoardListDto boardListDto) {
		
	}

}
