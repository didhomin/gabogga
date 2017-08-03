package com.gbg.list.model;

public class ListDto {
	private String ghId;
	private String gname;
	private String roomCount;
	private String roomPay;
	private String introduce;
	private double lat;
	private double lng;
	private String address1;
	private String pictureGh;
	private String pictureRoom;
	private String counts;
	private String good;

	
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getCounts() {
		return counts;
	}
	public void setCounts(String counts) {
		this.counts = counts;
	}
	public String getPictureGh() {
		return pictureGh;
	}
	public void setPictureGh(String pictureGh) {
		this.pictureGh = pictureGh;
	}
	public String getPictureRoom() {
		return pictureRoom;
	}
	public void setPictureRoom(String pictureRoom) {
		this.pictureRoom = pictureRoom;
	}
	public String getGhId() {
		return ghId;
	}
	public void setGhId(String ghId) {
		this.ghId = ghId;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
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
	
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	
}