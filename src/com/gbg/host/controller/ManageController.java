package com.gbg.host.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.host.service.HostService;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Autowired
	private HostService hostrService;

	@RequestMapping(value = "/list.gbg", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/page/host/houseManage");
		return mav;
		
	}
}
