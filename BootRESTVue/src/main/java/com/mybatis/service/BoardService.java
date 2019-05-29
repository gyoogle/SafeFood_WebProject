package com.mybatis.service;

import java.util.List;

import com.mybatis.vo.Board;

public interface BoardService {
	public List<Board> selectAll();
	public Board selectOne(String num);
	public void insert(Board b);
	public void delete(String num);
	
	//homework
	public void modify(Board b);
	public List<Board> findByTitle(String title);
	public List<Board> findByName(String name);
}
