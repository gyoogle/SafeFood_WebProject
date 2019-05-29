package com.mvc.vo;

public class AllergyList {

	private String lcode;
	private String mcode;
	private String acode;
	
	public AllergyList(String lcode, String mcode, String acode) {
		this.lcode = lcode;
		this.mcode = mcode;
		this.acode = acode;
	}

	public AllergyList() {}

	public String getLcode() {
		return lcode;
	}

	public void setLcode(String lcode) {
		this.lcode = lcode;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getAcode() {
		return acode;
	}

	public void setAcode(String acode) {
		this.acode = acode;
	}
	
}