package com.gbg.member.controller;

import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

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

import com.gbg.board.model.BoardDto;
import com.gbg.board.service.BoardService;
import com.gbg.board.service.CommonService;
import com.gbg.list.model.ListDto;
import com.gbg.member.model.QnaDto;
import com.gbg.member.model.StatisticsDto;
import com.gbg.member.model.UsersDto;
import com.gbg.member.service.AdminService;

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
			jsonaddr.put("name", listDto.getGname());
			
			jarr.add(jsonaddr);
		}
		json.put("ziplist", jarr);
		json.put("size", list.size());
		return json.toJSONString();
	}
	
	@RequestMapping(value="/gender.gbg")
	public @ResponseBody String gender() {
		List<StatisticsDto> man = adminService.man();
		List<StatisticsDto> woman = adminService.woman();
		
		JSONObject json = new JSONObject();
		JSONArray jaman = new JSONArray();
		JSONArray jawoman = new JSONArray();
		for(StatisticsDto ssDto : man) {
			JSONObject jsonaddr = new JSONObject();
			if(ssDto.getMon().equals("01")) {
				jsonaddr.put("mon", 1);				
			} else if(ssDto.getMon().equals("02")) {
				jsonaddr.put("mon", 2);
			}else if(ssDto.getMon().equals("03")) {
				jsonaddr.put("mon", 3);
			}else if(ssDto.getMon().equals("04")) {
				jsonaddr.put("mon", 4);
			}else if(ssDto.getMon().equals("05")) {
				jsonaddr.put("mon", 5);
			}else if(ssDto.getMon().equals("06")) {
				jsonaddr.put("mon", 6);
			}else if(ssDto.getMon().equals("07")) {
				jsonaddr.put("mon", 7);
			}else if(ssDto.getMon().equals("08")) {
				jsonaddr.put("mon", 8);
			}else if(ssDto.getMon().equals("09")) {
				jsonaddr.put("mon", 9);
			}else if(ssDto.getMon().equals("10")) {
				jsonaddr.put("mon", 10);
			}else if(ssDto.getMon().equals("11")) {
				jsonaddr.put("mon", 11);
			}else if(ssDto.getMon().equals("12")) {
				jsonaddr.put("mon", 12);
			}
			jsonaddr.put("cnt", ssDto.getCnt());
			jaman.add(jsonaddr);
		}
		for(StatisticsDto ssDto : woman) {
			JSONObject jsonaddr = new JSONObject();
			if(ssDto.getMon().equals("01")) {
				jsonaddr.put("mon", 1);				
			} else if(ssDto.getMon().equals("02")) {
				jsonaddr.put("mon", 2);
			}else if(ssDto.getMon().equals("03")) {
				jsonaddr.put("mon", 3);
			}else if(ssDto.getMon().equals("04")) {
				jsonaddr.put("mon", 4);
			}else if(ssDto.getMon().equals("05")) {
				jsonaddr.put("mon", 5);
			}else if(ssDto.getMon().equals("06")) {
				jsonaddr.put("mon", 6);
			}else if(ssDto.getMon().equals("07")) {
				jsonaddr.put("mon", 7);
			}else if(ssDto.getMon().equals("08")) {
				jsonaddr.put("mon", 8);
			}else if(ssDto.getMon().equals("09")) {
				jsonaddr.put("mon", 9);
			}else if(ssDto.getMon().equals("10")) {
				jsonaddr.put("mon", 10);
			}else if(ssDto.getMon().equals("11")) {
				jsonaddr.put("mon", 11);
			}else if(ssDto.getMon().equals("12")) {
				jsonaddr.put("mon", 12);
			}
			jsonaddr.put("cnt", ssDto.getCnt());
			jawoman.add(jsonaddr);
		}
		json.put("man", jaman);
		json.put("woman", jawoman);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/notice.gbg", method=RequestMethod.GET)
	public ModelAndView notice(@RequestParam Map<String, String> queryString) {
		ModelAndView mav = new ModelAndView();
		
		List<BoardDto> list = boardService.listArticle(queryString);
		mav.addObject("noticeList", list);
		mav.setViewName("/WEB-INF/page/admin/noticelist");
		return mav;
	}

	@RequestMapping(value="/write.gbg", method=RequestMethod.GET)
	public String write() {
		return "/WEB-INF/page/admin/noticewrite";
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
	
	@RequestMapping(value="/region.gbg")
	public @ResponseBody String region() {	
		List<Map<String, String>> list = adminService.regionSelect();		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(Map<String, String> map : list){
			JSONObject jsonSelect = new JSONObject(); 
			jsonSelect.put("count", map.get("count"));
			jsonSelect.put("addressgroup", map.get("addressgroup"));
			jarr.add(jsonSelect);
		}
		json.put("regionlist",jarr);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/reservation.gbg")
	public @ResponseBody String reservation() {	
		List<Map<String, String>> list = adminService.reservationSelect();	
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(Map<String, String> map : list){
			JSONObject jsonSelect = new JSONObject();
	         if(map.get("month").equals("01")) {
	        	 jsonSelect.put("month", 1);            
	          } else if(map.get("month").equals("02")) {
	        	  jsonSelect.put("month", 2);
	          }else if(map.get("month").equals("03")) {
	        	  jsonSelect.put("month", 3);
	          }else if(map.get("month").equals("04")) {
	        	  jsonSelect.put("month", 4);
	          }else if(map.get("month").equals("05")) {
	        	  jsonSelect.put("month", 5);
	          }else if(map.get("month").equals("06")) {
	        	  jsonSelect.put("month", 6);
	          }else if(map.get("month").equals("07")) {
	        	  jsonSelect.put("month", 7);
	          }else if(map.get("month").equals("08")) {
	        	  jsonSelect.put("month", 8);
	          }else if(map.get("month").equals("09")) {
	        	  jsonSelect.put("month", 9);
	          }else if(map.get("month").equals("10")) {
	        	  jsonSelect.put("month", 10);
	          }else if(map.get("month").equals("11")) {
	        	  jsonSelect.put("month", 11);
	          }else if(map.get("month").equals("12")) {
	        	  jsonSelect.put("month", 12);
	          }
			jsonSelect.put("count", map.get("count"));
			jarr.add(jsonSelect);
		}
		json.put("reservationlist",jarr);
		return json.toJSONString();
	}

}
