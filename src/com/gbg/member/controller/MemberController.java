package com.gbg.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.member.model.UsersDto;
import com.gbg.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/register.gbg")
	public ModelAndView register(UsersDto usersDto) {
		ModelAndView mav = new ModelAndView();
		int cnt = memberService.register(usersDto);
		if(cnt!=0){
			memberService.mailsend(usersDto.getEmail());
			mav.addObject(usersDto);
			mav.setViewName("/index");			
		}
		return mav;
	}
	@RequestMapping("/emailCheck.gbg")
	public @ResponseBody String emailCheck(@RequestParam("email") String email) {
		UsersDto usersDto =memberService.emailCheck(email);
		JSONObject json = new JSONObject();
		
		json.put("count", (usersDto == null ? "0" : "1"));
		json.put("email", email);
		return json.toJSONString();
	}
	
	@RequestMapping("/mail.gbg")
	public String emailAuth(@RequestParam("email") String email,ModelMap map) {
		int cnt = memberService.emailAuth(email);
		map.put("emailAuth", email);
		return "/index";
	}
	@RequestMapping(value="/login.gbg", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,String> map,HttpSession session,ModelMap modelmap) {
		UsersDto usersDto = memberService.login(map);
		if(usersDto!=null){
			if(Integer.parseInt(usersDto.getState())==1) {
				memberService.mailsend(usersDto.getEmail());
				modelmap.put("loginresult", "미인증 회원입니다.이메일 인증 로그인 하세요!");				
			} else if(Integer.parseInt(usersDto.getState())==2){
				session.setAttribute("user",usersDto);
			} else if(Integer.parseInt(usersDto.getState())==3) {
				session.setAttribute("user",usersDto);
				modelmap.put("passModify", "passModify");
			} 
				
			
		} else {
			modelmap.put("loginresult", "아이디 비밀번호를 확인하세요!");
		}
		return "/index";
	}
	@RequestMapping(value="/login.gbg", method=RequestMethod.GET)
	public String login(ModelMap map) {
		map.put("mvlogin", "mvlogin");
		return "/index";
	}
	
	@RequestMapping(value="/logout.gbg")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/index";
	}
	@RequestMapping(value="/passReset.gbg")
	public String passReset(@RequestParam("email") String email,ModelMap modelmap) {
		modelmap.put("passReset", email);
		memberService.passReset(email);
		return "/index";
	}
	@RequestMapping(value="/passModify.gbg")
	public String passModify(@RequestParam("passModi") String password,HttpSession session) {
		UsersDto usersDto=(UsersDto)session.getAttribute("user");
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", usersDto.getEmail());
		map.put("password", password);
		memberService.passModify(map);
		return "/index";
	}
	@RequestMapping(value="/kakao.gbg")
	public String kakaoLogin(@RequestParam("email") String email,@RequestParam("name") String name,ModelMap modelmap,HttpSession session) {
		UsersDto usersDto = memberService.emailCheck(email);
		if(usersDto==null) {
			memberService.snsRegister(email,name);
		}
		session.setAttribute("user",usersDto);
		modelmap.put("snslogin", email);
		return "/index";
	}
	@RequestMapping(value="/facebook.gbg")
	public String facebookLogin(@RequestParam("email") String email,@RequestParam("name") String name,ModelMap modelmap,HttpSession session) {
		UsersDto usersDto = memberService.emailCheck(email);
		if(usersDto==null) {
			memberService.snsRegister(email,name);
		}
		modelmap.put("snslogin", email);
		session.setAttribute("user",usersDto);
		return "/index";
	}
	@RequestMapping("/modify.gbg")
	public ModelAndView memberModify(UsersDto usersDto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int cnt = memberService.memberModify(usersDto);
		if(cnt!=0){
			session.setAttribute("user",usersDto);
			mav.addObject(usersDto);
			mav.setViewName("/index");			
		}
		return mav;
	}
}
