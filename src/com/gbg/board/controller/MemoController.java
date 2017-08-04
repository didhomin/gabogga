package com.gbg.board.controller;

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

import com.gbg.board.model.MemoDto;
import com.gbg.board.service.MemoService;
import com.gbg.member.model.UsersDto;

@Controller
@RequestMapping("/memo")
public class MemoController {

	@Autowired
	private MemoService memoService;
	
	private JSONObject makeList(int seq) {
		List<MemoDto> list = memoService.listMemo(seq);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(MemoDto memoDto : list) {
			JSONObject jobj = new JSONObject();
			jobj.put("mseq", memoDto.getMseq());
			jobj.put("seq", memoDto.getSeq());
			jobj.put("userId", memoDto.getUserId());
			jobj.put("name", memoDto.getName());
			jobj.put("mcontent", memoDto.getMcontent());
			jobj.put("mtime", memoDto.getMtime());
			jobj.put("secret", memoDto.getSecret());
			jarr.add(jobj);
		}
		json.put("memolist", jarr);
		return json;
	}
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.POST)
	public @ResponseBody String write(MemoDto memoDto, HttpSession session) {
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		memoDto.setUserId(usersDto.getUserId());
		memoDto.setName(usersDto.getName());
		memoService.writeMemo(memoDto);
		
		JSONObject json = makeList(memoDto.getSeq());
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="/modify.gbg", method=RequestMethod.POST)
	public @ResponseBody String modify(MemoDto memoDto, HttpSession session) {
		UsersDto usersDto = (UsersDto) session.getAttribute("user");

		memoService.modifyMemo(memoDto);
		
		JSONObject json = makeList(memoDto.getSeq());
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="/list.gbg", method=RequestMethod.GET)
	public @ResponseBody String list(@RequestParam("seq") int seq) {
		
		JSONObject json = makeList(seq);
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="/delete.gbg", method=RequestMethod.GET)
	public @ResponseBody String delete(@RequestParam("seq") int seq, @RequestParam("mseq") int mseq)  {
		memoService.deleteMemo(mseq);
		JSONObject json = makeList(seq);
		
		return json.toJSONString();
	}
	
}
