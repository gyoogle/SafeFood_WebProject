package com.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mybatis.dao.BoardDAO;
import com.mybatis.vo.Board;

/** */
//@Component("serviceBoard")
@Service("serviceBoard")
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Transactional
	@Override
	public List<Board> selectAll() {
		return dao.selectAll();
	}

	@Transactional
	@Override
	public Board selectOne(String num) {
		dao.updateCount(num);
		return dao.selectOne(num);
	}

	@Override
	public void insert(Board b) {
		dao.insert(b);
	}

	@Override
	public void delete(String num) {
		dao.delete(num);
	}

	@Override
	public void modify(Board b) {
		dao.modify(b);
	}

	@Override
	public List<Board> findByTitle(String title) {
		return dao.findByTitle(title);
	}

	@Override
	public List<Board> findByName(String name) {
		return dao.findByName(name);
	}

}
