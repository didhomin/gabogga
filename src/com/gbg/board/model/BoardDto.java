package com.gbg.board.model;

import java.util.List;

public class BoardDto {

	private int seq;
	private String userId;
	private int bcode;
	private String name;
	private String email;
	private String subject;
	private String content;
	private int hit;
	private String logtime;
	private int memocnt;
	private List<StopbyDto> stopbylist;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public int getMemocnt() {
		return memocnt;
	}
	public void setMemocnt(int memocnt) {
		this.memocnt = memocnt;
	}
	public List<StopbyDto> getStopbylist() {
		return stopbylist;
	}
	public void setStopbylist(List<StopbyDto> stopbylist) {
		this.stopbylist = stopbylist;
	}
	
	
}
