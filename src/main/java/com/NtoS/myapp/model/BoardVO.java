package com.NtoS.myapp.model;

import java.sql.Date;
import java.util.Arrays;

public class BoardVO {
	private String brdno, brdtitle, brdwriter, brdmemo, brddate ,brdhit, brddeleteflag;

	public String getBrdhit() {
		return brdhit;
	}

	public void setBrdhit(String brdhit) {
		this.brdhit = brdhit;
	}

	public String getBrddeleteflag() {
		return brddeleteflag;
	}

	public void setBrddeleteflag(String brddeleteflag) {
		this.brddeleteflag = brddeleteflag;
	}

	public String getBrdno() {
		return brdno;
	}

	public void setBrdno(String brdno) {
		this.brdno = brdno;
	}

	public String getBrdtitle() {
		return brdtitle;
	}

	public void setBrdtitle(String brdtitle) {
		this.brdtitle = brdtitle;
	}

	public String getBrdwriter() {
		return brdwriter;
	}

	public void setBrdwriter(String brdwriter) {
		this.brdwriter = brdwriter;
	}

	public String getBrdmemo() {
		return brdmemo;
	}

	public void setBrdmemo(String brdmemo) {
		this.brdmemo = brdmemo;
	}

	public String getBrddate() {
		return brddate;
	}

	public void setBrddate(String brddate) {
		this.brddate = brddate;
	}

	@Override
	public String toString() {
		return "BoardVO [brdno=" + brdno + ", brdtitle=" + brdtitle + ", brdwriter=" + brdwriter + ", brdmemo="
				+ brdmemo + ", brddate=" + brddate + "]";
	}

}
