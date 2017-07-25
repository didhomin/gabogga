package com.gbg.board.dao;

import java.util.Map;

public interface CommonDao {

	int getNextSeq();
	void updateHit(int seq);
	int newArticleCount(int bcode);
	int totalArticleCount(Map<String, String> map);
	
}
