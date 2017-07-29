package com.gbg.memberAdmin.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.member.model.UsersDto;
import com.gbg.memberAdmin.service.MemberAdminService;

@Controller
@RequestMapping("/memberAdmin")
public class MemberAdminController {

	@Autowired
	private MemberAdminService memberAdminService;
	
	@RequestMapping("/list.gbg")
	public ModelAndView listMemberAdmin(@RequestParam(value="pg",defaultValue="1" ) String pg){
		ModelAndView mav = new ModelAndView();
		List<UsersDto> list = memberAdminService.listMemberAdmin();
		mav.addObject("userAdminlist", list);
		mav.setViewName("/page/memberadmin/memberAdmin");
		return mav;
	}
	@RequestMapping("/idcheck.gbg")
	public @ResponseBody String searchMemberAdmin(@RequestParam("namemodel") String userId){
		String genderr="0";
		UsersDto usersDto = memberAdminService.searchMemberAdmin(userId);
		JSONObject json = new JSONObject();
		json.put("tel", usersDto.getTel());
		json.put("gemail", usersDto.getEmail());
		if(usersDto.getGender().equals("1")){
			genderr="남자";
		}else{
			genderr="여자";
		}
		json.put("gender", genderr);
		json.put("regDate", usersDto.getRegDate());
		json.put("userId", userId);
		return json.toJSONString();
	}
	
	@RequestMapping("/delete.gbg")
	public String delete(@RequestParam("id") String id){
		int cnt=0;
		cnt = memberAdminService.memberAdminDelete(id);
		//일단 이렇게 하고 수정할 가능성이 매우 높다.
		return "redirect:/memberAdmin/list.gbg";
	}
}
