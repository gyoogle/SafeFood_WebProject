package com.mybatis.vo;

public class Allergy {

	private String acode;
	private String ingredient;

	public Allergy(String acode, String ingredient) {
		this.acode = acode;
		this.ingredient = ingredient;
	}

	public Allergy() {
	}

	public String getAcode() {
		return acode;
	}

	public void setAcode(String acode) {
		this.acode = acode;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
}