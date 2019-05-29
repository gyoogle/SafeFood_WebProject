package com.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.SaveDAO;
import com.mvc.vo.Save;

@Service("serviceSave")
public class SaveServiceImpl implements SaveService{

	@Autowired
	SaveDAO sao;

	@Override
	public List<Save> selectAll() {
		return sao.selectAll();
	}

	@Override
	public Save selectOne(String num) {
		return sao.selectOne(num);
	}

	@Override
	public void insert(Save s) {
		sao.insert(s);
	}

	@Override
	public void delete(String num) {
		sao.delete(num);
	}

	@Override
	public ArrayList<String> getcode(String mcode) {
		return sao.getcode(mcode);
	}

	@Override
	public void setcode(String mcode, ArrayList<String> y) {
		sao.setcode(mcode, y);
	}
	
}
