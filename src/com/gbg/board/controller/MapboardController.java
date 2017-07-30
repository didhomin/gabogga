package com.gbg.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.board.service.ReboardService;
import com.gbg.board.model.MapboardDto;
import com.gbg.board.model.ReboardDto;
import com.gbg.board.service.CommonService;
import com.gbg.board.service.MapboardService;
import com.gbg.member.model.UsersDto;
import com.gbg.admin.board.service.BoardAdminService;
import com.gbg.admin.board.model.BoardListDto;

@Controller
@RequestMapping("/mapboard")
public class MapboardController {
	
	@Autowired
	private BoardAdminService boardAdminService;

	@Autowired
	private MapboardService mapboardService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> queryString) {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> list = boardAdminService.boardList();
		mav.addObject("boardmenu", list);
		mav.addObject("qs", queryString);
		mav.setViewName("/page/community/map/write");
		return mav;
	}
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.POST)
	public ModelAndView write(@RequestParam Map<String, String> queryString, MapboardDto mapboardDto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		List<BoardListDto> list = boardAdminService.boardList();
		mav.addObject("boardmenu", list);
		if(usersDto != null) {
			int seq = commonService.getNextSeq();
			mapboardDto.setSeq(seq);
			mapboardDto.setUserId(usersDto.getUserId());
			mapboardDto.setName(usersDto.getName());
			mapboardDto.setEmail(usersDto.getEmail());
			mapboardDto.setRef(seq);
			int cnt = mapboardService.writeArticle(mapboardDto);
			mav.addObject("seq", seq);
			mav.addObject("qs", queryString);
			mav.setViewName("/page/community/communitymain");
		} else {			
			mav.setViewName("/index"); //나중ㅇㅔ login page로 이동하게 할것.
			// /없으면 reboard로 가서 /있어야함 그래야 webcontent 밑으로감
		}
		return mav;
	}
	
}
