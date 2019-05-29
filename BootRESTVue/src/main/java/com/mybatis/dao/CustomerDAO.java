package com.mybatis.dao;

import java.util.HashMap;
import java.util.List;

import com.mybatis.vo.Customer;

//Client(CustomerApp.java)를 위한 인터페이스
public interface CustomerDAO {

	public List<Customer> selectAll();
	public Customer selectOne(String num);
	public void insert(Customer c);
	public void insert2(HashMap map);
	public void delete(String num);
	public void update(Customer c);
	public List<Customer> findByAddress(String address);
	
}
