package com.mybatis.vo;

public class Eatlist {
	private String fcode, mcode, ecode;
	
	private Eatlist() {
		super();
	}

	public Eatlist(String mcode, String ecode) {
		this.mcode = mcode;
		this.ecode = ecode;
	}
	
	public Eatlist(String fcode, String mcode, String ecode) {
		this.fcode = fcode;
		this.mcode = mcode;
		this.ecode = ecode;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getEcode() {
		return ecode;
	}

	public void setEcode(String ecode) {
		this.ecode = ecode;
	}

	@Override
	public String toString() {
		return "Eatlist [fcode=" + fcode + ", mcode=" + mcode + ", ecode=" + ecode + "]";
	}
}
