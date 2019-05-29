package com.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybatis.dao.EatlistDAO;
import com.mybatis.vo.Eatlist;

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
	public List<String> selectMFoodMaterial(String mcode) {
		return dao.selectMFoodMaterial(mcode);
	}

}
