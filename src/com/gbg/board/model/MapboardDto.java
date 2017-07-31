package com.gbg.board.model;

public class MapboardDto extends BoardDto {
	
	private int mapseq;
	private String startLocx;
	private String startLocy;
	private String finishLocx;
	private String finishLocy;
//	private String Locx;
//	private String Locy;
	
	public int getMapseq() {
		return mapseq;
	}
	public void setMapseq(int mapseq) {
		this.mapseq = mapseq;
	}
	public String getStartLocx() {
		return startLocx;
	}
	public void setStartLocx(String startLocx) {
		this.startLocx = startLocx;
	}
	public String getStartLocy() {
		return startLocy;
	}
	public void setStartLocy(String startLocy) {
		this.startLocy = startLocy;
	}
	public String getFinishLocx() {
		return finishLocx;
	}
	public void setFinishLocx(String finishLocx) {
		this.finishLocx = finishLocx;
	}
	public String getFinishLocy() {
		return finishLocy;
	}
	public void setFinishLocy(String finishLocy) {
		this.finishLocy = finishLocy;
	}
//	public String getLocx() {
//		return Locx;
//	}
//	public void setLocx(String locx) {
//		Locx = locx;
//	}
//	public String getLocy() {
//		return Locy;
//	}
//	public void setLocy(String locy) {
//		Locy = locy;
//	}
	
}
