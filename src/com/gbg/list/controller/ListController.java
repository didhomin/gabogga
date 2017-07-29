package com.gbg.list.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.list.service.ListService;

@Controller
@RequestMapping("/list")
public class ListController {

	@Autowired
	private ListService listService;
	
	@RequestMapping("list.html")
	public ModelAndView photoList() {
		ModelAndView mav = new ModelAndView();
//		listService.photoList(ghId);
		mav.setViewName("/photolist");
		return mav;
}
}