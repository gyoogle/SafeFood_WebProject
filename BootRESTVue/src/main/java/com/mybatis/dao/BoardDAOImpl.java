package com.mybatis.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mybatis.mapper.BoardMapper;
import com.mybatis.vo.Board;

//@Component
//repository
@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	BoardMapper mapper;
	
	@Override
	public List<Board> selectAll() {
		System.out.println(mapper);
		return mapper.selectAll();
	}

	@Override
	public Board selectOne(String num) {
		return mapper.selectOne(num);
	}

	@Override
	public void insert(Board b) {
		mapper.insert(b);
		
	}

	@Override
	public void delete(String num) {
		mapper.delete(num);
		
	}

	@Override
	public void updateCount(String num) {
		mapper.updateCount(num);
	}

	@Override
	public void modify(Board b) {
		mapper.modify(b);
	}

	@Override
	public List<Board> findByTitle(String title) {
		return mapper.findByTitle(title);
	}

	@Override
	public List<Board> findByName(String name) {
		// TODO Auto-generated method stub
		return mapper.findByName(name);
	}
}
