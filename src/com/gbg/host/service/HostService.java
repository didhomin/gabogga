package com.gbg.host.service;

import java.util.List;
import java.util.Map;

import com.gbg.host.model.ConvenienceDto;
import com.gbg.host.model.GuestHouseDto;
import com.gbg.host.model.RoomDto;
import com.gbg.host.model.RoomPictureDto;

public interface HostService {

	GuestHouseDto first(Map<String, String> map);//첫화면에서 시작하기 누르면 두번째 페이지로 이동할때
	
	int secondInsert(Map<String, String> map);//2번째 페이지에서 입력한 값 insert
	
	int secondUpdate(Map<String, String> map);//2번째 페이지에서 입력한 값 update
	
	int thirdUpdate(Map<String, String> map);//3번째 페이지에서 입력한 값 update
	
	int fourthUpdate(Map<String, String> map);//4번째 페이지에서 입력한 값 update
	
	RoomDto roomSelect(Map<String, String> map);//room table 조회
	
	int fifthUpdate(Map<String, Object> map);//5번째 페이지에서 입력한 값 update
	
	int fifthPictureDelete(Map<String, Object> map);//5번째 페이지에서 입력한 여러개 사진들 삭제.
	
	int fifthInsert(Map<String, Object> map);//5번째 페이지에서 입력한 값 insert
	
	int fifthInsert2(Map<String, Object> map);//5번째 페이지 사진들 insert
	
	List<RoomDto> roomSelectall(Map<String, String> map);//room 테이블의 여러 객실 한번에 조회
	
	List<RoomDto> roomSelectall2(Map<String, String> map);//위와 동일
	
	RoomDto roomModifySelect(Map<String, String> map);//객실수정
	
	int roomDelete(Map<String, String> map);//객실삭제
	
	int seventhUpdate(Map<String, String> map);//7번째 페이지 update
	
	int seventhInsert(Map<String, String> map);//7번째 페이지 insert
	
	ConvenienceDto conSelect(Map<String, String> map);//편의시설 테이블 조회
	
	RoomPictureDto pictrueSelect(Map<String, String> map);//room_picture 테이블 조회
	
	int finalUpdate(Map<String, String> map);//마지막페이지 업데이트
	
	List<GuestHouseDto> manageList(Map<String, String> map);//관리자 페이지 리스트 조회
	
	int deleteGuesthouse(Map<String, String> map);//숙소관리에서 게스트하우스 등록 삭제할떄 게스트하우스 테이블 삭제
	
	int deleteRoom(Map<String, String> map);//숙소관리에서 게스트하우스 등록 삭제할떄 룸 테이블 삭제
	
	int deleteConvenience(Map<String, String> map);//숙소관리에서 게스트하우스 등록 삭제할떄 편의시설 테이블 삭제
	
}
