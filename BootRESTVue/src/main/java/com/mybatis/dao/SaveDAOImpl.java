package com.mybatis.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mybatis.mapper.BoardMapper;
import com.mybatis.mapper.SaveMapper;
import com.mybatis.vo.Board;
import com.mybatis.vo.Save;

@Repository
public class SaveDAOImpl implements SaveDAO {

	@Autowired
	SaveMapper mapper;

	@Override
	public List<Save> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public Save selectOne(String num) {
		return mapper.selectOne(num);
	}

	@Override
	public void insert(Save s) {
		mapper.insert(s);
	}


	@Override
	public List<String> selectMFoodList(String mcode) {
		return mapper.selectMFoodList(mcode);
	}

	@Override
	public void delete(String mcode, String fcode) {
		mapper.delete(mcode, fcode);
	}
	
}
