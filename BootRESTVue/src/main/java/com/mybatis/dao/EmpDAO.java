package com.mybatis.dao;

import java.util.List;

import com.mybatis.vo.Emp;

//Client(EmpApp.java)를 위한 인터페이스
public interface EmpDAO {

	public List<Emp> selectAll();
	public Emp selectOne(String id);
	public void insert(Emp c);
	public List<Emp> findByName(String name);
	
}
