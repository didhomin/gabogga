package com.gbg.board.dao;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.ReboardDto;

public interface ReboardDao {

	int writeArticle(ReboardDto reboardDto);
	ReboardDto getArticle(int seq);
	List<ReboardDto> listArticle(Map<String, String> map);
	int replyArticle(ReboardDto reboardDto);
	
	int modifyArticle(ReboardDto reboardDto);
	int deleteArticle(int seq);

	
}
