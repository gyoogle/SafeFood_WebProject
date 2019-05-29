package com.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.dao.EatlistDAO;
import com.mvc.vo.Eatlist;
import com.mvc.vo.Food;


@Service("eatlistBoard")
public class EatlistServiceImpl implements EatlistService{
	
	@Autowired
	EatlistDAO dao;

	@Override
	public void insert(Eatlist el) {
		dao.insert(el);
	}

	@Override
	public void delete(String mcode, String fcode) {
		dao.delete(mcode, fcode);
	}

	@Override
	public List<Eatlist> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<String> selectMFoodList(String mcode) {
		return dao.selectMFoodList(mcode);
	}

	@Override
	public List<Food> selectBest() {
		return dao.selectBest();
	}

	@Override
	public Food hotFood() {
		return dao.hotFood();
	}

	@Override
	public List<Food> TselectBest(String tier) {
		return dao.TselectBest(tier);
	}

	@Override
	public Food ThotFood(String string) {
		return dao.ThotFood(string);
	}

	@Override
	public ArrayList<String> getcode(String mcode) {
		return dao.getcode(mcode);
	}

	@Override
	public void setcode(String mcode, ArrayList<String> z) {
		dao.setcode(mcode, z);
	}

}
