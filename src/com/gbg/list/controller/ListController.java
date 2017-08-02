package com.gbg.list.controller;

import java.util.*;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
	
	@RequestMapping(value="/good.gbg", method=RequestMethod.POST)
	public @ResponseBody String goodpm(@RequestParam("ghId") String ghId, @RequestParam("userId") String userId, @RequestParam("address1") String address1) {
		Map<String, String> map =  new HashMap<String, String>();
		map.put("ghId", ghId);
	    map.put("userId", userId);
	    map.put("address1", address1);
		String result = null;
		result = listService.goodpm(map);
		System.out.println("ghid : " + ghId + " userId : " + userId);
		System.out.println("result : " + result);
		
		int goodd = -1;
		if(result.equals("1")) {
			map.put("good", "0");
			goodd = listService.change(map);
			//서비스 가서 0으로 업데이트
		} else if (!result.equals("1")) {
			map.put("good", "1");
			goodd = listService.change(map);
			//서비스 가서 1로 업데이트해줌
		}		
		String gnumber = listService.goodnumber(map);
		JSONObject json = new JSONObject();
		json.put("result", gnumber);
		return json.toJSONString();
	}
}
