package com.gbg.board.service;

import java.util.List;

import com.gbg.board.model.AlbumDto;

public interface AlbumService {

	int writeArticle(AlbumDto albumDto); //��� �ֱ� ���� �޴��� ���޴��� 
	AlbumDto getArticle(int seq);
	List<AlbumDto> listArticle(int bcode, int pg, String key, String word);
	//���� �����մ� �Խ��� ����, ����������, �˻������� ����, �˻�� ����
	
	int modifyArticle(AlbumDto albumDto);
	int deleteArticle(int seq); //�۹�ȣ�� �������� �����
	
}
