package com.mybatis.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybatis.mapper.EatlistMapper;
import com.mybatis.vo.Eatlist;

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
		System.out.println("dao 실행");
		return mapper.selectAll();
	}

	@Override
	public List<String> selectMFoodList(String mcode) {
		return mapper.selectMFoodList(mcode);
	}

	@Override
	public List<String> selectMFoodMaterial(String mcode) {
		return mapper.selectMFoodMaterial(mcode);
	}

}
