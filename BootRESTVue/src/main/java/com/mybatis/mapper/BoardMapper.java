package com.mybatis.mapper;

import java.util.List;

import com.mybatis.vo.Board;


public interface BoardMapper {
	public List<Board> selectAll();
	public Board selectOne(String num);
	public void insert(Board c);
	public void delete(String num);
	public void updateCount(String num);
	public void modify(Board b);
	public List<Board> findByTitle(String title);
	public List<Board> findByName(String name);
}
