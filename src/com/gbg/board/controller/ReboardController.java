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
import com.gbg.board.model.ReboardDto;
import com.gbg.board.service.CommonService;
import com.gbg.member.model.UsersDto;
import com.gbg.admin.board.service.BoardAdminService;
import com.gbg.admin.board.model.BoardListDto;

@Controller
@RequestMapping("/reboard")
public class ReboardController {
	
	@Autowired
	private BoardAdminService boardAdminService;

	@Autowired
	private ReboardService reboardService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> queryString) {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> list = boardAdminService.boardList();
		mav.addObject("boardmenu", list);
		mav.addObject("qs", queryString);
		mav.setViewName("/page/community/board/write");
		return mav;
	}
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.POST)
	public ModelAndView write(@RequestParam Map<String, String> queryString, ReboardDto reboardDto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		List<BoardListDto> list = boardAdminService.boardList();
		mav.addObject("boardmenu", list);
		if(usersDto != null) {
			int seq = commonService.getNextSeq();
			reboardDto.setSeq(seq);
			reboardDto.setUserId(usersDto.getUserId());
			reboardDto.setName(usersDto.getName());
			reboardDto.setEmail(usersDto.getEmail());
			reboardDto.setRef(seq);
			int cnt = reboardService.writeArticle(reboardDto);
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
