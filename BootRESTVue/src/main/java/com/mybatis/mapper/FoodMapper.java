package com.mybatis.mapper;

import java.util.List;

import com.mybatis.vo.Food;

public interface FoodMapper {
	
	//FoodService
	public List<Food> selectAll();
	public List<Food> search(String name);
	public Food selectOne(String id);
	public void insert(Food f);
	//public void modify(Food f);
	public void delete(String id);
	public String getIngredient(String f_id);
	
	// ȸ�����Խ�
	String getAcode(String ingredient);
}
