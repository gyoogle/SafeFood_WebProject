package com.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybatis.dao.FoodDAO;
import com.mybatis.vo.Food;

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

}