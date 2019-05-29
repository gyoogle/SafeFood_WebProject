package com.mybatis.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybatis.mapper.FoodMapper;
import com.mybatis.mapper.MemberMapper;
import com.mybatis.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	MemberMapper Mmapper;
	
	@Autowired
	FoodMapper Fmapper;
	
	@Override
	public void add(Member b) {
		
//		System.out.println("add�Ҽ��־�?");
		Mmapper.add(b);
		
		String mcode = Mmapper.searchMcodeById(b.getId());
		
		System.out.println("mcode : " + mcode);
		
		ArrayList<String> alle = b.getAllergy();
		
		System.out.println("**********alle size : " + alle.size());
		
		
		ArrayList<String> a = new ArrayList<String>();
		for (String x : alle) {
			a.add(Fmapper.getAcode(x));
		}
		for (String as : a) {
			Mmapper.addAllergyList(mcode, as);
		}
	}

	@Override
	public ArrayList<Member> search() {
		System.out.println("saldkjlsa;kdl;askd;lksadkl;sakd;ka=-=======");
		return Mmapper.search();
	}

	@Override
    public Member searchById(String id) {
        String mcode = Mmapper.searchMcodeById(id);
        
        ArrayList<String> al = Mmapper.allAllergy(mcode);
        
        String pass = Mmapper.searchPassByMcode(mcode);
        String name = Mmapper.searchNameByMcode(mcode);
        String tier = Mmapper.searchTierByMcode(mcode);
        
        Member ret = new Member(id, pass, name, al, tier);
        
        return ret;
    }

	@Override
	public ArrayList<Member> searchByName(String name) {
		return Mmapper.searchByName(name);
	}

	 @Override
	    public ArrayList<String> allAllergy(String id) {
	        String mcode = Mmapper.searchMcodeById(id);
	        ArrayList<String> al =  Mmapper.allAllergy(mcode);
	        
	        for (String x : al) {
	            System.out.println(x);
	        }
	        return al;
	    }

	@Override
	public int loginSuccess(String id, String password) {
		return Mmapper.loginSuccess(id, password);
	}

	@Override
	public int changePassword(String id, String nPassword) {
		return Mmapper.changePassword(id, nPassword);
	}

	@Override
	public int changeInformation(String id, String password, String name, ArrayList<String> allergy) {
		String mcode = Mmapper.searchMcodeById(id);
		Mmapper.delete(mcode);
		
		Mmapper.add(new Member(id, password, name, allergy));
		Mmapper.updateByMcode(mcode, id);
		return 1;
//		return Mmapper.changeInformation(id, password, name, allergy);
	}

	@Override
	public int findAllergy(String id, String Allergy) {
		return Mmapper.findAllergy(id, Allergy);
	}

	@Override
	public int delete(String id) {
		return Mmapper.delete(id);
	}

	@Override
    public String searchMcodeById(String id) {
        return Mmapper.searchMcodeById(id);
    }

	@Override
	public void updateByMcode(String mcode, String id) {
		Mmapper.updateByMcode(mcode, id);
	}

	@Override
	public void updateTier(String id, String tier) {
		Mmapper.updateTier(id, tier);
	}

	@Override
	public void updateBypass(String id, String pass) {
		Mmapper.updateBypass(id,pass);
	}
	
}