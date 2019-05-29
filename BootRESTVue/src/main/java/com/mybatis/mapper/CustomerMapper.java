package com.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.mybatis.vo.Customer;

//DAO(CustomerDAOImpl)를 위한 인터페이스
public interface CustomerMapper {

	public List<Customer> selectAll();
	public Customer selectOne(String num);
	public void insert(Customer c);
	public void delete(String num);
	public void update(Customer c);
	public List<Customer> findByAddress(String address);
	public void insert2(HashMap map);
	
}
