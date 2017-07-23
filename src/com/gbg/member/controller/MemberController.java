package com.gbg.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.json.simple.JSONObject;
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
public class MemberController {

	private MemberService memberService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@RequestMapping("/register.gbg")
	public ModelAndView register(UsersDto usersDto) {
		ModelAndView mav = new ModelAndView();
		int cnt = memberService.register(usersDto);
		if(cnt!=0){
			memberService.mailsend(usersDto.getEmail());
			mav.addObject(usersDto);
			mav.setViewName("/page/member/register");			
		}
		return mav;
	}
	@RequestMapping("/emailCheck.gbg")
	public @ResponseBody String emailCheck(@RequestParam("email") String email) {
		int cnt = memberService.emailCheck(email);
		JSONObject json = new JSONObject();
		json.put("count", cnt);
		json.put("email", email);
//		System.out.println(json.toJSONString());
		return json.toJSONString();
	}
	
	@RequestMapping("/mail.gbg")
	public String emailAuth(@RequestParam("email") String email,ModelMap map) {
		int cnt = memberService.emailAuth(email);
		map.put("emailAuth", email);
		return "index";
	}
	@RequestMapping(value="/login.gbg", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,String> map,HttpSession session,ModelMap modelmap) {
		UsersDto usersDto = memberService.login(map);
		if(usersDto!=null){
			if(Integer.parseInt(usersDto.getState())==2) {
				session.setAttribute("user",usersDto);				
			} else if(Integer.parseInt(usersDto.getState())==3){
				session.setAttribute("user",usersDto);
				
				modelmap.put("passModify", "passModify");
			} else {
				memberService.mailsend(usersDto.getEmail());
				modelmap.put("loginresult", "미인증 회원입니다.이메일 인증 로그인 하세요!");
			}
		} else {
			modelmap.put("loginresult", "아이디 비밀번호를 확인하세요!");
		}
		return "index";
	}
	@RequestMapping(value="/login.gbg", method=RequestMethod.GET)
	public String login(ModelMap map) {
		map.put("mvlogin", "mvlogin");
		return "index";
	}
	
	@RequestMapping(value="/logout.gbg")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/index";
	}
	@RequestMapping(value="/passReset.gbg")
	public String passReset(@RequestParam("email") String email) {
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
}
