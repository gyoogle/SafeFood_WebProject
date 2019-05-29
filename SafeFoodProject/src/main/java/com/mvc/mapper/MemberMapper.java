package com.mvc.mapper;

import java.util.ArrayList;

import com.mvc.vo.Member;

public interface MemberMapper {
	public void add(Member b);

	public ArrayList<Member> search();

	public Member searchById(String id);

	public ArrayList<Member> searchByName(String name);

	public ArrayList<String> allAllergy(String id);

	public int loginSuccess(String id, String password);

	public int changePassword(String id, String nPassword);

	public int changeInformation(String id, String password, String name, ArrayList<String> allergy);

	public int findAllergy(String id, String Allergy);

	public int delete(String id);

	public String searchPassByMcode(String mcode);

	public String searchNameByMcode(String mcode);

	public String searchMcodeById(String id);
	
	// 회원가입시
	public void addAllergyList(String mcode, String acode);
	
	// 회원 수정시
	public void updateByMcode(String mcode, String id);

	public String getTier(String attribute);

	public void setTier(String mcode, String tier);
}