package com.gbg.list.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.admin.board.model.BoardListDto;
import com.gbg.board.model.ReboardDto;
import com.gbg.list.model.ListDto;
import com.gbg.list.service.ListService;
import com.gbg.util.PageNavigations;

@Controller
@RequestMapping("/list")
public class ListController {

	@Autowired
	private ListService listService;
	
	@RequestMapping("/list.gbg")
	public ModelAndView photoList(@RequestParam("address1") String address1, @RequestParam(value="pg",defaultValue="1") String pg, HttpSession session, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		Map<String,String> map = new HashMap<String, String>();
		map.put("address1", address1);
		map.put("pg", pg);
		List<ListDto> list = listService.photoList(map);
		List<ListDto> list2 = listService.roomPicture(address1);
		
		//페이징처리
		PageNavigations pageNavi = listService.makePage(map);
		pageNavi.setRoot(request.getContextPath());
		pageNavi.setNavigator();
		mav.addObject("navigator", pageNavi);
		
		int size = list.size();
		
		mav.addObject("listsize", size);
		mav.addObject("houselist", list);
		mav.addObject("roomPictures", list2);
		mav.addObject("addr", address1);

		mav.setViewName("/WEB-INF/page/photolist/photolist");
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
//		System.out.println("ghid : " + ghId + " userId : " + userId);
//		System.out.println("result : " + result);
		int ig; //insertgood
		if(result == null){
			ig = listService.insertgood(map);
		}
		else {
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
		}	
		String gnumber = listService.goodnumber(map);
		JSONObject json = new JSONObject();
		json.put("result", gnumber);
		
		return json.toJSONString();
	}
	
//	@RequestMapping(value="/listt.gbg", method=RequestMethod.GET)
//	public ModelAndView list(@RequestParam("pg") String pg, HttpSession session, HttpServletRequest request) {
//		System.out.println(pg);
//		ModelAndView mav = new ModelAndView();
//		
//	
//		//페이징처리
//		PageNavigation pageNavi = pageService.makePage(pg);
//		pageNavi.setRoot(request.getContextPath());
//		pageNavi.setNavigator();
//		mav.addObject("navigator", pageNavi);
//		
//		mav.setViewName("/page/photolist/photolist");
//		return mav;
//	}
}
