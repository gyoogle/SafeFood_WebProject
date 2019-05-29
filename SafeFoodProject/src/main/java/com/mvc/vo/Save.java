package com.mvc.vo;

public class Save {
	private String fcode, mcode, scode;

	
	public Save(String fcode, String mcode) {
		this.fcode = fcode;
		this.mcode = mcode;
		this.scode = null;
	}
	
	public Save(String fcode, String mcode, String scode) {
		this.fcode = fcode;
		this.mcode = mcode;
		this.scode = scode;
	}

	public Save() {}

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

	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}
	
}
