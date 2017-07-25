package com.gbg.board.dao;

import java.util.List;
import java.util.Map;

import com.gbg.board.model.ReboardDto;

public interface ReboardDao {

	int writeArticle(ReboardDto reboardDto);
	ReboardDto getArticle(int seq);
	List<ReboardDto> listArticle(Map<String, String> map);
	//���� �����մ� �Խ��� ����, ����������, �˻������� ����, �˻�� ����
	//=> ���ڰ� �������� ���� �ƴ� ��� pg ������ �ȵ� pg�� �ƴ϶� 1-20�� 1������.. start end ��
	//int bcode, int start, int end, String key, String word
	int replyArticle(ReboardDto reboardDto);
	
	int modifyArticle(ReboardDto reboardDto);
	int deleteArticle(int seq); //�۹�ȣ�� �������� �����

	
}
