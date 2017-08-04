package com.gbg.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			mav.addObject("register",usersDto);
			mav.setViewName("/WEB-INF/page/admin/main");			
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
		return "/WEB-INF/page/admin/main";
	}
	@RequestMapping(value="/login.gbg", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,String> map,HttpSession session,ModelMap modelmap,
			HttpServletRequest request, HttpServletResponse response) {
		UsersDto usersDto = memberService.login(map);
		if(usersDto!=null){
			
			String idsv = map.get("remember");
			if("remember".equals(idsv)) {//아이디저장 체크
				Cookie cookie = new Cookie("kid_sid", map.get("email"));
				cookie.setMaxAge(60*60*24*365);
				cookie.setPath(request.getContextPath());
				response.addCookie(cookie);
			} else {//아이디저장 체크X
				Cookie cookie[] = request.getCookies();
				if(cookie != null) {
					int len = cookie.length;
					for(int i=0;i<len;i++) {
						if("kid_sid".equals(cookie[i].getName())) {
							cookie[i].setMaxAge(0);
							cookie[i].setPath(request.getContextPath());
							response.addCookie(cookie[i]);
							break;
						}
					}
				}
			}
			
			
			
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
		return "/WEB-INF/page/admin/main";
	}
	@RequestMapping(value="/login.gbg", method=RequestMethod.GET)
	public String login(ModelMap map) {
		map.put("mvlogin", "mvlogin");
		return "/WEB-INF/page/admin/main";
	}
	
	@RequestMapping(value="/logout.gbg")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "/WEB-INF/page/admin/main";
	}
	@RequestMapping(value="/passReset.gbg")
	public String passReset(@RequestParam("email") String email,ModelMap modelmap) {
		modelmap.put("passReset", email);
		memberService.passReset(email);
		return "/WEB-INF/page/admin/main";
	}
	@RequestMapping(value="/passModify.gbg")
	public String passModify(@RequestParam("passModi") String password,HttpSession session) {
		UsersDto usersDto=(UsersDto)session.getAttribute("user");
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", usersDto.getEmail());
		map.put("password", password);
		memberService.passModify(map);
		return "/WEB-INF/page/admin/main";
	}
	@RequestMapping(value="/kakao.gbg")
	public String kakaoLogin(@RequestParam("email") String email,@RequestParam("name") String name,ModelMap modelmap,HttpSession session) {
		UsersDto usersDto = memberService.emailCheck(email);
		if(usersDto==null) {
			memberService.snsRegister(email,name);
		}
		usersDto = memberService.snslogin(email);
		session.setAttribute("user",usersDto);
		modelmap.put("snslogin", email);
		return "/WEB-INF/page/admin/main";
	}
	@RequestMapping(value="/facebook.gbg")
	public String facebookLogin(@RequestParam("email") String email,@RequestParam("name") String name,ModelMap modelmap,HttpSession session) {
		UsersDto usersDto = memberService.emailCheck(email);
		if(usersDto==null) {
			memberService.snsRegister(email,name);
		}
		usersDto = memberService.snslogin(email);
		modelmap.put("snslogin", email);
		session.setAttribute("user",usersDto);
		return "/WEB-INF/page/admin/main";
	}
	@RequestMapping("/modify.gbg")
	public ModelAndView memberModify(UsersDto usersDto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int cnt = memberService.memberModify(usersDto);
		if(cnt!=0){
			session.setAttribute("user",usersDto);
			mav.addObject(usersDto);
			mav.setViewName("/WEB-INF/page/admin/main");			
		}
		return mav;
	}
}
