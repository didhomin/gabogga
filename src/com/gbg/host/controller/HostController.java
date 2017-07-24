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
			return "/page/host/first";
		}
		
		@RequestMapping("/second.gbg")
		public String second(){
			return "/page/host/second";
		}
		
		@RequestMapping("/third.gbg")
		public String third(){
			return "/page/host/third";
		}
		
		@RequestMapping("/fourth.gbg")
		public String fourth(){
			return "/page/host/fourth";
		}
		
		@RequestMapping("/fifth.gbg")
		public String fifth(){
			return "/page/host/fifth";
		}
		
		@RequestMapping("/sixth.gbg")
		public String sixth(){
			return "/page/host/sixth";
		}
		
		@RequestMapping("/seventh.gbg")
		public String seventh(){
			return "/page/host/seventh";
		}
		
		@RequestMapping("/eighth.gbg")
		public String eighth(){
			return "/page/host/eighth";
		}
		
		@RequestMapping("/ninth.gbg")
		public String ninth(){
			return "/page/host/ninth";
		}
}
