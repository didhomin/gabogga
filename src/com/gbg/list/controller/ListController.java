package com.gbg.list.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.list.model.ListDto;
import com.gbg.list.service.ListService;

@Controller
@RequestMapping("/list")
public class ListController {

	@Autowired
	private ListService listService;
	
	@RequestMapping("/list.gbg")
	public ModelAndView photoList(@RequestParam("address1") String address1) {
		
		ModelAndView mav = new ModelAndView();
		List<ListDto> list = listService.photoList(address1);
		for	(ListDto a : list) {
			System.out.println(a.getGname());
		}
		mav.addObject("houselist", list);
		mav.setViewName("/page/photolist/photolist");
		return mav;
	}
}
