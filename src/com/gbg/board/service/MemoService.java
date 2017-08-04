package com.gbg.board.service;

import java.util.List;

import com.gbg.board.model.MemoDto;

public interface MemoService {
	
	void writeMemo(MemoDto memoDto);
	List<MemoDto> listMemo(int seq);
	void modifyMemo(MemoDto memoDto);
	void deleteMemo(int mseq); //메모 글 번호

}
