package com.gbg.list.dao;

import java.util.List;
import java.util.Map;

import com.gbg.list.model.ListDto;
import com.gbg.util.PageNavigation;

public interface ListDao {
	List<ListDto> photoList(Map<String, String> map);
	List<ListDto> roomPicture(String address1);
	List<ListDto> goodFunc(String address1);
	String goodpm(Map<String, String> map);
	int change(Map<String, String> map);
	String goodnumber(Map<String, String> map);
	int insertgood(Map<String, String> map);
	
	int getNextSeq(); 
	PageNavigation makePage(String pg);
	int totalArticleCount(String pg);

}
