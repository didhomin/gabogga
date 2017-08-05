package com.gbg.member.controller;

import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
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

import com.gbg.admin.board.model.BoardListDto;
import com.gbg.admin.board.service.BoardAdminService;
import com.gbg.board.model.BoardDto;
import com.gbg.board.model.ReboardDto;
import com.gbg.board.service.BoardService;
import com.gbg.board.service.CommonService;
import com.gbg.board.service.ReboardService;
import com.gbg.list.model.ListDto;
import com.gbg.member.model.QnaDto;
import com.gbg.member.model.UsersDto;
import com.gbg.member.service.AdminService;
import com.gbg.util.PageNavigation;

@Controller
@RequestMapping("/admin")
public class AdminController extends MultiActionController{
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping(value="/qna.gbg", method=RequestMethod.GET)
	public String qna() {
		return "/WEB-INF/page/member/qna";
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
		
		return "/WEB-INF/page/member/qna";
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
	

	@RequestMapping(value="/notice.gbg", method=RequestMethod.GET)
	public ModelAndView notice(@RequestParam Map<String, String> queryString) {
		ModelAndView mav = new ModelAndView();
		
		List<BoardDto> list = boardService.listArticle(queryString);
		mav.addObject("noticeList", list);
		mav.setViewName("/page/member/noticelist");
		return mav;
	}

	@RequestMapping(value="/write.gbg", method=RequestMethod.GET)
	public String write() {
		return "/page/member/noticewrite";
	}
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.POST)
	public String write(@RequestParam Map<String, String> queryString, BoardDto boardDto, HttpSession session) {
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
			if(usersDto!=null) {
				int seq = commonService.getNextSeq();
				boardDto.setSeq(seq);
				boardDto.setUserId(usersDto.getUserId());
				boardDto.setName(usersDto.getName());
				boardDto.setEmail(usersDto.getEmail());
				boardService.writeArticle(boardDto);
			} 
		
		return "redirect:/admin/notice.gbg";
	}
	@RequestMapping("/delete.gbg")
	public String notidelete(@RequestParam("seq") String valueArr){
		String notidelete=null;
		int cnt=0;
		StringTokenizer st = new StringTokenizer(valueArr, ",");
		while(st.hasMoreTokens()){
			notidelete=st.nextToken();
			cnt += boardService.deleteArticle(notidelete);
		}
		return "redirect:/admin/notice.gbg";
	}

}
