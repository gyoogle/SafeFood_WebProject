package com.mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mybatis.mapper.CustomerMapper;
import com.mybatis.vo.Customer;
//DAO(CRUD)

@Component
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	CustomerMapper mapper;
	
	
	@Override
	public List<Customer> selectAll() {
		System.out.println(mapper);
		return mapper.selectAll();
	}

	@Override
	public Customer selectOne(String num) {
		return mapper.selectOne(num);
	}

	@Override
	public void insert(Customer c) {
		mapper.insert(c);
	}

	@Override
	public void delete(String num) {
		mapper.delete(num);
	}

	@Override
	public void update(Customer c) {
		mapper.update(c);
	}

	@Override
	public List<Customer> findByAddress(String address) {
		return mapper.findByAddress(address);
	}

	@Override
	public void insert2(HashMap map) {
		mapper.insert2(map);
	}

}
