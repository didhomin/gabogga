package com.gbg.board.service;

import java.util.Map;

import com.gbg.util.PageNavigation;

public interface CommonService {

	int getNextSeq(); 
	PageNavigation makePageNavigation(Map<String, String> queryString);
	
}
