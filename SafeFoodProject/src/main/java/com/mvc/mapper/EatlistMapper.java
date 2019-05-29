package com.mvc.mapper;

import java.util.ArrayList;
import java.util.List;

import com.mvc.vo.Eatlist;
import com.mvc.vo.Food;

public interface EatlistMapper {
	public void insert(Eatlist el);
	public void delete(String mcode, String fcode);
	public List<Eatlist> selectAll();
	public List<String> selectMFoodList(String mcode);
	public List<Food> selectBest();
	public Food hotFood();
	public List<Food> TselectBest(String tier);
	public Food ThotFood(String string);
	public ArrayList<String> getcode(String mcode);
}
