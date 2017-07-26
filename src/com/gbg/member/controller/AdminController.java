package com.gbg.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gbg.member.model.QnaDto;
import com.gbg.member.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/qna.gbg", method=RequestMethod.GET)
	public String qna() {
		return "/page/member/qna";
	}
	@RequestMapping(value="/qna.gbg", method=RequestMethod.POST)
	public String qna(QnaDto qnaDto) {
		adminService.sendQnaMail(qnaDto);
		return "/page/member/qna";
	}
}
