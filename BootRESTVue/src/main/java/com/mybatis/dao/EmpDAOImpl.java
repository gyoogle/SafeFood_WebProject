package com.mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mybatis.mapper.EmpMapper;
import com.mybatis.vo.Emp;
//DAO(CRUD)

@Component
public class EmpDAOImpl implements EmpDAO {

	@Autowired
	EmpMapper mapper;
	
	
	@Override
	public List<Emp> selectAll() {
		System.out.println(mapper);
		return mapper.selectAll();
	}

	@Override
	public Emp selectOne(String num) {
		return mapper.selectOne(num);
	}

	@Override
	public void insert(Emp c) {
		mapper.insert(c);
	}
	@Override
	public List<Emp> findByName(String name) {
		return mapper.findByName(name);
	}
}
