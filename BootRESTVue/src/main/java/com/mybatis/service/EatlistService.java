package com.mybatis.service;

import java.util.List;

import com.mybatis.vo.Eatlist;

public interface EatlistService {
	
	public void insert(Eatlist el);		// 섭취 추가
	public void delete(String mcode, String fcode);		// 섭취 삭제
	public List<Eatlist> selectAll(); 						// 전체 eatlist
	public List<String> selectMFoodList(String mcode);		// 특정 회원의 섭취 목록 Member
	public List<String> selectMFoodMaterial(String mcode);
}
