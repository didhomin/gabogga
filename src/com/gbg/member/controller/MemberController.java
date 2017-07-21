package com.gbg.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gbg.member.service.MemberService;

@Controller
public class MemberController {

	private MemberService memberService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@RequestMapping("/register.gbg")
	public String register() {
		System.out.println("aa");
		return "/page/member/register";
	}

}
