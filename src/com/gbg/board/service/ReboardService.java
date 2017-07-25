package com.gbg.board.service;

import java.util.List;

import com.gbg.board.model.ReboardDto;
//service���� dto ����
public interface ReboardService {

	int writeArticle(ReboardDto reboardDto); //��� �ֱ� ���� �޴��� ���޴��� 
	ReboardDto getArticle(int seq);
	List<ReboardDto> listArticle(int bcode, int pg, String key, String word);
	//���� �����մ� �Խ��� ����, ����������, �˻������� ����, �˻�� ����
	int replyArticle(ReboardDto reboardDto);
	
	int modifyArticle(ReboardDto reboardDto);
	int deleteArticle(int seq); //�۹�ȣ�� �������� �����
	
}
