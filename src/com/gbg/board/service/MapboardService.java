package com.gbg.board.service;

import java.util.List;

import com.gbg.board.model.MapboardDto;

public interface MapboardService {

	int writeArticle(MapboardDto mapboardDto); 
	MapboardDto getArticle(int seq);
	List<MapboardDto> listArticle(int bcode, int pg, String key, String word);

	int replyArticle(MapboardDto mapboardDto);
	
	int modifyArticle(MapboardDto mapboardDto);
	int deleteArticle(int seq);
	
}
