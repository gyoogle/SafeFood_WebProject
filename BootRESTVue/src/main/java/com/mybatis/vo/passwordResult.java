package com.mybatis.vo;

public class passwordResult {
	public String result;

	public passwordResult(String result) {
		this.result = result;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "passwordResult [result=" + result + "]";
	}
}
