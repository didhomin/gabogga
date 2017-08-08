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
		List<RoomDto> infolist = houseservice.roomInfo(guesthouseId);
		ConvenienceDto convenienceDto = (ConvenienceDto) houseservice.houseInfo(guesthouseId);
		mav.addObject("info", convenienceDto);
		mav.addObject("room",list);
		mav.addObject("roominfo",infolist);
		mav.setViewName("/page/house/house");
		return mav;
		
	}

	@RequestMapping(value="/reservation.gbg", method=RequestMethod.POST)
	public String reservation(HouseDto houseDto, HttpSession session){
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		if (usersDto != null) {
			houseDto.setUserId(Integer.parseInt(usersDto.getUserId()));
			int reservationId= houseservice.reid();
			houseDto.setReservationId(reservationId+"");
			int cnt = houseservice.reservation(houseDto);
			String fromArr[] =houseDto.getCheckIn().split("/");
			String toArr[] =houseDto.getCheckOut().split("/");
			String from=fromArr[0]+fromArr[1]+fromArr[2];
			String to=toArr[0]+toArr[1]+toArr[2];
			int start = Integer.parseInt(from);
			int end= Integer.parseInt(to);
			Map<String,String> map = new HashMap<String,String>();
			map.put("person", houseDto.getPerson());
			map.put("roomId", houseDto.getRoomId()+"");
			map.put("reservationId", reservationId+"");
			for(int i=start;i<end;i++) {
				map.put("redate", i+"");
				houseservice.reservationroom(map);
			}
		}
		return "redirect:/house/userresinfo.gbg";

	}

	@RequestMapping(value="/userresinfo.gbg", method=RequestMethod.GET)
	public ModelAndView userreservationinfo(@RequestParam(value="from",defaultValue="0000-00-00" ) String from,@RequestParam(value="to",defaultValue="9999-99-99") String to,HttpSession session){
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		if(usersDto !=null) {
			Map<String,String> map = new HashMap<String,String>();
			String fromArr[] =from.split("-");
			String fromformat= fromArr[0]+"/"+fromArr[1]+"/"+fromArr[2];
			String toArr[] =to.split("-");
			String toformat= toArr[0]+"/"+toArr[1]+"/"+toArr[2];
			map.put("from", fromformat);
			map.put("to", toformat);
			map.put("userId", usersDto.getUserId());
			List<HouseDto> list = houseservice.userreservationinfo(map);
			mav.addObject("relist", list);
			mav.setViewName("/page/house/reservationinfo");
		} else {
			mav.setViewName("/index");
		}    
		return mav;
		
	}
	
	@RequestMapping(value="/hostresinfo.gbg", method=RequestMethod.GET)
	public ModelAndView hostreservationinfo(@RequestParam(value="from",defaultValue="0000-00-00" ) String from,@RequestParam(value="to",defaultValue="9999-99-99") String to
	,HttpSession session){
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		if(usersDto !=null) {
		HouseDto houseDto = houseservice.ghid(usersDto.getUserId());
		String fromArr[] =from.split("-");
		String fromformat= fromArr[0]+"/"+fromArr[1]+"/"+fromArr[2];
		String toArr[] =to.split("-");
		String toformat= toArr[0]+"/"+toArr[1]+"/"+toArr[2];
		Map<String,String> map = new HashMap<String,String>();
		map.put("userId", usersDto.getUserId());
		map.put("guesthouseId", houseDto.getGuesthouseId()+"");
		map.put("from", fromformat);
		map.put("to", toformat);
		List<HouseDto> list = houseservice.hostreservationinfo(map);
		mav.addObject("hostresinfo", list);
		mav.setViewName("/page/house/hostresinfo");
		} else {
			mav.setViewName("/index");
		}    
		return mav;
	}
	
	@RequestMapping(value="/oksign.gbg")
	public String oksign(@RequestParam("reservationId") String reservationId){
			houseservice.oksign(reservationId);
		return "redirect:/house/hostresinfo.gbg";

	}
	@RequestMapping(value="/nosign.gbg")
	public String nosign(@RequestParam("reservationId") String reservationId){
			houseservice.nosign(reservationId);
		return "redirect:/house/hostresinfo.gbg";
		
	}
	@RequestMapping(value="/hostqna.gbg")
	public String hostqna(@RequestParam Map<String,String> map){
		houseservice.hostqna(map);
		
		return "redirect:/house/"+map.get("sign")+"sign.gbg?reservationId="+map.get("reid");
		
	}
	
	@RequestMapping(value="/calSelect.gbg")
	public String calSelect(@RequestParam Map<String,String> map){
		houseservice.hostqna(map);
		
		return "redirect:/house/"+map.get("sign")+"sign.gbg?reservationId="+map.get("reid");
		
	}
}
