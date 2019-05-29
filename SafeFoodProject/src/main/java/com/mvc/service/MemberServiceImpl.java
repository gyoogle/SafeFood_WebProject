package com.mvc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.dao.MemberDAO;
import com.mvc.vo.Member;

@Service("memberservice")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO mdao;
	
	@Override
	public void add(Member b) {
		mdao.add(b);
	}

	@Override
	public ArrayList<Member> search() {
		return mdao.search();
	}

	@Override
	public Member searchById(String id) {
		return mdao.searchById(id);
	}

	@Override
	public ArrayList<Member> searchByName(String name) {
		return mdao.searchByName(name);
	}

	@Override
	public ArrayList<String> allAllergy(String id) {
		return mdao.allAllergy(id);
	}

	@Override
	public int loginSuccess(String id, String password) {
		return mdao.loginSuccess(id, password);
	}

	@Override
	public int changePassword(String id, String nPassword) {
		return mdao.changePassword(id, nPassword);
	}

	@Override
	public int changeInformation(String id, String password, String name, ArrayList<String> allergy) {
		return mdao.changeInformation(id, password, name, allergy);
	}

	@Override
	public int findAllergy(String id, String Allergy) {
		return mdao.findAllergy(id, Allergy);
	}

	@Override
	public int delete(String id) {
		return mdao.delete(id);
	}

	@Override
	public String searchMcodeById(String id) {
		return mdao.searchMcodeById(id);
	}

	@Override
	public void updateByMcode(String mcode, String id) {
		mdao.updateByMcode(mcode, id);
	}

	@Override
	public String getTier(String attribute) {
		return mdao.getTier(attribute);
	}

}