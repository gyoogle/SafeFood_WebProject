package com.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import com.mvc.vo.Save;

public interface SaveDAO {
	public List<Save> selectAll();
	public Save selectOne(String num); // scode
	public void insert(Save s);
	public void delete(String num);
	public ArrayList<String> getcode(String mcode);
	public void setcode(String mcode, ArrayList<String> y);
}
