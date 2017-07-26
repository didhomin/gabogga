package com.gbg.host.model;

public class RoomPictureDto extends RoomDto {

	private int pictureId;
	private String picture;

	public int getPictureId() {
		return pictureId;
	}

	public void setPictureId(int pictureId) {
		this.pictureId = pictureId;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
