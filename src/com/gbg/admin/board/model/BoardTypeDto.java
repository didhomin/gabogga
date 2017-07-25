package com.gbg.admin.board.model;

public class BoardTypeDto {
	
	private int btype; //1,2,3,..
	private String btypeName; //�亯��, �޸�, ���� �Խ��� ����
	
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public String getBtypeName() {
		return btypeName;
	}
	public void setBtypeName(String btypeName) {
		this.btypeName = btypeName;
	}
	
}
