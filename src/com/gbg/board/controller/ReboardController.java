package com.gbg.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.board.service.ReboardService;
import com.gbg.board.model.ReboardDto;
import com.gbg.board.service.CommonService;
import com.gbg.member.model.UsersDto;
import com.gbg.util.PageNavigation;
import com.gbg.admin.board.service.BoardAdminService;
import com.gbg.admin.board.model.BoardListDto;

@Controller
@RequestMapping("/reboard")
public class ReboardController {
	
	@Autowired
	private BoardAdminService boardAdminService;

	@Autowired
	private ReboardService reboardService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> queryString) {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		mav.addObject("qs", queryString);
		mav.setViewName("/page/community/board/write");
		return mav;
	}
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.POST)
	public String write(@RequestParam Map<String, String> queryString, ReboardDto reboardDto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		List<BoardListDto> adminlist = boardAdminService.boardList();
		List<ReboardDto> list = reboardService.listArticle(queryString);
		mav.addObject("boardmenu", adminlist);
		mav.addObject("articleList", list);
		if(usersDto != null) {
			int seq = commonService.getNextSeq();
			reboardDto.setSeq(seq);
			reboardDto.setUserId(usersDto.getUserId());
			reboardDto.setName(usersDto.getName());
			reboardDto.setEmail(usersDto.getEmail());
			reboardDto.setRef(seq);
			int cnt = reboardService.writeArticle(reboardDto);
			mav.addObject("seq", seq);
			mav.addObject("qs", queryString);
			//mav.setViewName("/page/community/board/list");
		} else {			
			mav.setViewName("/index"); //나중ㅇㅔ login page로 이동하게 할것.
			// /없으면 reboard로 가서 /있어야함 그래야 webcontent 밑으로감
		}
		return "redirect:/reboard/list.gbg?bcode="+queryString.get("bcode")+"&pg="+queryString.get("pg")+"&key="+queryString.get("key")+"&word="+queryString.get("word");
	}
	
	@RequestMapping(value="/view.gbg", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam Map<String, String> queryString, @RequestParam("seq") int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		
		ReboardDto reboardDto = null;
		if(usersDto != null) {
			reboardDto = reboardService.getArticle(seq);
		}
		mav.addObject("qs", queryString);
		mav.addObject("article", reboardDto);
		mav.setViewName("/page/community/board/view");
		return mav;
	}
	
	@RequestMapping(value="/list.gbg", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, String> queryString, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//게시판 메뉴 목록
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		
		//글목록
		List<ReboardDto> list = reboardService.listArticle(queryString);
		
		mav.addObject("qs", queryString);
		mav.addObject("articleList", list);
		
		//페이징처리
		PageNavigation pageNavigation = commonService.makePageNavigation(queryString);
		pageNavigation.setRoot(request.getContextPath());
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		
		mav.setViewName("/page/community/board/list");
		return mav;
	}
	
	@RequestMapping(value="/reply.gbg", method=RequestMethod.GET)
	public ModelAndView reply(@RequestParam Map<String, String> queryString, @RequestParam("seq") int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		ReboardDto reboardDto = null;
		if(usersDto != null) {
			reboardDto = reboardService.getArticle(seq);
		}
		mav.addObject("qs", queryString);
		mav.addObject("article", reboardDto);
		mav.setViewName("/page/community/board/reply");
		return mav;
	}
	
	@RequestMapping(value="/reply.gbg", method=RequestMethod.POST)
	public String reply(@RequestParam Map<String, String> queryString, ReboardDto reboardDto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		
		if(usersDto != null) {
			int seq = commonService.getNextSeq();
			reboardDto.setSeq(seq);
			reboardDto.setUserId(usersDto.getUserId());
			reboardDto.setName(usersDto.getName());
			reboardDto.setEmail(usersDto.getEmail());
			reboardService.replyArticle(reboardDto);
			mav.addObject("seq", seq);
			mav.addObject("qs", queryString);
		} else {			
			mav.setViewName("/index"); //나중ㅇㅔ login page로 이동하게 할것.
			// /없으면 reboard로 가서 /있어야함 그래야 webcontent 밑으로감
		}
		return "redirect:/reboard/list.gbg?bcode="+queryString.get("bcode")+"&pg="+queryString.get("pg")+"&key="+queryString.get("key")+"&word="+queryString.get("word");
	}
	
	@RequestMapping(value="/modify.gbg", method=RequestMethod.GET)
	public ModelAndView modify(@RequestParam Map<String, String> queryString, @RequestParam("seq") int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		ReboardDto reboardDto = null;
		if(usersDto != null) {
			reboardDto = reboardService.getArticle(seq);
		}
		mav.addObject("qs", queryString);
		mav.addObject("article", reboardDto);
		mav.setViewName("/page/community/board/modify");
		return mav;
	}
	
	@RequestMapping(value="/modify.gbg", method=RequestMethod.POST)
	public String modify(@RequestParam Map<String, String> queryString, ReboardDto reboardDto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		
		if(usersDto != null) {
			reboardDto.setUserId(usersDto.getUserId());
			reboardDto.setName(usersDto.getName());
			reboardDto.setEmail(usersDto.getEmail());
			reboardService.modifyArticle(reboardDto);
			mav.addObject("qs", queryString);
		} else {			
			mav.setViewName("/index"); //나중ㅇㅔ login page로 이동하게 할것.
			// /없으면 reboard로 가서 /있어야함 그래야 webcontent 밑으로감
		}
		return "redirect:/reboard/list.gbg?bcode="+queryString.get("bcode")+"&pg="+queryString.get("pg")+"&key="+queryString.get("key")+"&word="+queryString.get("word");
	}
	

	@RequestMapping(value="/delete.gbg", method=RequestMethod.GET)
	public String delete(@RequestParam Map<String, String> queryString, @RequestParam("seq") int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		if(usersDto != null) {
			int dok = reboardService.deleteArticle(seq);
		}
		mav.addObject("qs", queryString);
		mav.setViewName("/page/community/board/modify");
		return "redirect:/reboard/list.gbg?bcode="+queryString.get("bcode")+"&pg="+1+"&key="+queryString.get("key")+"&word="+queryString.get("word");
	}
	
}