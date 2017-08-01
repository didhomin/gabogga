package com.gbg.list.controller;

import java.util.List;
import java.util.Map;

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
		List<ListDto> list2 = listService.roomPicture(address1);
		
		mav.addObject("houselist", list);
		mav.addObject("roomPictures", list2);

		mav.setViewName("/page/photolist/photolist");
		return mav;
	}
	
	@RequestMapping("/good.gbg")
	public ModelAndView goodpm(@RequestParam Map<String, String> act) {
		ModelAndView mav = new ModelAndView();
		String result = listService.goodpm(act);
		if(result == "1") {
			String good = null;
			act.put(good, "0");
			listService.change(act);
			//서비스 가서 0으로 업데이트
		} else if (result != "1") {
			String good = null;
			act.put(good, "1");
			listService.change(act);
			//서비스 가서 1로 업데이트해줌
		}
		
		mav.addObject("goodchange", result);
		mav.setViewName("/page/photolist/photolist");
		return mav;
	}
}
