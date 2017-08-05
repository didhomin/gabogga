package com.gbg.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.gbg.board.model.BoardDto;
import com.gbg.board.model.MapPositionDto;
import com.gbg.board.model.ReboardDto;
import com.gbg.board.model.StopbyDto;
import com.gbg.board.service.CommonService;
import com.gbg.board.service.MapboardService;
import com.gbg.member.model.UsersDto;
import com.gbg.util.PageNavigation;
import com.gbg.admin.board.service.BoardAdminService;
import com.gbg.admin.board.model.BoardListDto;

@Controller
@RequestMapping("/mapboard")
public class MapboardController {
	
	@Autowired
	private BoardAdminService boardAdminService;

	@Autowired
	private MapboardService mapboardService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> queryString) {
		ModelAndView mav = new ModelAndView();
		List<BoardListDto> list = boardAdminService.boardList();
		mav.addObject("boardmenu", list);
		mav.addObject("qs", queryString);
		mav.setViewName("/page/community/map/write");
		return mav;
	}
	
	@RequestMapping(value="/write.gbg", method=RequestMethod.POST)
	public String write(@RequestParam Map<String, String> queryString, BoardDto boardDto, MapPositionDto mapPositionDto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		//List<StopbyDto> list = mapboardService.listArticle(queryString);
		//mav.addObject("articleList", list);
		
		
//		for(int i=0; i<stopbyDto.getX().length; i++)
//			System.out.println("queryString >> " + stopbyDto.getStep()[i] + "   " + stopbyDto.getX()[i] + "    " + stopbyDto.getY()[i]);

		/*x[i]=queryString.get("x");
		y[i]=queryString.get("y");*/
		
		if(usersDto != null) {
			int seq = commonService.getNextSeq();
			
			int len = mapPositionDto.getStep().length;
			
//			System.out.println(" >>>>>>>>>>>>>>>>> " + len);
			List<StopbyDto> slist = new ArrayList<StopbyDto>();
			for(int i=0;i<len;i++) {
				StopbyDto stopbyDto = new StopbyDto();
				stopbyDto.setSeq(seq);
				stopbyDto.setStep(mapPositionDto.getStep()[i]);
				stopbyDto.setX(mapPositionDto.getX()[i]);
				stopbyDto.setY(mapPositionDto.getY()[i]);
				
				slist.add(stopbyDto);
			}
			
			boardDto.setSeq(seq);
			boardDto.setUserId(usersDto.getUserId());
			boardDto.setName(usersDto.getName());
			boardDto.setEmail(usersDto.getEmail());
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board", boardDto);
			map.put("position", slist);
			
			int cnt = mapboardService.writeArticle(map);
			System.out.println("cnt  =================================== " + cnt);
			mav.addObject("seq", seq);
			mav.addObject("qs", queryString);
			//mav.setViewName("/page/community/communitymain");
		} else {			
			mav.setViewName("/index"); //나중ㅇㅔ login page로 이동하게 할것.
			// /없으면 reboard로 가서 /있어야함 그래야 webcontent 밑으로감
		}
		return "redirect:/mapboard/list.gbg?bcode="+queryString.get("bcode")+"&pg="+queryString.get("pg")+"&key="+queryString.get("key")+"&word="+queryString.get("word");
	}
	
	@RequestMapping(value="/view.gbg", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam Map<String, String> queryString, @RequestParam("seq") int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		
		BoardDto boardDto = null;
		List<StopbyDto> xylist = null;
		if(usersDto != null) {
			boardDto = mapboardService.getArticle(seq);
			xylist = mapboardService.getXY(seq);
		}
		mav.addObject("qs", queryString);
		mav.addObject("article", boardDto);
		mav.addObject("stopbyXY", xylist);
		mav.setViewName("/page/community/map/view");
		return mav;
	}
	
	@RequestMapping(value="/list.gbg", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, String> queryString, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//게시판 메뉴 목록
		List<BoardListDto> adminlist = boardAdminService.boardList();
		mav.addObject("boardmenu", adminlist);
		
		//글목록
		List<BoardDto> list = mapboardService.listArticle(queryString);
		List<BoardDto> boardlist = new ArrayList<BoardDto>();
		for (int i =0; i <list.size(); i++) {
			BoardDto boardDto = list.get(i);
			int seq = boardDto.getSeq();
			List<StopbyDto> xylist = mapboardService.getXY(seq);
			boardDto.setStopbylist(xylist);
			
			boardlist.add(boardDto);
		}
		
		mav.addObject("qs", queryString);
		mav.addObject("articleList", boardlist);
		
		//페이징처리
		PageNavigation pageNavigation = commonService.makePageNavigation(queryString);
		pageNavigation.setRoot(request.getContextPath());
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		
		mav.setViewName("/page/community/map/list");
		return mav;
	}
	
}
