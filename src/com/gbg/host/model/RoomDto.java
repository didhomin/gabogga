package com.gbg.host.model;

public class RoomDto extends GuestHouseDto {

	private int roomId;
	private String roomType;
	private String roomName;
	private int roomNum;
	private String bedType;
	private int bedNum;
	private int bedCapacity;

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public String getBedType() {
		return bedType;
	}

	public void setBedType(String bedType) {
		this.bedType = bedType;
	}

	public int getBedNum() {
		return bedNum;
	}

	public void setBedNum(int bedNum) {
		this.bedNum = bedNum;
	}

	public int getBedCapacity() {
		return bedCapacity;
	}

	public void setBedCapacity(int bedCapacity) {
		this.bedCapacity = bedCapacity;
	}
}
