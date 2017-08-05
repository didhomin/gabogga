package com.gbg.board.service;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.BoardDto;
import com.gbg.board.model.StopbyDto;

public interface MapboardService {

	int writeArticle(Map<String, Object> map); 
	
	BoardDto getArticle(int seq);
	List<StopbyDto> getXY(int seq);
	
	List<BoardDto> listArticle(Map<String, String> queryString);

	
	int modifyArticle(int seq, BoardDto boardDto, Map<String, Object> map);
	int deleteArticle(int seq);
	
}
