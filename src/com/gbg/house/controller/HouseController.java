package com.gbg.house.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.host.model.ConvenienceDto;
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
		ConvenienceDto convenienceDto = (ConvenienceDto) houseservice.houseInfo(guesthouseId);
		mav.addObject("info", convenienceDto);
		mav.addObject("roominfo",list);
		mav.setViewName("/page/house/house");
		/*mav.setViewName("/page/house/reservatiomModal");*/
		return mav;
		
	}

	@RequestMapping(value="/reservation.gbg", method=RequestMethod.POST)
	public ModelAndView reservation(/*@RequestParam("reservationId") String reservationId,*/
//									@RequestParam("oksign") String oksign,
//									@RequestParam("userId") String userId,
//									@RequestParam("guesthouseId") int guesthouseId,
									HouseDto houseDto, HttpSession session){
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		if (usersDto != null) {
			int cnt = houseservice.reservation(houseDto);
			List<RoomDto> list = houseservice.room(cnt);
			mav.addObject("house", houseDto);
			mav.addObject("roominfo",list);
			mav.setViewName("/index");
		}
		return mav;

	}

	@RequestMapping(value="/userresinfo.gbg", method=RequestMethod.GET)
	public ModelAndView userreservationinfo(@RequestParam("userId") String userId){
		ModelAndView mav = new ModelAndView();
		List<HouseDto> list = houseservice.userreservationinfo(userId);
		mav.addObject("userresinfo", list);
		mav.setViewName("/page/house/userresinfo");
		return mav;
		
	}
	
	@RequestMapping(value="/hostresinfo.gbg", method=RequestMethod.GET)
	public ModelAndView hostreservationinfo(HttpSession session){
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		HouseDto houseDto = houseservice.ghid(usersDto.getUserId());
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("userId", usersDto.getUserId());
		map.put("guesthouseId", houseDto.getGuesthouseId());
		
		List<HouseDto> list = houseservice.hostreservationinfo(map);
		mav.addObject("hostresinfo", list);
		mav.setViewName("/page/house/hostresinfo");
		return mav;
	}
	
	@RequestMapping(value="/oksign.gbg")
	public ModelAndView oksign(@RequestParam("reservationId") String reservationId){
		ModelAndView mav = new ModelAndView();
//		System.out.println(reservationId);
		String oksign = houseservice.oksign(reservationId);
//		mav.addObject("oksign", houseDto);
		mav.setViewName("/page/house/hostresok");
		return mav;

	}
}
