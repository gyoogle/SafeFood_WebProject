package com.mybatis.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mybatis.dao.CustomerDAO;
import com.mybatis.vo.Customer;

@Component("service")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAO dao;
	
	@Override
	public List<Customer> selectAll() {
		return dao.selectAll();
	}

	@Override
	public Customer selectOne(String num) {
		return dao.selectOne(num);
	}

	@Override
	public void insert(Customer c) {
		dao.insert(c);
	}

	@Override
	public void insert2(HashMap map) {
		dao.insert2(map);
	}

	@Override
	public void delete(String num) {
		dao.delete(num);
	}

	@Override
	public void update(Customer c) {
		dao.update(c);
	}

	@Override
	public List<Customer> findByAddress(String address) {
		return dao.findByAddress(address);
	}

}
