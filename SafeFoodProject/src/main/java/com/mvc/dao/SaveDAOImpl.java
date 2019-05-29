package com.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mvc.mapper.SaveMapper;
import com.mvc.vo.Save;

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
	public void delete(String num) {
		mapper.delete(num);
	}

	@Override
	public ArrayList<String> getcode(String mcode) {
		return mapper.getcode(mcode);
	}

	@Override
	public void setcode(String mcode, ArrayList<String> y) {
		for(int i = 0; i < y.size(); i++) {
			mapper.insert(new Save(y.get(i), mcode));
		}
	}
	
}
