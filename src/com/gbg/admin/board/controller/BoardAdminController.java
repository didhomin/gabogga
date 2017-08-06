package com.gbg.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.admin.board.service.BoardAdminService;
import com.gbg.admin.board.model.BoardListDto;
import com.gbg.admin.board.model.BoardTypeDto;
import com.gbg.admin.board.model.CategoryDto;

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
	
	@RequestMapping("/boardmenuadmin.gbg")
	public ModelAndView boardMenuAdmin() {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> list = boardAdminService.boardList();
		
		List<CategoryDto> clist = boardAdminService.categoryList();
		List<BoardTypeDto> btlist = boardAdminService.boardTypeList();
		
		mav.addObject("boardmenu", list);
		mav.addObject("clist", clist);
		mav.addObject("btlist", btlist);
		
		mav.setViewName("/page/community/communityadmin");
		return mav;
	}
	
	@RequestMapping(value="/makecategory.gbg", method=RequestMethod.GET)
	public String makeCategory(@RequestParam("cname") String cname) {
		
		boardAdminService.categoryMake(cname);
		
		return "redirect:/boardadmin/boardmenuadmin.gbg";
	}
	
	@RequestMapping(value="/makeboard.gbg", method=RequestMethod.GET)
	public String makeBoard(BoardListDto boardListDto) {
		
		boardAdminService.boardMake(boardListDto);
		
		return "redirect:/boardadmin/boardmenuadmin.gbg";
	}
}
