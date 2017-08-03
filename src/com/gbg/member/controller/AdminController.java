package com.gbg.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.gbg.list.model.ListDto;
import com.gbg.member.model.QnaDto;
import com.gbg.member.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController extends MultiActionController{
	
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/qna.gbg", method=RequestMethod.GET)
	public String qna() {
		return "/page/member/qna";
	}
		 

	  
	@RequestMapping(value="/main.gbg")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<ListDto> list = adminService.main();
		List<ListDto> listprice = adminService.mainprice();
		session.setAttribute("main", list);
		session.setAttribute("mainprice", listprice); 
		mav.setViewName("/WEB-INF/page/admin/main");
		return mav;
	}
	@RequestMapping(value="/qna.gbg", method=RequestMethod.POST)
	public String qna(QnaDto qnaDto) {
		adminService.sendQnaMail(qnaDto);
		return "/page/member/qna";
	}
	@RequestMapping(value="/statistics.gbg")
	public String exhibition() {
		return "/WEB-INF/page/admin/statistics";
	}
	@RequestMapping(value="/address.gbg")
	public @ResponseBody String address(@RequestParam("address") String address) {
		List<ListDto> list = adminService.address(address);
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(ListDto listDto : list) {
			JSONObject jsonaddr = new JSONObject();
			jsonaddr.put("address", listDto.getAddress1());
			
			jarr.add(jsonaddr);
		}
		json.put("ziplist", jarr);
		json.put("size", list.size());
		return json.toJSONString();
	}
	@RequestMapping(value="/gender.gbg")
	public @ResponseBody String gender() {
		String man = adminService.man()+"";
		String woman = adminService.woman()+"";
		
		JSONObject json = new JSONObject();
		json.put("woman", woman);
		json.put("man", man);
		return json.toJSONString();
	}
}
