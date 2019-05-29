package com.mvc.service;

import java.util.ArrayList;
import java.util.List;

import com.mvc.vo.Eatlist;
import com.mvc.vo.Food;


public interface EatlistService {
	
	public void insert(Eatlist el);		// ?„­ì·? ì¶”ê?
	public void delete(String mcode, String fcode);		// ?„­ì·? ?‚­? œ
	
	public List<Eatlist> selectAll(); 						// eatlist
	public List<String> selectMFoodList(String mcode);		//  Member
	public List<Food> selectBest();
	public Food hotFood();
	public List<Food> TselectBest(String tier);
	public Food ThotFood(String string);
	public ArrayList<String> getcode(String mcode);
	public void setcode(String mcode, ArrayList<String> z);
}
