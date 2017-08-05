package com.gbg.host.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.service.HostService;
import com.gbg.member.model.UsersDto;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Autowired
	private HostService hostrService;

	@RequestMapping(value = "/list.gbg", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session){
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", usersDto.getUserId());
		List<GuestHouseDto> list = (List<GuestHouseDto>) hostrService.manageList(map);
		mav.addObject("manage", list);
		mav.setViewName("/WEB-INF/page/host/houseManage");
		return mav;
	}
	
	@RequestMapping(value = "/delete.gbg", method = RequestMethod.GET)
	public ModelAndView delete(HttpSession session){
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", usersDto.getUserId());
		
		GuestHouseDto guestHouseDto = hostrService.first(map);
		map.put("gid", guestHouseDto.getGuesthouseId() + "");
		
		hostrService.deleteGuesthouse(map);
		hostrService.deleteRoom(map);
		hostrService.deleteConvenience(map);
		
		List<GuestHouseDto> list = (List<GuestHouseDto>) hostrService.manageList(map);
		mav.addObject("manage", list);
		mav.setViewName("/WEB-INF/page/host/houseManage");
		return mav;
	}
	
}
