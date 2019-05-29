package com.mybatis.mapper;

import java.util.List;

import com.mybatis.vo.Eatlist;

public interface EatlistMapper {
	public void insert(Eatlist el);
	public void delete(String mcode, String fcode);
	public List<Eatlist> selectAll();
	public List<String> selectMFoodList(String mcode);
	public List<String> selectMFoodMaterial(String mcode);
}
