package com.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mybatis.dao.BoardDAO;
import com.mybatis.dao.SaveDAO;
import com.mybatis.vo.Board;
import com.mybatis.vo.Save;

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
	public List<String> selectMFoodList(String mcode) {
		return sao.selectMFoodList(mcode);
	}

	@Override
	public void delete(String mcode, String fcode) {
		sao.delete(mcode, fcode);
	}
	
}
