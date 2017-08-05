package com.gbg.board.dao;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.BoardDto;
import com.gbg.board.model.ReboardDto;
import com.gbg.board.model.StopbyDto;

public interface MapboardDao {

	int writeArticle(Map<String, Object> map);
	
	BoardDto getArticle(int seq);
	List<StopbyDto> getXY(int seq);
	
	List<BoardDto> listArticle(Map<String, String> map);
	
	int modifyArticle(BoardDto boardDto);
	int modifyStopby(Map<String, Object> map);
	
	int deleteArticle(int seq);
	int deleteStopby(int seq);
	int deleteMemo(int seq);
	
}
