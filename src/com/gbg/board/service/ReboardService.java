package com.gbg.board.service;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.ReboardDto;

public interface ReboardService {

	int writeArticle(ReboardDto reboardDto);
	ReboardDto getArticle(int seq);
	List<ReboardDto> listArticle(Map<String, String> queryString);

	int replyArticle(ReboardDto reboardDto);
	
	int modifyArticle(ReboardDto reboardDto);
	int deleteArticle(int seq); 
	
}
