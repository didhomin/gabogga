package com.gbg.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gbg.board.service.MemoService;

@Controller
@RequestMapping("/memo")
public class MemoController {

	@Autowired
	private MemoService memoService;
}
