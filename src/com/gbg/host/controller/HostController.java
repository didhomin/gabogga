package com.gbg.host.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/host")
public class HostController {

//		@Autowired
//		private HostService hostrService;
		
		@RequestMapping(value="/register.gbg", method=RequestMethod.GET)
		public String register(){
			return "/page/host/first";
		}
		
		@RequestMapping("/first.gbg")
		public String second(){
			return "/page/host/second";
		}
		
		@RequestMapping("/second.gbg")
		public ModelAndView third(@RequestParam Map<String, String> map, HttpSession session){
			ModelAndView mav= new ModelAndView();
			if(map != null){
				session.setAttribute("host", map);
				mav.setViewName("/page/host/third");
			}
			return mav;
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
