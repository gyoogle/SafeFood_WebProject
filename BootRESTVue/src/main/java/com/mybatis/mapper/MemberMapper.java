package com.mybatis.mapper;

import java.util.ArrayList;

import com.mybatis.vo.Member;

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
	
	// ȸ�����Խ�
	public void addAllergyList(String mcode, String acode);
	
	// ȸ�� ������
	public void updateByMcode(String mcode, String id);

	public String searchTierByMcode(String mcode);

	public void updateTier(String id, String tier);

	public void updateBypass(String id, String pass);
}