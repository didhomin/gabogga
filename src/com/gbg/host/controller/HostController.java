package com.gbg.host.controller;

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

import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.host.service.HostService;
import com.gbg.member.model.UsersDto;

@Controller
@RequestMapping("/host")
public class HostController {

	@Autowired
	private HostService hostrService;

	@RequestMapping(value = "/register.gbg", method = RequestMethod.GET)
	public String register() {
		return "/page/host/first";
	}

	@RequestMapping("/first.gbg")
	public ModelAndView first(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(map);
		if (guestHouseDto != null) {
			mav.addObject("host2", guestHouseDto);
			mav.setViewName("/page/host/second");
		} else {
			mav.setViewName("/page/host/second");
		}
		return mav;

	}
	@RequestMapping(value = "/second.gbg", method = RequestMethod.GET)
	public String second() {
		return "/page/host/first";
	}
	

	@RequestMapping(value = "/second.gbg", method = RequestMethod.POST)
	public ModelAndView second(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("host21", map);
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			if (guestHouseDto != null) {
				hostrService.secondUpdate(map);
				mav.addObject("host3", guestHouseDto);
				mav.setViewName("/page/host/third");
			} else {
				hostrService.secondInsert(map);
				mav.addObject("host3", guestHouseDto);
				mav.setViewName("/page/host/third");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/third.gbg", method = RequestMethod.GET)
	public ModelAndView third(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		mav.addObject("host2", guestHouseDto);
		mav.setViewName("/page/host/second");
		return mav;
	}

	@RequestMapping(value = "/third.gbg", method = RequestMethod.POST)
	public ModelAndView third(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			if (guestHouseDto != null) {
				hostrService.thirdUpdate(map);
				mav.addObject("host4", guestHouseDto);
				mav.setViewName("/page/host/fourth");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/fourth.gbg", method = RequestMethod.GET)
	public ModelAndView fourth(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		mav.addObject("host3", guestHouseDto);
		mav.setViewName("/page/host/third");
		return mav;
	}

	@RequestMapping(value = "/fourth.gbg", method = RequestMethod.POST)
	public ModelAndView fourth(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("id", guestHouseDto.getGuesthouseId()+"");
			RoomDto roomDto = hostrService.roomSelect(map);
			if (roomDto != null) {
				hostrService.fourthUpdate(map);
				mav.addObject("host5", roomDto);
				mav.setViewName("/page/host/fifth");
			}else{
				mav.setViewName("/page/host/fifth");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/fifth.gbg", method = RequestMethod.GET)
	public ModelAndView fifth(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			mav.addObject("host4", guestHouseDto);
			mav.setViewName("/page/host/fourth");
			return mav;
		}
	

	@RequestMapping(value = "/fifth.gbg", method = RequestMethod.POST)
	public ModelAndView fifth(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("id", guestHouseDto.getGuesthouseId()+"");
			List<RoomDto> list = hostrService.roomSelectall(map);
			if (list != null) {
				hostrService.fifthUpdate(map);
				mav.addObject("host6", list);
				mav.setViewName("/page/host/sixth");
			} else {
				hostrService.fifthInsert(map);
				mav.addObject("host6", list);
				mav.setViewName("/page/host/sixth");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/sixth.gbg", method = RequestMethod.GET)
	public ModelAndView sixth(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			Map<String, String> mapss = new HashMap<String, String>();
			mapss.put("id", guestHouseDto.getGuesthouseId()+"");
			RoomDto roomDto = hostrService.roomSelect(mapss);
			mav.addObject("host5", roomDto);
			mav.setViewName("/page/host/fifth");
			return mav;
		}

	@RequestMapping(value = "/sixth.gbg", method = RequestMethod.POST)
	public ModelAndView sixth(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			session.setAttribute("host6", map);
			mav.setViewName("/page/host/seventh");
		}
		return mav;
	}
	
	@RequestMapping(value = "/sixthmodal.gbg", method = RequestMethod.POST)
	public ModelAndView sixthmodal(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("id", guestHouseDto.getGuesthouseId()+"");
			RoomDto roomDto = hostrService.roomSelect(map);
			if (roomDto != null) {
				hostrService.sixthmodal(map);
				mav.addObject("host6", roomDto);
				mav.setViewName("/page/host/sixth");
			}
		}
		return mav;
	}

	// map.get("roomAlias")

	@RequestMapping("/seventh.gbg")
	public ModelAndView seventh(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			session.setAttribute("host5", map);
			mav.setViewName("/page/host/seventh");
		}
		return mav;
	}

	@RequestMapping("/eighth.gbg")
	public String eighth() {
		return "/page/host/eighth";
	}

	@RequestMapping("/ninth.gbg")
	public String ninth() {
		return "/page/host/ninth";
	}
}
