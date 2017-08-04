package com.gbg.board.dao;

import java.util.List;

import com.gbg.board.model.MemoDto;

public interface MemoDao {

	void writeMemo(MemoDto memoDto);
	List<MemoDto> listMemo(int seq);
	void modifyMemo(MemoDto memoDto);
	void deleteMemo(int mseq); //메모 글 번호
	
}
