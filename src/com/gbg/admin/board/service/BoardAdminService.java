package com.gbg.admin.board.service;

import java.util.List;

import com.gbg.admin.board.model.*;

public interface BoardAdminService {

	List<BoardListDto> boardList();
	List<CategoryDto> categoryList(); //select
	void categoryMake(String cname); //insert
	List<BoardTypeDto> boardTypeList();
	void boardMake(BoardListDto boardListDto);
	
}
