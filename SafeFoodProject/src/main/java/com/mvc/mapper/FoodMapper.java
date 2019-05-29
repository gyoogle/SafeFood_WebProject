package com.mvc.mapper;

import java.util.List;

import com.mvc.vo.Food;

public interface FoodMapper {
	
	//FoodService
	public List<Food> selectAll();
	public List<Food> search(String name);
	public Food selectOne(String id);
	public void insert(Food f);
	//public void modify(Food f);
	public void delete(String id);
	public String getIngredient(String f_id);
	
	// 회원가입시
	String getAcode(String ingredient);
	public Food newFood();
	public List<Food> Tsearch(String name, String tier);
	public List<Food> TselectAll(String tier);
	public Food TnewFood(String string);
	public List<Food> TselectAll2(String tier);
}
