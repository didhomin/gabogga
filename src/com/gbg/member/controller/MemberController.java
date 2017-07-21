package com.gbg.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.member.model.UsersDto;
import com.gbg.member.service.MemberService;

@Controller
public class MemberController {

	private MemberService memberService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@RequestMapping("/register.gbg")
	public ModelAndView register(UsersDto usersDto) {
		ModelAndView mav = new ModelAndView();
		int cnt = memberService.register(usersDto);
		mav.addObject(usersDto);
		mav.setViewName("/page/member/register");
		return mav;
	}

}
