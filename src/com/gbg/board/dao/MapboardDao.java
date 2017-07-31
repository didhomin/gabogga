package com.gbg.board.dao;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.MapboardDto;
import com.gbg.board.model.StopbyDto;

public interface MapboardDao {

	int writeArticle(StopbyDto stopbyDto);
	StopbyDto getArticle(int seq);
	List<StopbyDto> listArticle(Map<String, String> map);
	int replyArticle(StopbyDto stopbyDto);
	
	int modifyArticle(StopbyDto stopbyDto);
	int deleteArticle(int seq);

	
}
