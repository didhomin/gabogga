package com.gbg.util.dao;

import java.util.Map;

public interface CommonPDao {

	int getNextSeq();
	void updateHit(int seq);
	int newArticleCount(int bcode);
	int totalArticleCount(Map<String, String> map);
	
}
