package com.gbg.board.model;

public class MapPositionDto {
	
	private int seq;
	private int[] step;
	private String[] x;
	private String[] y;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int[] getStep() {
		return step;
	}

	public void setStep(int[] step) {
		this.step = step;
	}

	public String[] getX() {
		return x;
	}

	public void setX(String[] x) {
		this.x = x;
	}

	public String[] getY() {
		return y;
	}

	public void setY(String[] y) {
		this.y = y;
	}
}
