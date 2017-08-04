package com.gbg.util.service;

import java.util.Map;

import com.gbg.util.PageNavigation;
import com.gbg.util.PageNavigationIn;

public interface CommonPService {

	int getNextSeq(); 
	PageNavigationIn makePageNavigation(Map<String, String> queryString);
	
}
