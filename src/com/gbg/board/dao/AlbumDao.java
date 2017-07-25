package com.gbg.board.dao;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.AlbumDto;

public interface AlbumDao {

	int writeArticle(AlbumDto albumDto); //��� �ֱ� ���� �޴��� ���޴��� 
	AlbumDto getArticle(int seq);
	List<AlbumDto> listArticle(Map<String, String> map);
	//���� �����մ� �Խ��� ����, ����������, �˻������� ����, �˻�� ����
	
	int modifyArticle(AlbumDto albumDto);
	int deleteArticle(int seq); //�۹�ȣ�� �������� �����
	
}
