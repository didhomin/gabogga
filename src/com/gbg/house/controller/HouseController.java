package com.gbg.house.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.house.model.HouseDto;
import com.gbg.house.service.HouseService;
import com.gbg.member.model.UsersDto;

@Controller
@RequestMapping("/house")
public class HouseController {

	@Autowired
	private HouseService houseservice;
	
	@RequestMapping(value="/reservation.gbg", method=RequestMethod.GET)
	public ModelAndView room(@RequestParam("guesthouseId") int guesthouseId){
		ModelAndView mav = new ModelAndView();
		List<RoomDto> list = houseservice.room(guesthouseId);
		RoomDto roomDto = (RoomDto) houseservice.houseInfo(guesthouseId);
		mav.addObject("info", roomDto);
		mav.addObject("room",list);
		mav.setViewName("/page/house/house");
		return mav;
		
	}

	@RequestMapping(value="/reservation.gbg", method=RequestMethod.POST)
	public ModelAndView reservation(@RequestParam("reservationId") String reservationId,
									@RequestParam("oksign") String oksign,
									@RequestParam("userId") String userId,
									HouseDto houseDto, HttpSession session){
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		if (usersDto != null) {
			int cnt = houseservice.reservation(houseDto);
			mav.addObject("house", houseDto);
			mav.setViewName("/page/house/reservationok");
		}
		return mav;

	}

	@RequestMapping(value="/userresinfo.gbg", method=RequestMethod.GET)
	public ModelAndView userreservationinfo(@RequestParam("userId") String userId){
		ModelAndView mav = new ModelAndView();
		List<HouseDto> list = houseservice.userreservationinfo(userId);
		mav.addObject("userresinfo", list.get(0));
		mav.setViewName("/page/house/userresinfo");
		return mav;
		
	}
	
	@RequestMapping(value="/hostresinfo.gbg", method=RequestMethod.GET)
	public ModelAndView hostreservationinfo(HouseDto houseDto, HttpSession session){
		ModelAndView mav = new ModelAndView();
		List<HouseDto> list = houseservice.hostreservationinfo(houseDto);
		mav.addObject("hostresinfo", list.get(0));
		mav.setViewName("/page/house/hostresinfo");
		return mav;
	}
}
