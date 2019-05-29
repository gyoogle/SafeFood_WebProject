package com.mybatis.vo;

public class Nutri {
	public String name;
	public double amount;
	public int womanKcal;
	public int manKcal;
	
	public Nutri(String name, double amount) {
		super();
		this.name = name;
		this.amount = amount;
	}

	public Nutri(String name, double amount, int womanKcal, int manKcal) {
		super();
		this.name = name;
		this.amount = amount;
		this.womanKcal = womanKcal;
		this.manKcal = manKcal;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public int getWomanKcal() {
		return womanKcal;
	}

	public void setWomanKcal(int womanKcal) {
		this.womanKcal = womanKcal;
	}

	public int getManKcal() {
		return manKcal;
	}

	public void setManKcal(int manKcal) {
		this.manKcal = manKcal;
	}

	@Override
	public String toString() {
		return "Nutri [name=" + name + ", amount=" + amount + ", womanKcal=" + womanKcal + ", manKcal=" + manKcal + "]";
	}
}