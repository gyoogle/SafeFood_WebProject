package com.mybatis.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybatis.mapper.FoodMapper;
import com.mybatis.vo.Food;


@Repository
public class FoodDAOImpl implements FoodDAO{

	@Autowired
	FoodMapper Fmapper;
	
	@Override
	public List<Food> selectAll() {
		return Fmapper.selectAll();
	}

	@Override
	public List<Food> search(String name) {
		return Fmapper.search(name);
	}

	@Override
	public Food selectOne(String id) {
		System.out.println("나오냐 : " + id);
		return Fmapper.selectOne(id);
	}

	@Override
	public void insert(Food f) {
		Fmapper.insert(f);
	}

	@Override
	public void delete(String id) {
		Fmapper.delete(id);
	}

	@Override
	public String getIngredient(String f_id) {
		return Fmapper.getIngredient(f_id);
	}

}