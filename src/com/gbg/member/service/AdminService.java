package com.gbg.member.service;

import com.gbg.member.model.QnaDto;

public interface AdminService {

	void sendQnaMail(QnaDto qnaDto);
}
