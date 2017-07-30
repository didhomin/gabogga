package com.gbg.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.admin.board.service.BoardAdminService;
import com.gbg.admin.board.model.BoardListDto;

@Controller
@RequestMapping("/boardadmin")
public class BoardAdminController {

	@Autowired
	private BoardAdminService boardAdminService;
	
	@RequestMapping("/boardmenu.gbg")
	public ModelAndView boardMenu() {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> list = boardAdminService.boardList();
		mav.addObject("boardmenu", list);
		mav.setViewName("/page/community/communitymain");
		return mav;
	}
}
