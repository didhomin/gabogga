package com.gbg.board.service;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.BoardDto;
import com.gbg.board.model.StopbyDto;

public interface MapboardService {

	int writeArticle(Map<String, Object> map); 
	BoardDto getArticle(int seq);
	List<BoardDto> listArticle(Map<String, String> queryString);
//	List<Map<String, Object>> listArticle(Map<String, String> queryString);

	int replyArticle(StopbyDto stopbyDto);
	
	int modifyArticle(StopbyDto stopbyDto);
	int deleteArticle(int seq);
	
}
