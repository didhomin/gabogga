package com.gbg.board.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.gbg.board.dao.ReboardDao;
import com.gbg.board.model.ReboardDto;
import com.gbg.util.BoardConstance;

@Service
public class ReboardServiceImpl implements ReboardService {

	private ReboardDao reboardDao;
	
	@Override
	public int writeArticle(ReboardDto reboardDto) {
		return 0;
	}

	@Override
	public ReboardDto getArticle(int seq) {
		return null;
	}

	@Override
	public List<ReboardDto> listArticle(int bcode, int pg, String key, String word) {
		return null;
	}

	@Override
	public int replyArticle(ReboardDto reboardDto) {
		return 0;
	}

	@Override
	public int modifyArticle(ReboardDto reboardDto) {
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		return 0;
	}

}
