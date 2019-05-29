package com.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.mapper.EatlistMapper;
import com.mvc.vo.Eatlist;
import com.mvc.vo.Food;

@Repository
public class EatlistDAOImpl implements EatlistDAO{
	@Autowired
	EatlistMapper mapper;
	
	@Override
	public void insert(Eatlist el) {
		mapper.insert(el);
	}

	@Override
	public void delete(String mcode, String fcode) {
		mapper.delete(mcode, fcode);
	}
	
	@Override
	public List<Eatlist> selectAll() {
		System.out.println("dao ");
		return mapper.selectAll();
	}

	@Override
	public List<String> selectMFoodList(String mcode) {
		return mapper.selectMFoodList(mcode);
	}

	@Override
	public List<Food> selectBest() {
		return mapper.selectBest();
	}

	@Override
	public Food hotFood() {
		return mapper.hotFood();
	}

	@Override
	public List<Food> TselectBest(String tier) {
		return mapper.TselectBest(tier);
	}

	@Override
	public Food ThotFood(String string) {
		return mapper.ThotFood(string);
	}

	@Override
	public ArrayList<String> getcode(String mcode) {
		return mapper.getcode(mcode);
	}

	@Override
	public void setcode(String mcode, ArrayList<String> z) {
		for (int i = 0; i < z.size(); i++) {
			mapper.insert(new Eatlist(z.get(i), mcode));
		}
	}

}
