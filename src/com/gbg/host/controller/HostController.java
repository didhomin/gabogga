package com.gbg.host.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gbg.host.model.ConvenienceDto;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.PictureDto;
import com.gbg.host.model.RoomDto;
import com.gbg.host.model.RoomPictureDto;
import com.gbg.host.service.HostService;
import com.gbg.member.model.UsersDto;
import com.gbg.util.Encoding;

@Controller
@RequestMapping("/host")
public class HostController {

	@Autowired
	private HostService hostrService;

	@RequestMapping(value = "/register.gbg", method = RequestMethod.GET)
	public String register() {
		return "/page/host/first";
	}

	@RequestMapping("/first.gbg")
	public ModelAndView first(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(map);
		if (guestHouseDto != null) {
			mav.addObject("host2", guestHouseDto);
			mav.setViewName("/page/host/second");
		} else {
			mav.setViewName("/page/host/second");
		}
		return mav;

	}

	@RequestMapping(value = "/second.gbg", method = RequestMethod.GET)
	public String second() {
		return "/page/host/first";
	}

	@RequestMapping(value = "/second.gbg", method = RequestMethod.POST)
	public ModelAndView second(@RequestParam Map<String, String> map, HttpSession session,
			@RequestParam("picture") MultipartFile picture, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("host21", map);
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			String filename = null;
			if (!picture.isEmpty()) {
				String original_name = picture.getOriginalFilename();
				// 어디에 올릴지 설정. (밑에서 부터)
				DateFormat df = new SimpleDateFormat("yyMMdd");
				String today = df.format(new Date()); // 폴더명을 오늘 날짜로 하기위해.
				String uploadDirectory = request.getServletContext().getRealPath("/upload") + File.separator + today;
				// 업로드라는 폴더 얻어와서 파일의 구분자 얻어오고 + today
				File dir = new File(uploadDirectory); // 파일 객체 얻어오고
				if (!dir.exists()) { // 존재 하지 않는다면.
					dir.mkdirs(); // 폴더 만들어라.
				}
				filename = today + System.nanoTime() + original_name.substring(original_name.lastIndexOf('.'));
				// 10억분의 1초 - 파일이름 똑같은 값이 나오지 않도록. + 확장자 얻기 (lastindexof - .이 나오는 S마지막 index 얻어옴)
				// 지금까지 어느 폴더에다가 이런 파일의 이름으로 저장하겠다 까지.
				try {
					picture.transferTo(new File(uploadDirectory, filename));
					// uploadDirectory위치에 filename이름으로 옮겨라.
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			map.put("picture", filename);
			if (guestHouseDto != null) {
				hostrService.secondUpdate(map);
				mav.addObject("host3", guestHouseDto);
				mav.setViewName("/page/host/third");
			} else {
				hostrService.secondInsert(map);
				mav.addObject("host3", guestHouseDto);
				mav.setViewName("/page/host/third");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/third.gbg", method = RequestMethod.GET)
	public ModelAndView third(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		mav.addObject("host2", guestHouseDto);
		mav.setViewName("/page/host/second");
		return mav;
	}

	@RequestMapping(value = "/third.gbg", method = RequestMethod.POST)
	public ModelAndView third(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			if (guestHouseDto != null) {
				hostrService.thirdUpdate(map);
				mav.addObject("host4", guestHouseDto);
				mav.setViewName("/page/host/fourth");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/fourth.gbg", method = RequestMethod.GET)
	public ModelAndView fourth(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		mav.addObject("host3", guestHouseDto);
		mav.setViewName("/page/host/third");
		return mav;
	}

	@RequestMapping(value = "/fourth.gbg", method = RequestMethod.POST)
	public ModelAndView fourth(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("id", guestHouseDto.getGuesthouseId() + "");
			RoomDto roomDto = hostrService.roomSelect(map);
			if (guestHouseDto != null) {
				hostrService.fourthUpdate(map);
				mav.addObject("host5", roomDto);
				mav.setViewName("/page/host/fifth");
			} else {
				hostrService.fourthUpdate(map);
				mav.setViewName("/page/host/fifth");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/fifth.gbg", method = RequestMethod.GET)
	public ModelAndView fifth(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		mav.addObject("host4", guestHouseDto);
		mav.setViewName("/page/host/fourth");
		return mav;
	}

	@RequestMapping(value = "/fifth.gbg", method = RequestMethod.POST)
	public ModelAndView fifth(@RequestParam Map<String, String> map, HttpSession session
			,HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("id", guestHouseDto.getGuesthouseId() + "");
			List<RoomDto> list = hostrService.roomSelectall(map);
			
			List<MultipartFile> files = multipartRequest.getFiles("picture");
			
			List<PictureDto> list3 = new ArrayList<PictureDto>();
			Iterator<MultipartFile> itr = files.iterator();
			String filename = null;
			int j = 0;
			while( itr.hasNext() )
			{
				MultipartFile a = itr.next();
				if (!a.isEmpty()) {
					j++;
				String original_name = a.getOriginalFilename();
				// 어디에 올릴지 설정. (밑에서 부터)
				DateFormat df = new SimpleDateFormat("yyMMdd");
				String today = df.format(new Date()); // 폴더명을 오늘 날짜로 하기위해.
				String uploadDirectory = request.getServletContext().getRealPath("/upload") + File.separator + today;
				// 업로드라는 폴더 얻어와서 파일의 구분자 얻어오고 + today
				File dir = new File(uploadDirectory); // 파일 객체 얻어오고
				if (!dir.exists()) { // 존재 하지 않는다면.
					dir.mkdirs(); // 폴더 만들어라.
				}
				filename = today + System.nanoTime() + original_name.substring(original_name.lastIndexOf('.'));
				// 10억분의 1초 - 파일이름 똑같은 값이 나오지 않도록. + 확장자 얻기 (lastindexof - .이 나오는 S마지막 index 얻어옴)
				// 지금까지 어느 폴더에다가 이런 파일의 이름으로 저장하겠다 까지.
				try {
					
					a.transferTo(new File(uploadDirectory, filename));
					// uploadDirectory위치에 filename이름으로 옮겨라.
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e ) {
					e.printStackTrace();
				}
				
				PictureDto pictureDto = new PictureDto();
				pictureDto.setPicture(filename);
				list3.add(pictureDto);
			}
			}
		

			if (!list.isEmpty()) {
				RoomDto roomDto = new RoomDto();
				roomDto.setRoomId(Integer.parseInt(map.get("roomId")));
				roomDto.setRoomType(map.get("roomType"));
				roomDto.setRoomName(map.get("roomAlias"));
				roomDto.setRoomNum(Integer.parseInt(map.get("roomNum")));
				roomDto.setRoomPay(Integer.parseInt(map.get("roomPay")));
				roomDto.setBedType(map.get("bedType"));
				roomDto.setBedNum(Integer.parseInt(map.get("bedNum")));
				roomDto.setBedCapacity(Integer.parseInt(map.get("roomPerson")));
				roomDto.setGuesthouseId(Integer.parseInt(map.get("id")));
				
				Map<String, Object> mapping = new HashMap<String, Object>();
				mapping.put("room", roomDto);
				hostrService.fifthUpdate(mapping);
				hostrService.fifthPictureDelete(mapping);
				for(int i=0; i<list3.size(); i++){
				mapping.put("name", list3.get(i));
				hostrService.fifthInsert2(mapping);
				}
				List<RoomDto> list2 = hostrService.roomSelectall(map);
				mav.addObject("hostroom", list2);
				mav.setViewName("/page/host/sixth");
			} else {
				RoomDto roomDto = new RoomDto();
				roomDto.setRoomType(map.get("roomType"));
				roomDto.setRoomName(map.get("roomAlias"));
				roomDto.setRoomNum(Integer.parseInt(map.get("roomNum")));
				roomDto.setRoomPay(Integer.parseInt(map.get("roomPay")));
				roomDto.setBedType(map.get("bedType"));
				roomDto.setBedNum(Integer.parseInt(map.get("bedNum")));
				roomDto.setBedCapacity(Integer.parseInt(map.get("roomPerson")));
				roomDto.setGuesthouseId(Integer.parseInt(map.get("id")));
				
				Map<String, Object> mapping = new HashMap<String, Object>();
				mapping.put("room", roomDto);
				hostrService.fifthInsert(mapping);
				RoomDto roomDto2 = hostrService.roomSelect(map);
				roomDto.setRoomId(roomDto2.getRoomId());
				mapping.put("room", roomDto);
				for(int i=0; i<list3.size(); i++){
				mapping.put("name", list3.get(i));
				hostrService.fifthInsert2(mapping);
				}
				List<RoomDto> list2 = hostrService.roomSelectall(map);
				mav.addObject("hostroom", list2);
				mav.setViewName("/page/host/sixth");
			}
		}
//		}
		return mav;
	}

	@RequestMapping(value = "/sixth.gbg", method = RequestMethod.GET)
	public ModelAndView sixth(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		Map<String, String> mapss = new HashMap<String, String>();
		mapss.put("id", guestHouseDto.getGuesthouseId() + "");
		RoomDto roomDto = hostrService.roomSelect(mapss);
		mav.addObject("host5", roomDto);
		mav.setViewName("/page/host/fifth");
		return mav;
	}

	@RequestMapping(value = "/sixthmain.gbg", method = RequestMethod.GET)
	public ModelAndView sixmain(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		maps.put("gid", guestHouseDto.getGuesthouseId() + "");
		List<RoomDto> list = hostrService.roomSelectall2(maps);
		mav.addObject("hostroom", list);
		mav.setViewName("/page/host/sixth");
		return mav;
	}

	@RequestMapping(value = "/sixthmodify.gbg", method = RequestMethod.GET)
	public ModelAndView sixthmodify(@RequestParam("act") int act, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		maps.put("gid", guestHouseDto.getGuesthouseId() + "");
		maps.put("rid", act + "");
		RoomDto roomDto = hostrService.roomModifySelect(maps);
		if (roomDto != null) {
			mav.addObject("host5", roomDto);
			mav.setViewName("/page/host/fifth");
		}
		return mav;
	}

	@RequestMapping(value = "/sixthdelete.gbg", method = RequestMethod.GET)
	public String sixthdelete(@RequestParam("act") int act, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		maps.put("gid", guestHouseDto.getGuesthouseId() + "");
		maps.put("rid", act + "");
		hostrService.roomDelete(maps);

		return "redirect:/host/sixthmain.gbg";
	}

	@RequestMapping(value = "/sixth.gbg", method = RequestMethod.POST)
	public ModelAndView sixth(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("gid", guestHouseDto.getGuesthouseId() + "");
			ConvenienceDto convenienceDto = hostrService.conSelect(map);
			mav.addObject("host7", convenienceDto);
			mav.setViewName("/page/host/seventh");
		}
		return mav;
	}

	@RequestMapping(value = "/sixthmodal.gbg", method = RequestMethod.POST)
	public String sixthmodal(@RequestParam Map<String, String> map, HttpSession session
			,HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		ModelAndView mav = new ModelAndView();
		
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("id", guestHouseDto.getGuesthouseId() + "");
			List<RoomDto> list = hostrService.roomSelectall(map);
			
			List<MultipartFile> files = multipartRequest.getFiles("picture");
			
			List<PictureDto> list3 = new ArrayList<PictureDto>();
			Iterator<MultipartFile> itr = files.iterator();
			String filename = null;
			int j = 0;
			while( itr.hasNext() )
			{
				MultipartFile a = itr.next();
				if (!a.isEmpty()) {
					j++;
				String original_name = a.getOriginalFilename();
				// 어디에 올릴지 설정. (밑에서 부터)
				DateFormat df = new SimpleDateFormat("yyMMdd");
				String today = df.format(new Date()); // 폴더명을 오늘 날짜로 하기위해.
				String uploadDirectory = request.getServletContext().getRealPath("/upload") + File.separator + today;
				// 업로드라는 폴더 얻어와서 파일의 구분자 얻어오고 + today
				File dir = new File(uploadDirectory); // 파일 객체 얻어오고
				if (!dir.exists()) { // 존재 하지 않는다면.
					dir.mkdirs(); // 폴더 만들어라.
				}
				filename = today + System.nanoTime() + original_name.substring(original_name.lastIndexOf('.'));
				// 10억분의 1초 - 파일이름 똑같은 값이 나오지 않도록. + 확장자 얻기 (lastindexof - .이 나오는 S마지막 index 얻어옴)
				// 지금까지 어느 폴더에다가 이런 파일의 이름으로 저장하겠다 까지.
				try {
					
					a.transferTo(new File(uploadDirectory, filename));
					// uploadDirectory위치에 filename이름으로 옮겨라.
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e ) {
					e.printStackTrace();
				}
				
				PictureDto pictureDto = new PictureDto();
				pictureDto.setPicture(filename);
				list3.add(pictureDto);
			}
			}
				RoomDto roomDto = new RoomDto();
				roomDto.setRoomType(map.get("roomType"));
				roomDto.setRoomName(map.get("roomAlias"));
				roomDto.setRoomNum(Integer.parseInt(map.get("roomNum")));
				roomDto.setRoomPay(Integer.parseInt(map.get("roomPay")));
				roomDto.setBedType(map.get("bedType"));
				roomDto.setBedNum(Integer.parseInt(map.get("bedNum")));
				roomDto.setBedCapacity(Integer.parseInt(map.get("roomPerson")));
				roomDto.setGuesthouseId(Integer.parseInt(map.get("id")));
				
				Map<String, Object> mapping = new HashMap<String, Object>();
				mapping.put("room", roomDto);
				hostrService.fifthInsert(mapping);
				RoomDto roomDto2 = hostrService.roomSelect(map);
				roomDto.setRoomId(roomDto2.getRoomId());
				mapping.put("room", roomDto);
				for(int i=0; i<list3.size(); i++){
				mapping.put("name", list3.get(i));
				hostrService.fifthInsert2(mapping);
				}
		}
		return "redirect:/host/sixthmain.gbg";
	}

	@RequestMapping(value = "/seventh.gbg", method = RequestMethod.GET)
	public ModelAndView seventh(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		map.put("id", guestHouseDto.getGuesthouseId() + "");
		List<RoomDto> list = hostrService.roomSelectall(map);
		mav.addObject("hostroom", list);
		mav.setViewName("/page/host/sixth");

		return mav;
	}

	@RequestMapping(value = "/seventh.gbg", method = RequestMethod.POST)
	public ModelAndView seventh(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		for (int i = 0; i < 10; i++) {
			String a = Encoding.nullToZero(map.get("chkBox" + i));
			map.put("chkBoxs" + i, a);
		}
		if (map != null) {
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("id", usersDto.getUserId());
			GuestHouseDto guestHouseDto = hostrService.first(maps);
			map.put("gid", guestHouseDto.getGuesthouseId() + "");
			map.put("id", guestHouseDto.getGuesthouseId() + "");
			ConvenienceDto convenienceDto = hostrService.conSelect(map);
			RoomDto roomDto = hostrService.roomSelect(map);
			map.put("rid", roomDto.getRoomId() + "");
			if (convenienceDto != null) {
				hostrService.seventhUpdate(map);
				mav.addObject("host8", guestHouseDto);
				mav.setViewName("/page/host/eighth");
			} else {
				hostrService.seventhInsert(map);
				mav.addObject("host8", guestHouseDto);
				mav.setViewName("/page/host/eighth");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/eighth.gbg", method = RequestMethod.GET)
	public ModelAndView eighth(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		UsersDto usersDto = (UsersDto) session.getAttribute("user");
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("id", usersDto.getUserId());
		GuestHouseDto guestHouseDto = hostrService.first(maps);
		map.put("gid", guestHouseDto.getGuesthouseId() + "");
		ConvenienceDto convenienceDto = hostrService.conSelect(map);
		mav.addObject("host7", convenienceDto);
		mav.setViewName("/page/host/seventh");
		return mav;
	}

	 @RequestMapping(value = "/eighth.gbg", method = RequestMethod.POST)
	 public String eighth(@RequestParam Map<String, String> map,
	 HttpSession session) {
	 ModelAndView mav = new ModelAndView();
	 GuestHouseDto guestHouseDto = null;
	 if (map != null) {
	 UsersDto usersDto = (UsersDto) session.getAttribute("user");
	 Map<String, String> maps = new HashMap<String, String>();
	 maps.put("id", usersDto.getUserId());
	 guestHouseDto = hostrService.first(maps);
	 map.put("gid", guestHouseDto.getGuesthouseId()+"");
	 hostrService.finalUpdate(map);
	 
	 }
	 	return "redirect:/house/reservation.gbg?guesthouseId="+guestHouseDto.getGuesthouseId();
	 }

	@RequestMapping(value = "/final.gbg", method = RequestMethod.POST)
		public ModelAndView finall(@RequestParam Map<String, String> map, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			 GuestHouseDto guestHouseDto = null;
			UsersDto usersDto = (UsersDto) session.getAttribute("user");
			 Map<String, String> maps = new HashMap<String, String>();
			 maps.put("id", usersDto.getUserId());
			 guestHouseDto = hostrService.first(maps);
			 map.put("gid", guestHouseDto.getGuesthouseId()+"");
			 hostrService.finalUpdate(map);
			mav.setViewName("/page/host/first");
			return mav;
		}
}
