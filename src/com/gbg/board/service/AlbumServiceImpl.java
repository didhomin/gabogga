package com.gbg.board.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.gbg.board.dao.*;
import com.gbg.board.model.AlbumDto;
import com.gbg.util.BoardConstance;

@Service
public class AlbumServiceImpl implements AlbumService {
	
	private AlbumDao albumDao;

	@Override
	public int writeArticle(AlbumDto albumDto) {
		return 0;
	}

	@Override
	public AlbumDto getArticle(int seq) {
		return null;
	}

	@Override
	public List<AlbumDto> listArticle(int bcode, int pg, String key, String word) {
		return null;
	}

	@Override
	public int modifyArticle(AlbumDto albumDto) {
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		return 0;
	}

}
