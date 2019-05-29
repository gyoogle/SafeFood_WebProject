package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.dao.FoodDAO;
import com.mvc.vo.Food;

@Service("fooservice")
public class FoodServiceImpl implements FoodService{

	@Autowired
	FoodDAO fdao;
	
	@Override
	public List<Food> selectAll() {
		return fdao.selectAll();
	}

	@Override
	public List<Food> search(String name) {
		return fdao.search(name);
	}

	@Override
	public Food selectOne(String id) {
		return fdao.selectOne(id);
	}

	@Override
	public void insert(Food f) {
		fdao.insert(f);
	}

	@Override
	public void delete(String id) {
		fdao.delete(id);
	}

	@Override
	public String getIngredient(String f_id) {
		return fdao.getIngredient(f_id);
	}

	@Override
	public Food newFood() {
		return fdao.newFood();
	}

	@Override
	public List<Food> similarSearch(String f_name) {
		return fdao.similarSearch(f_name);
	}

	@Override
	public List<Food> Tsearch(String name, String tier) {
		return fdao.Tsearch(name, tier);
	}

	@Override
	public List<Food> TsimilarSearch(String f_name, String tier) {
		return fdao.TsimilarSearch(f_name, tier);
	}

	@Override
	public List<Food> TselectAll(String tier) {
		return fdao.TselectAll(tier);
	}

	@Override
	public Food TnewFood(String string) {
		return fdao.TnewFood(string);
	}

	@Override
	public List<Food> TselectAll2(String tier) {
		return fdao.TselectAll2(tier);
	}

}