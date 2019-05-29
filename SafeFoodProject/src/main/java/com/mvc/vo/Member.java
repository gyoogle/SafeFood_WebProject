package com.mvc.vo;

import java.util.ArrayList;

public class Member {
	String id;
	String password;
	String name;
	ArrayList<String> allergy;
	String tier;

	// Constructor
	public Member() {
		allergy = new ArrayList<String>();
	}

	public Member(String id, String password, String name) {
		this.allergy = null;
		this.tier = "1";
		this.id = id;
		this.password = password;
		this.name = name;
	}

	public Member(String id, String password, String name, ArrayList<String> allergy) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.allergy = new ArrayList<String>();
		for (int i = 0; i < allergy.size(); i++) {
			this.allergy.add(allergy.get(i));
		}
	}
	
	public Member(String id, String password, String name, ArrayList<String> allergy, String tier) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.allergy = new ArrayList<String>();
		for (int i = 0; i < allergy.size(); i++) {
			this.allergy.add(allergy.get(i));
		}
		this.tier = tier;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<String> getAllergy() {
		return allergy;
	}

	public void setAllergy(ArrayList<String> allergy) {
		this.allergy = allergy;
	}

	// ToString
	@Override
	public String toString() {
		return "Member [name=" + name + ", id=" + id + ", password=" + password + ", allergy=" + allergy + "]";
	}
}