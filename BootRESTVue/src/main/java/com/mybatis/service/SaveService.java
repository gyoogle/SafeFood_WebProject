package com.mybatis.service;

import java.util.List;
import com.mybatis.vo.Save;

public interface SaveService {
	public List<Save> selectAll();
	public Save selectOne(String num); // scode
	public void insert(Save s);
	public void delete(String mcode, String fcode);
	public List<String> selectMFoodList(String mcode);
}
