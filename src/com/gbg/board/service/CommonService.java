package com.gbg.board.service;

import com.gbg.util.PageNavigation;

public interface CommonService {

	int getNextSeq(); //�۹�ȣ ���
	PageNavigation makePageNavigation(int bcode, int pg, String key, String word);
	
}
