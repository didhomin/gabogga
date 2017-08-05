package com.gbg.board.dao;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.BoardDto;

public interface BoardDao {
	int writeArticle(BoardDto boardDto);
	BoardDto getArticle(int seq);
	List<BoardDto> listArticle(Map<String, String> queryString);

	int modifyArticle(BoardDto boardDto);
	int deleteArticle(String seq); 
	
}
