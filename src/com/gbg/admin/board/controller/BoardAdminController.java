package com.gbg.admin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.admin.board.service.BoardAdminService;

@Controller
@RequestMapping("/boardadmin")
public class BoardAdminController {

	@Autowired
	private BoardAdminService boardAdminService;
	
	@RequestMapping("boardmenu.html")
	public ModelAndView boardMenu(@RequestParam("ghId") String ghId) {
		ModelAndView mav = new ModelAndView();
		boardAdminService.boardList();
		mav.setViewName("/admin/boardmenu");
		return mav;
	}
}
