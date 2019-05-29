package com.mvc.service;

import java.util.List;
import com.mvc.vo.*;

public interface FoodService {
	//FoodService
	public List<Food> selectAll();
	public List<Food> search(String name);
	public Food selectOne(String id);
	public void insert(Food f);
	//public void modify(Food f);
	public void delete(String id);
	public String getIngredient(String f_id);
	public Food newFood();
	public List<Food> similarSearch(String f_name);
	public List<Food> Tsearch(String name, String tier);
    public List<Food> TsimilarSearch(String f_name, String tier);
    public List<Food> TselectAll(String tier);
    public List<Food> TselectAll2(String tier);
	public Food TnewFood(String string);
}