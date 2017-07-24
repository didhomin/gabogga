package com.gbg.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/host")
public class HostController {

//		@Autowired
//		private HostService hostrService;
		
		@RequestMapping(value="/register.gbg", method=RequestMethod.GET)
		public String register(){
			System.out.println("들어왓니");
			return "/page/host/first";
		}

}
