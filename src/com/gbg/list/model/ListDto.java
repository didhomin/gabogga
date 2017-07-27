package com.gbg.list.model;

public class ListDto {
	private int ghId;
	private String name;
	private String roomCount;
	private String roomPay;
	private String introduce;
	private int lat;
	private int lng;
	
	public int getGhId() {
		return ghId;
	}
	public void setGhId(int ghId) {
		this.ghId = ghId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoomCount() {
		return roomCount;
	}
	public void setRoomCount(String roomCount) {
		this.roomCount = roomCount;
	}
	public String getRoomPay() {
		return roomPay;
	}
	public void setRoomPay(String roomPay) {
		this.roomPay = roomPay;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getLng() {
		return lng;
	}
	public void setLng(int lng) {
		this.lng = lng;
	}
}
